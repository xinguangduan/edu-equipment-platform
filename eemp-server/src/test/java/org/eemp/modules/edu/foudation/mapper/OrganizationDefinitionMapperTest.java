package org.eemp.modules.edu.foudation.mapper;

import com.baomidou.mybatisplus.test.autoconfigure.MybatisPlusTest;
import org.assertj.core.data.Percentage;
import org.eemp.modules.edu.foudation.entity.OrganizationDefinition;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.assertj.core.api.Assertions.assertThat;

@MybatisPlusTest
@MapperScan("org.eemp.modules.**.mapper")
public class OrganizationDefinitionMapperTest {
    @Autowired
    private OrganizationDefinitionMapper mapper;

    @Test
    void testUpdateLastLoginTime() {
        OrganizationDefinition result = mapper.selectById(104);
        System.out.println(result);
        assertThat(result.getId()).isEqualTo("104");
        assertThat(result.getLastLoginTime()).isNull();

        Date oneDate = new Date(2023 - 1900, 6, 3);
        result.setLastLoginTime(oneDate);
        int rst = mapper.updateById(result);
        assertThat(rst).isEqualTo(1);

        result = mapper.selectById(104);
        System.out.println(result);
        assertThat(result.getId()).isEqualTo("104");
        assertThat(result.getTownship()).isEqualTo("11");
        assertThat(result.getLastLoginTime()).isEqualTo(oneDate);

        result.setTownship("12");
        Date currentDate = new Date();
        rst = mapper.updateLastLoginTimeByAdminCode(result.getAdminCode());
        assertThat(rst).isEqualTo(1);

        result = mapper.selectById(104);
        System.out.println(result);
        assertThat(result.getId()).isEqualTo("104");
        assertThat(result.getTownship()).isEqualTo("11");
        assertThat(result.getLastLoginTime().getTime()).isCloseTo(new Date().getTime(), Percentage.withPercentage(0.0001));
    }
}
