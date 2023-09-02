package org.eemp.modules.edu;

import com.baomidou.mybatisplus.test.autoconfigure.AutoConfigureMybatisPlus;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.redis.DataRedisTest;
import org.springframework.data.redis.core.*;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;

import static org.assertj.core.api.Assertions.assertThat;

@DataRedisTest
@AutoConfigureMybatisPlus
public class RedisTemplateTest {
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    RedisTemplate redisTemplate;

    @Test
    void testString() {
        ValueOperations<String, String> stringStringValueOperations = stringRedisTemplate.opsForValue();

        stringStringValueOperations.set("welcome", "duo", 5, TimeUnit.MILLISECONDS);
        stringStringValueOperations.set("hello", "world", 50, TimeUnit.MILLISECONDS);

        assertThat(stringStringValueOperations.get("hello")).isEqualTo("world");

        boolean result = stringStringValueOperations.setIfAbsent("welcome", "beijing", 20, TimeUnit.MILLISECONDS);
        assertThat(result).isTrue();
        assertThat(stringStringValueOperations.get("welcome")).isEqualTo("beijing");
    }

    @Test
    void testHash() {
        HashOperations<String, String, String> hashOperations = redisTemplate.opsForHash();

        hashOperations.put("myHash", "name", "大耳朵图图");
        HashMap<String, String> myHash = new HashMap<>();
        myHash.put("age", "3");
        myHash.put("city", "武汉");
        hashOperations.putAll("myHash", myHash);

        assertThat(hashOperations.get("myHash", "name")).isEqualTo("大耳朵图图");
        assertThat(hashOperations.keys("myHash")).contains("name", "age", "city");
        assertThat(hashOperations.values("myHash")).contains("大耳朵图图", "3", "武汉");
    }
}
