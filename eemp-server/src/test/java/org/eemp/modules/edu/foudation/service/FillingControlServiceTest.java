package org.eemp.modules.edu.foudation.service;

import com.alibaba.fastjson.JSONObject;
import org.eemp.modules.edu.foudation.entity.FillingControl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

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

}
