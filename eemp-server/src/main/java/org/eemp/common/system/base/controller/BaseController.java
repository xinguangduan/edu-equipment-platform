package org.eemp.common.system.base.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.shiro.SecurityUtils;
import org.eemp.common.api.vo.Result;
import org.eemp.common.constant.CommonConstant;
import org.eemp.common.poi.def.NormalExcelConstants;
import org.eemp.common.poi.excel.ExcelImportUtil;
import org.eemp.common.poi.excel.entity.ExportParams;
import org.eemp.common.poi.excel.entity.ImportParams;
import org.eemp.common.poi.excel.entity.enmus.ExcelType;
import org.eemp.common.poi.view.JeecgEntityExcelView;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.system.util.JwtUtil;
import org.eemp.common.system.vo.LoginUser;
import org.eemp.common.util.oConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: Controller基类
 * @Author: dangzhenghui@163.com
 * @Date: 2019-4-21 8:13
 * @Version: 1.0
 */
@Slf4j
public class BaseController<T, S extends IService<T>> {
    /**
     * issues/2933 JeecgController注入service时改用protected修饰，能避免重复引用service
     */
    @Autowired
    protected S service;

    @Value("${eemp.path.upload}")
    private String upLoadPath;

    /**
     * 导出excel
     *
     * @param request
     */
    protected ModelAndView exportXls(HttpServletRequest request, T object, Class<T> clazz, String title) {
        // Step.1 组装查询条件
        QueryWrapper<T> queryWrapper = QueryGenerator.initQueryWrapper(object, request.getParameterMap());
        LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();

        // 过滤选中数据
        String selections = request.getParameter("selections");
        if (oConvertUtils.isNotEmpty(selections)) {
            List<String> selectionList = Arrays.asList(selections.split(","));
            queryWrapper.in("id", selectionList);
        }
        // Step.2 获取导出数据
        List<T> exportList = service.list(queryWrapper);

        // Step.3 AutoPoi 导出Excel
        ModelAndView mv = new ModelAndView(new JeecgEntityExcelView());
        //此处设置的filename无效 ,前端会重更新设置一下
        mv.addObject(NormalExcelConstants.FILE_NAME, title);
        mv.addObject(NormalExcelConstants.CLASS, clazz);
        //update-begin--Author:liusq  Date:20210126 for：图片导出报错，ImageBasePath未设置--------------------
        ExportParams exportParams = new ExportParams(title + "报表", "导出人:" + sysUser.getRealname(), title);
        exportParams.setImageBasePath(upLoadPath);
        //update-end--Author:liusq  Date:20210126 for：图片导出报错，ImageBasePath未设置----------------------
        mv.addObject(NormalExcelConstants.PARAMS, exportParams);
        mv.addObject(NormalExcelConstants.DATA_LIST, exportList);
        return mv;
    }

    /**
     * 根据每页sheet数量导出多sheet
     *
     * @param request
     * @param object       实体类
     * @param clazz        实体类class
     * @param title        标题
     * @param exportFields 导出字段自定义
     * @param pageNum      每个sheet的数据条数
     * @param request
     */
    protected ModelAndView exportXlsSheet(HttpServletRequest request, T object, Class<T> clazz, String title, String exportFields, Integer pageNum) {
        // Step.1 组装查询条件
        QueryWrapper<T> queryWrapper = QueryGenerator.initQueryWrapper(object, request.getParameterMap());
        LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();
        // Step.2 计算分页sheet数据
        double total = service.count();
        int count = (int) Math.ceil(total / pageNum);
        //update-begin-author:liusq---date:20220629--for: 多sheet导出根据选择导出写法调整 ---
        // Step.3  过滤选中数据
        String selections = request.getParameter("selections");
        if (oConvertUtils.isNotEmpty(selections)) {
            List<String> selectionList = Arrays.asList(selections.split(","));
            queryWrapper.in("id", selectionList);
        }
        //update-end-author:liusq---date:20220629--for: 多sheet导出根据选择导出写法调整 ---
        // Step.4 多sheet处理
        List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
        for (int i = 1; i <= count; i++) {
            Page<T> page = new Page<T>(i, pageNum);
            IPage<T> pageList = service.page(page, queryWrapper);
            List<T> exportList = pageList.getRecords();
            Map<String, Object> map = new HashMap<>(5);
            ExportParams exportParams = new ExportParams(title + "报表", "导出人:" + sysUser.getRealname(), title + i, upLoadPath);
            exportParams.setType(ExcelType.XSSF);
            //map.put("title",exportParams);
            //表格Title
            map.put(NormalExcelConstants.PARAMS, exportParams);
            //表格对应实体
            map.put(NormalExcelConstants.CLASS, clazz);
            //数据集合
            map.put(NormalExcelConstants.DATA_LIST, exportList);
            listMap.add(map);
        }
        // Step.4 AutoPoi 导出Excel
        ModelAndView mv = new ModelAndView(new JeecgEntityExcelView());
        //此处设置的filename无效 ,前端会重更新设置一下
        mv.addObject(NormalExcelConstants.FILE_NAME, title);
        mv.addObject(NormalExcelConstants.MAP_LIST, listMap);
        return mv;
    }


