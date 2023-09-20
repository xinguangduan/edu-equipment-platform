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
        System.out.println(service.list());

        List<FillingControl> fillingControlList = new ArrayList<>();
        FillingControl fc = new FillingControl().setId("201").setControlType("01").setControlName("2022年下半年填报")
                .setStartDate(new Date(2022 - 1900, Calendar.SEPTEMBER, 1))
                .setEndDate(new Date(2022 - 1900, Calendar.OCTOBER, 31))
                .setCheckStartDate(new Date(2023 - 1900, Calendar.DECEMBER, 1))
                .setCheckEndDate(new Date(2023 - 1900, Calendar.DECEMBER, 15));
        fillingControlList.add(fc);
        fc = new FillingControl().setId("202").setControlType("01").setControlName("2023年上半年填报")
                .setStartDate(new Date(2023 - 1900, Calendar.FEBRUARY, 16))
                .setEndDate(new Date(2023 - 1900, Calendar.APRIL, 15))
                .setCheckStartDate(new Date(2023 - 1900, Calendar.APRIL, 16))
                .setCheckEndDate(new Date(2023 - 1900, Calendar.APRIL, 30));
        fillingControlList.add(fc);
        fc = new FillingControl().setId("203").setControlType("01").setControlName("2023年下半年填报")
                .setStartDate(new Date(2023 - 1900, Calendar.SEPTEMBER, 6))
                .setEndDate(new Date(2023 - 1900, Calendar.OCTOBER, 5))
                .setCheckStartDate(new Date(2023 - 1900, Calendar.DECEMBER, 6))
                .setCheckEndDate(new Date(2023 - 1900, Calendar.DECEMBER, 15))
                .setNurserySchool("demo_06,demo_01x,demo_02")
                .setPrimarySchool("demo_010")
                .setJuniorSchool("demo_03,demo_01");
        fillingControlList.add(fc);
        service.saveBatch(fillingControlList);

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
