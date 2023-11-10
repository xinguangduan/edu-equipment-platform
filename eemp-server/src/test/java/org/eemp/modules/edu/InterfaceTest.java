package org.eemp.modules.edu;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.eemp.common.api.vo.Result;
import org.eemp.common.constant.CommonConstant;
import org.eemp.common.util.Md5Util;
import org.eemp.common.util.RedisUtil;
import org.eemp.config.JeecgBaseConfig;
import org.eemp.modules.system.model.SysLoginModel;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.*;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

@ActiveProfiles("test")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@Slf4j
public class InterfaceTest {
    @Autowired
    private JeecgBaseConfig jeecgBaseConfig;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private RestTemplate restTemplate;

    private static String token = null;

    @Test
    void testLoginAndGetSchoolTreeData() {
        gatherTokenAfterLogin();

        String url = "http://localhost:8080/eemp/org.eemp.modules.edu.foudation/organizationDefinition/getSchoolTreeData?token={token}";
        Map<String, String> uriVariables = new HashMap<>();
        uriVariables.put("token", token);

        Result<List<Map>> response = restTemplate.getForObject(url, Result.class, uriVariables);
        log.info("查询学校树结果：" + response.getResult());
        assertThat(response.getResult().stream().filter(it -> {
            return ((it.get("key").equals("ns") && it.get("title").equals("幼儿园")) ||
                    (it.get("key").equals("cps") && it.get("title").equals("中心小学")) ||
                    (it.get("key").equals("fps") && it.get("title").equals("完全小学")) ||
                    (it.get("key").equals("js") && it.get("title").equals("初中")) ||
                    (it.get("key").equals("ss") && it.get("title").equals("高中"))
            ) && it.containsKey("children");
        }).collect(Collectors.groupingBy(item -> item.get("key"))).size()).isEqualTo(5);

        JSONArray json = (JSONArray) JSON.toJSON(response.getResult());
        System.out.println("json: " + json);
    }

    @Test
    void testLoginAndImportSchoolData() {
        gatherTokenAfterLogin();

        deleteLastTestData();

        String url = "http://localhost:8080/eemp/org.eemp.modules.edu.foudation/organizationDefinition/importExcel";
        MultiValueMap<String, Object> multiValueMap = new LinkedMultiValueMap<>();
        multiValueMap.add("file", new ClassPathResource("/学校管理.xls"));
        multiValueMap.add("token", token);
//        // 另一种可行方式
//        RequestEntity<MultiValueMap<String, Object>> requestEntity = RequestEntity.post(url).contentType(MediaType.MULTIPART_FORM_DATA).body(multiValueMap);
//        ResponseEntity<Result> response = restTemplate.exchange(requestEntity, Result.class);
//        log.info("查询学校树结果：" + response.getBody().getResult());
        Result<String> response = restTemplate.postForObject(url, multiValueMap, Result.class);
        log.info("查询学校树结果：" + response);
        assertThat(response.isSuccess()).isTrue();
        assertThat(response.getMessage()).containsPattern("添加成功！");
        assertThat(response.getResult()).containsPattern("文件导入成功！数据行数：");
    }

    private void gatherTokenAfterLogin() {
        if (null != token)
            return;

        //生成验证码
//        String code = RandomUtil.randomString(BASE_CHECK_CODES,4);
//        String lowerCaseCode = code.toLowerCase();
        // 预埋验证码
        String lowerCaseCode = "1u8t";
        String key = "9169ea44fee2e773df644053d67c94a1";
        // 参照 LoginController 中 /randomImage/{key} 对应方法 randomImage(key)
        String origin = lowerCaseCode + key + jeecgBaseConfig.getSignatureSecret();
        String realKey = Md5Util.md5Encode(origin, "utf-8");

        redisUtil.set(realKey, lowerCaseCode, 60);
        log.info("预埋验证码，Redis key = {}，checkCode = {}", realKey, lowerCaseCode);

        String url = "http://localhost:8080/eemp/sys/login";

        SysLoginModel request = new SysLoginModel();
        request.setUsername("admin");
        request.setPassword("123456");
        request.setCaptcha(lowerCaseCode);
        request.setCheckKey(key);

        Result<JSONObject> response = restTemplate.postForObject(url, request, Result.class);

        assertThat(response.getCode()).isEqualTo(CommonConstant.SC_OK_200);
        System.out.println(response.getResult());

        token = (String) ((Map)response.getResult()).get("token");
    }

