package com.grownited;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = "com.grownited.entity")
public class UrbanServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(UrbanServiceApplication.class, args);
	}

}
