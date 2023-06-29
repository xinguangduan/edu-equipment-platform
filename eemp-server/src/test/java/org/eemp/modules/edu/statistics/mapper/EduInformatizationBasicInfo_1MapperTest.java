package org.eemp.modules.edu.statistics.mapper;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.test.autoconfigure.MybatisPlusTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@MybatisPlusTest
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
    }

}