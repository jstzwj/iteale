package com.iteale.iteale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@RequestMapping("/login")
    public ModelAndView say(){
        ModelAndView mav=new ModelAndView();
        mav.addObject("message", "hello world£¡");
        mav.setViewName("login");
        return mav;
    }
}
