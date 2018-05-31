package com.iteale.iteale.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class UserController {
	@RequestMapping("/user")
    public ModelAndView showUser(){
        ModelAndView mav=new ModelAndView();
        //mav.addObject("message", "hello world");
        mav.setViewName("user");
        return mav;
    }
}
