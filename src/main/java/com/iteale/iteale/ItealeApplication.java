package com.iteale.iteale;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.iteale.iteale.interceptor.LoginInterceptor;

@SpringBootApplication
public class ItealeApplication {

	public static void main(String[] args) {
		SpringApplication.run(ItealeApplication.class, args);
	}

    @Configuration
    static class ItealeWebMvcConfigurer implements WebMvcConfigurer {
    	public void addInterceptors(InterceptorRegistry registry) {
            registry
            .addInterceptor(new LoginInterceptor())
            .addPathPatterns(
            		"/setting",
            		"/post/**",
            		"/signout",
            		"/user");
        }
    }
}
