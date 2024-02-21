package vn.hoidanit.laptopshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

// @SpringBootApplication
// include >< exclude
@SpringBootApplication(exclude = {
		org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class,
		org.springframework.boot.actuate.autoconfigure.security.servlet.ManagementWebSecurityAutoConfiguration.class })
// @SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class LaptopshopApplication {
	public static void main(String[] args) {
		SpringApplication.run(LaptopshopApplication.class, args);
	}

}
