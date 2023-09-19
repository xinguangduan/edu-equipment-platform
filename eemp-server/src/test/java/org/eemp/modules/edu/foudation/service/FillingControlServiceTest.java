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
        FillingControl fc = new FillingControl().setId("201").setControlType("01").setFillingCode("2022-02").setControlName("2022年下半年填报")
                .setStartDate(new Date(2022 - 1900, Calendar.SEPTEMBER, 1))
                .setEndDate(new Date(2022 - 1900, Calendar.OCTOBER, 31));
        fillingControlList.add(fc);
        fc = new FillingControl().setId("202").setControlType("01").setFillingCode("2023-01").setControlName("2023年上半年填报")
                .setStartDate(new Date(2023 - 1900, Calendar.FEBRUARY, 16))
                .setEndDate(new Date(2023 - 1900, Calendar.APRIL, 15));
        fillingControlList.add(fc);
        fc = new FillingControl().setId("203").setControlType("01").setFillingCode("2023-02").setControlName("2023年下半年填报")
                .setStartDate(new Date(2023 - 1900, Calendar.SEPTEMBER, 6))
                .setEndDate(new Date(2023 - 1900, Calendar.OCTOBER, 5));
        fillingControlList.add(fc);
        service.saveBatch(fillingControlList);

        Date testDate = new Date(2023 - 1900, Calendar.OCTOBER, 5);
        JSONObject json = service.getFillingControl("demo_01", "edu_informatization_basic_info_1", testDate, 1);
        assertThat(json.get("fillingCode")).isEqualTo("2023-02");
        assertThat(json.get("startDate")).isEqualTo(new Date(2023 - 1900, Calendar.SEPTEMBER, 6));
        assertThat(json.get("endDate")).isEqualTo(new Date(2023 - 1900, Calendar.OCTOBER, 5));
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
