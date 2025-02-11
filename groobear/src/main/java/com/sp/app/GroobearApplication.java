package com.sp.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// @SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@SpringBootApplication
public class GroobearApplication {

	public static void main(String[] args) {
		SpringApplication.run(GroobearApplication.class, args);
	}

}
