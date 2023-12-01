package org.eemp.modules.edu.foudation.service;

import com.alibaba.fastjson.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;

@ActiveProfiles("min")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class FillingControlServiceTest {
    @Autowired
    private IFillingControlService service;

    @Test
    void testGetCurrentFillingControl() {
        Date testDate = new Date(2023 - 1900, Calendar.OCTOBER, 5);
        JSONObject json = service.getFillingControl("demo_01", "edu_informatization_basic_info_1", testDate, 1);
        assertThat(json.get("addable")).isEqualTo(true);
        assertThat(json.get("reportable")).isNull();
        assertThat(json.get("revokable")).isNull();
        System.out.println(json);

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        testDate = new Date(2023 - 1900, Calendar.AUGUST, 29);
        json = service.getFillingControl("demo_01", "edu_informatization_basic_info_1", testDate, 10);
        assertThat(json).isNull();
    }

    @Test
    void testGetAnotherCurrentFillingControl() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 2023);
        calendar.set(Calendar.MONTH, Calendar.DECEMBER);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        Date testDate = calendar.getTime();
        JSONObject json = service.getFillingControl("3142000822", "edu_informatization_basic_info_1", testDate, 1);
        assertThat(json).isNull();

        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        testDate = calendar.getTime();
        json = service.getFillingControl("3142000822", "edu_informatization_basic_info_1", testDate, 1);
        assertThat(json.get("addable")).isEqualTo(true);
        assertThat(json.get("reportable")).isNull();
        assertThat(json.get("revokable")).isNull();
        System.out.println(json);

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        testDate = new Date(2023 - 1900, Calendar.DECEMBER, 2);
        json = service.getFillingControl("3142000822", "edu_informatization_basic_info_1", testDate, 2);
        assertThat(json).isNull();
    }

    @Test
    void testUpdateFillingControl() throws ParseException {
        Date testDate = new Date(2023 - 1900, Calendar.FEBRUARY, 18);
        JSONObject json = service.getFillingControl("school_02", "edu_informatization_basic_info_1", testDate, 10);
        assertThat(json.get("addable")).isEqualTo(true);
        assertThat(json.get("reportable")).isNull();
        assertThat(json.get("revokable")).isNull();
        System.out.println(json);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        testDate = dateFormat.parse("2023-02-20");
        String id = "12368";
        boolean result = service.updateFillingControlAfterNewData("school_02", "edu_informatization_basic_info_1", id, 1);
        assertThat(result).isTrue();
        json = service.getFillingControl("school_02", "edu_informatization_basic_info_1");
        assertThat(json.get("addable")).isNull();
        assertThat(json.get("reportable")).isEqualTo(true);
        assertThat(json.get("revokable")).isNull();
        assertThat(json.get("id")).isEqualTo(id);
        System.out.println(json);

        testDate = dateFormat.parse("2023-02-22");
        result = service.updateFillingControlAfterReported("school_02", "edu_informatization_basic_info_1");
        assertThat(result).isTrue();
        json = service.getFillingControl("school_02", "edu_informatization_basic_info_1");
        assertThat(json.get("addable")).isNull();
        assertThat(json.get("reportable")).isNull();
        assertThat(json.get("revokable")).isEqualTo(true);
        assertThat(json.get("id")).isEqualTo(id);
        System.out.println(json);

        testDate = dateFormat.parse("2023-02-26");
        result = service.updateFillingControlAfterRevoked("school_02", "edu_informatization_basic_info_1");
        assertThat(result).isTrue();
        json = service.getFillingControl("school_02", "edu_informatization_basic_info_1");
        assertThat(json.get("addable")).isNull();
        assertThat(json.get("reportable")).isEqualTo(true);
        assertThat(json.get("revokable")).isNull();
        assertThat(json.get("id")).isEqualTo(id);
        System.out.println(json);

        testDate = dateFormat.parse("2023-02-28");
        result = service.updateFillingControlAfterDeleteData("school_02", "edu_informatization_basic_info_1", id);
        assertThat(result).isTrue();
        json = service.getFillingControl("school_02", "edu_informatization_basic_info_1", testDate, 10);
        assertThat(json).isNotNull();
    }

    @Test
    void testWholeFillingControlProcess() throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date testDate = dateFormat.parse("2023-02-16");
        JSONObject json = service.getFillingControl("school_03", "edu_informatization_basic_info_1", testDate, 10);
        assertThat(json.get("addable")).isEqualTo(true);
        System.out.println(json);
        String id = "school_03: 4928732";
        boolean result = service.updateFillingControlAfterNewData("school_03", "edu_informatization_basic_info_1", id, 1);
        assertThat(result).isTrue();
        json = service.getFillingControl("school_03", "edu_informatization_basic_info_1");
        assertThat(json.get("reportable")).isEqualTo(true);
        assertThat(json.get("id")).isEqualTo(id);
        System.out.println(json);

        json = service.getFillingControl("school_04", "edu_informatization_basic_info_2", testDate, 10);
        assertThat(json.get("addable")).isEqualTo(true);
        System.out.println(json);
        id = "school_04: abc12368";
        result = service.updateFillingControlAfterNewData("school_04", "edu_informatization_basic_info_1", id, 1);
        assertThat(result).isFalse();
        result = service.updateFillingControlAfterNewData("school_04", "edu_informatization_basic_info_2", id, 1);
        assertThat(result).isTrue();
        json = service.getFillingControl("school_04", "edu_informatization_basic_info_2");
        assertThat(json.get("reportable")).isEqualTo(true);
        assertThat(json.get("id")).isEqualTo(id);
        System.out.println(json);
        result = service.updateFillingControlAfterReported("school_04", "edu_informatization_basic_info_2");
        assertThat(result).isTrue();
        json = service.getFillingControl("school_04", "edu_informatization_basic_info_2");
        assertThat(json.get("revokable")).isEqualTo(true);
        System.out.println(json);

        testDate = dateFormat.parse("2023-02-17");
        result = service.updateFillingControlAfterReported("school_03", "edu_informatization_basic_info_1");
        assertThat(result).isTrue();
        json = service.getFillingControl("school_03", "edu_informatization_basic_info_1");
        assertThat(json.get("revokable")).isEqualTo(true);
        System.out.println(json);

        testDate = dateFormat.parse("2023-02-18");
        result = service.updateFillingControlAfterRevoked("school_03", "edu_informatization_basic_info_1");
        assertThat(result).isTrue();
        json = service.getFillingControl("school_03", "edu_informatization_basic_info_1");
        assertThat(json.get("reportable")).isEqualTo(true);
        System.out.println(json);
    }
}