    private void deleteLastTestData() {
        String url = "http://localhost:8080/eemp/sys/user/queryByNames?token={token}&userNames={userNames}";

        Map<String, Object> uriVariables = new HashMap<>();
        uriVariables.put("token", token);
        uriVariables.put("userNames", "test_xgyey,test_xgxx,test_xgcz");

        Result<List<Map>> response = restTemplate.getForObject(url, Result.class, uriVariables);
        log.info("查询上次测试用户：" + response.getResult());
        assertThat(response.getResult().size()).isIn(0, 3);
        String userIds = response.getResult().stream().map(it -> (String) it.get("id")).collect(Collectors.joining(","));
        log.info("ids: " + userIds);
        if (null != userIds && !userIds.isEmpty()) {
            url = "http://localhost:8080/eemp/sys/user/deleteBatch?token={token}&ids={userIds}";
            Map<String, String> map = new HashMap<>();
            map.put("token", token);
            map.put("userIds", userIds);
//            HttpEntity<Map> httpEntity = new HttpEntity<>();
            Result<String> delResult = restTemplate.exchange(url, HttpMethod.DELETE, null, Result.class, map).getBody();
            log.info("逻辑删除上次测试用户结果：" + delResult);
            assertThat(delResult.isSuccess()).isTrue();
            assertThat(delResult.getResult()).isEqualTo("批量删除用户成功");

            url = "http://localhost:8080/eemp/sys/user/deleteRecycleBin?token={token}&userIds={userIds}";
            delResult = restTemplate.exchange(url, HttpMethod.DELETE, null, Result.class, map).getBody();
            log.info("彻底删除上次测试用户结果：" + delResult);
            assertThat(delResult.isSuccess()).isTrue();
            assertThat(delResult.getResult()).isEqualTo("删除成功");
        }

        url = "http://localhost:8080/eemp/org.eemp.modules.edu.foudation/organizationDefinition/list?token={token}&pageSize={pageSize}";
        uriVariables.put("pageSize", 100);
        Result<Map<String, List<Map<String, String>>>> listResult = restTemplate.getForObject(url, Result.class, uriVariables);
        log.info("学校列表查询：" + listResult);
        assertThat(listResult.getResult().get("records").size()).isGreaterThan(0);
        String schoolIds = listResult.getResult().get("records").stream().filter(it ->
                it.get("adminCode").equals("test_xgyey") ||
                it.get("adminCode").equals("test_xgxx") ||
                it.get("adminCode").equals("test_xgcz")
        ).map(it -> it.get("id")).collect(Collectors.joining(","));
        log.info("schoolIds: " + schoolIds);
        if (null != schoolIds && !schoolIds.isEmpty()) {
            url = "http://localhost:8080/eemp/org.eemp.modules.edu.foudation/organizationDefinition/deleteBatch?token={token}&ids={schoolIds}";
            Map<String, String> map = new HashMap<>();
            map.put("token", token);
            map.put("schoolIds", schoolIds);
            Result<String> delResult = restTemplate.exchange(url, HttpMethod.DELETE, null, Result.class, map).getBody();
            log.info("删除上次测试学校结果：" + delResult);
            assertThat(delResult.isSuccess()).isTrue();
            assertThat(delResult.getResult()).isEqualTo("批量删除成功!");
        }
    }
}