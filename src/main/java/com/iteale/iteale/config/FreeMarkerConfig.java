package com.iteale.iteale.config;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration  
public class FreeMarkerConfig {
      
    @Autowired    
    protected freemarker.template.Configuration configuration;    
    @Autowired    
    protected org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver resolver;    
    @Autowired    
    protected org.springframework.web.servlet.view.InternalResourceViewResolver springResolver;    
      
    @PostConstruct
    public void  setSharedVariable(){
        resolver.setSuffix(".ftl");
        resolver.setCache(false);   
        resolver.setRequestContextAttribute("request");  
        resolver.setOrder(0);
        resolver.setExposeRequestAttributes(true);
        resolver.setExposeSessionAttributes(true);
    }
}
