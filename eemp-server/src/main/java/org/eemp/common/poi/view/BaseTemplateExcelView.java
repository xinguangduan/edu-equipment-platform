/**
 * Copyright 2013-2015 JEECG (jeecgos@163.com)
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.eemp.common.poi.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.eemp.common.poi.def.NormalExcelConstants;
import org.eemp.common.util.ResourceUtil;
import org.springframework.stereotype.Controller;

/**
 * Excel 模板导出
 *
 * @author JEECG
 * @date 2014年6月30日 下午9:15:49
 */
@SuppressWarnings("unchecked")
@Controller("baseTemplateExcelView")
public class BaseTemplateExcelView extends MiniAbstractExcelView {

    public BaseTemplateExcelView() {
        super();
    }

    public final static String TEMPLATE_FILE_NAME = "template_file_name";

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String codedFileName = "临时文件";
        if (model.containsKey(NormalExcelConstants.FILE_NAME)) {
            codedFileName = (String) model.get(NormalExcelConstants.FILE_NAME);
        }

        // Step.1 组装查询条件
        ResourceUtil resourceUtil = new ResourceUtil();
        InputStream inputStream = null;
        try {
            inputStream = resourceUtil.getResource("equipment-template/" + codedFileName);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        Workbook workbook = null;
//       boolean xlsx= codedFileName.endsWith(".xlsx");
        String[] strs = codedFileName.split("\\.");
        String suffix = strs[1];
        if ("xls".equals(suffix)) {// 2003版的解析方式
            try {
                workbook = new HSSFWorkbook(inputStream);
            } catch (IOException e) {
                logger.error(e);
            }
        } else if ("xlsx".equals(suffix)) {// 2007版本Excel
            try {
                workbook = new XSSFWorkbook(inputStream);
            } catch (IOException e) {
                logger.error(e);
            }
        }


        if (workbook instanceof HSSFWorkbook) {
            codedFileName += HSSF;
        } else {
            codedFileName += XSSF;
        }
        if (isIE(request)) {
            codedFileName = java.net.URLEncoder.encode(codedFileName, "UTF8");
        } else {
            codedFileName = new String(codedFileName.getBytes("UTF-8"), "ISO-8859-1");
        }
        response.setHeader("content-disposition", "attachment;filename=" + codedFileName);
        ServletOutputStream out = response.getOutputStream();
        workbook.write(out);
        out.flush();
    }
}