    /**
     * 根据权限导出excel，传入导出字段参数
     *
     * @param request
     */
    protected ModelAndView exportXls(HttpServletRequest request, T object, Class<T> clazz, String title, String exportFields) {
        ModelAndView mv = this.exportXls(request, object, clazz, title);
        mv.addObject(NormalExcelConstants.EXPORT_FIELDS, exportFields);
        return mv;
    }

    /**
     * 获取对象ID
     *
     * @return
     */
    private String getId(T item) {
        try {
            return PropertyUtils.getProperty(item, "id").toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 通过excel导入数据
     *
     * @param request
     * @param response
     * @return
     */
    protected Result<?> importExcel(HttpServletRequest request, HttpServletResponse response, Class<T> clazz) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 获取上传文件对象
            MultipartFile file = entity.getValue();
            ImportParams params = new ImportParams();
            params.setTitleRows(2);
            params.setHeadRows(1);
            params.setNeedSave(true);
            try {
                List<T> list = ExcelImportUtil.importExcel(file.getInputStream(), clazz, params);
                //update-begin-author:taoyan date:20190528 for:批量插入数据
                long start = System.currentTimeMillis();
                service.saveBatch(list);
                //400条 saveBatch消耗时间1592毫秒  循环插入消耗时间1947毫秒
                //1200条  saveBatch消耗时间3687毫秒 循环插入消耗时间5212毫秒
                log.info("消耗时间" + (System.currentTimeMillis() - start) + "毫秒");
                //update-end-author:taoyan date:20190528 for:批量插入数据
                return Result.ok("文件导入成功！数据行数：" + list.size());
            } catch (Exception e) {
                //update-begin-author:taoyan date:20211124 for: 导入数据重复增加提示
                String msg = e.getMessage();
                log.error(msg, e);
                if (msg != null && msg.indexOf("Duplicate entry") >= 0) {
                    return Result.error("文件导入失败:有重复数据！");
                } else {
                    return Result.error("文件导入失败:" + e.getMessage());
                }
                //update-end-author:taoyan date:20211124 for: 导入数据重复增加提示
            } finally {
                try {
                    file.getInputStream().close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return Result.error("文件导入失败！");
    }

    // 解析单元格数据  -> 返回字符串
    public synchronized static String parseCell(Cell cell, int rowIndex, int cellIndex) {
        String cellStr = null;
        if (cell == null) {
            log.warn("parse cell is null, row index={}, cell index= {}", rowIndex, cellIndex);
            return null;
        }
        switch (cell.getCellTypeEnum()) {// 判断单元格的类型 不同版本API可能过时
            case STRING: //字符串类型单元格
                cellStr = cell.getRichStringCellValue().toString();
                break;
            case BLANK: //空数据
                cellStr = "";
                break;
            case NUMERIC: // 数字类型 包含日期、时间、数字
                //判断日期【年月日2016-12-20  | 时分10:20】类型
                if (HSSFDateUtil.isCellDateFormatted(cell)) { //判断具体类型，是日期还是时间
                    SimpleDateFormat sdf = null;
                    if (cell.getCellStyle().getDataFormat() == HSSFDataFormat.getBuiltinFormat("h:mm")) {
                        //时间
                        sdf = new SimpleDateFormat("HH:mm");
                    } else {
                        //日期
                        sdf = new SimpleDateFormat("yyyy-MM-dd");
                    }
                    Date temp = cell.getDateCellValue();
                    cellStr = sdf.format(temp);
                } else { //数字
                    double temp = cell.getNumericCellValue();
                    DecimalFormat format = new DecimalFormat();//数字格式化工具
                    //查看单元格中的具体样式类型
                    String formatStr = cell.getCellStyle().getDataFormatString();
                    if (formatStr.equals("General")) {
                        /**
                         * 格式化正则
                         * 保留整数 #
                         * 保留一位小数 #.#
                         * 保留两位小数#.##
                         */
                        format.applyPattern("#.##");
                    }
                    cellStr = format.format(temp);
                }
                break;
            default:
                cellStr = "";
        }
        return cellStr.trim();
    }

    public String getLoginUserName(HttpServletRequest request) {
        String token = request.getHeader(CommonConstant.X_ACCESS_TOKEN);
        if (oConvertUtils.isEmpty(token)) {
            return null;
        }
        return JwtUtil.getUsername(token);
    }
}
