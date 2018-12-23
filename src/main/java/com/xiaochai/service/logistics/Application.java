package com.xiaochai.service.logistics;

import org.apache.log4j.Logger;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.io.IOException;

@EnableSwagger2
@MapperScan("com.xiaochai.service.logistics.mapper")
@SpringBootApplication
 //启动入口
public class Application {

    private static Logger logger = Logger.getLogger(Application.class);

    public static void main(String[] args) throws IOException {
        SpringApplication.run(Application.class, args);
        logger.info("============= SpringBoot Start Success =============");
    }
}
