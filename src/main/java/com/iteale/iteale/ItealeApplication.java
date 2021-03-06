package com.iteale.iteale;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
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
            		"/user",
            		"/message",
            		"/follower",
            		"/support");
        }
    	
    	@Override
    	public void addResourceHandlers(ResourceHandlerRegistry registry) {
    		registry.addResourceHandler("/avatar/**").addResourceLocations("classpath:/avatar/");
    	}
    	
    	public MultipartResolver multipartResolver() {
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
            multipartResolver.setMaxUploadSize(500000000);
            return multipartResolver;
        }
    }
}
