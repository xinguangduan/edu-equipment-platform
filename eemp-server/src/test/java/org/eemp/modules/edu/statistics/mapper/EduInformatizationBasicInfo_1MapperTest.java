package org.eemp.modules.edu.statistics.mapper;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.test.autoconfigure.MybatisPlusTest;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;

@MybatisPlusTest
//@MapperScan("org.eemp.modules.**.mapper")
class EduInformatizationBasicInfo_1MapperTest {
    @Autowired
    private EduInformatizationBasicInfo_1Mapper mapper;

    @Test
    void testGetYearlyRecord() throws ParseException {
        Date dayStart = new SimpleDateFormat("yyyy-MM-dd").parse("2019-01-01");
        Date dayEnd = new Date();
        List<Map<String,Object>> result = mapper.findNewestYearlyRecord(dayStart, dayEnd, DbType.H2.getDb());
        result.forEach(System.out::println);
        assertThat(result.size()).isEqualTo(11);
        assertThat(result.stream().anyMatch(val -> val.get("ID").equals("209"))).isFalse();
        assertThat(result.stream().anyMatch(val -> val.get("ID").equals("210"))).isTrue();
    }

    @Test
    void testGetSemesterlyRecord() throws ParseException {
        Date dayStart = new SimpleDateFormat("yyyy-MM-dd").parse("2019-01-01");
        Date dayEnd = new Date();
        List<Map<String,Object>> result = mapper.findNewestSemesterlyRecord(dayStart, dayEnd, DbType.H2.getDb());
        result.forEach(System.out::println);
        assertThat(result.size()).isEqualTo(12);
        assertThat(result.stream().anyMatch(val -> val.get("ID").equals("208"))).isFalse();
        assertThat(result.stream().anyMatch(val -> val.get("ID").equals("209"))).isTrue();
    }

    @Test
    void testGetTeacherNumberInfo() throws ParseException {
        Date dayStart = new SimpleDateFormat("yyyy-MM-dd").parse("2019-01-01");
        Date dayEnd = new Date();
        List<Map<String,Object>> result = mapper.getTeacherNumberInfo(dayStart, dayEnd, DbType.H2.getDb());
        result.forEach(System.out::println);
        assertThat(result.size()).isEqualTo(12);
        assertThat(result.stream().filter(val -> val.get("CHART_GROUP").equals("中心小学"))).hasSize(3);
        assertThat(result.stream().filter(val -> val.get("CHART_GROUP").equals("中心小学"))).
                anyMatch(val -> val.get("TYPE").equals("2023上半年")).
                anyMatch(val -> val.get("VALUE").equals(310L));
        assertThat(result.stream().filter(val -> val.get("CHART_GROUP").equals("中心小学")).filter(val -> val.get("TYPE").equals("2023下半年"))).
                allMatch(val -> val.get("VALUE").equals(151L));
    }

}