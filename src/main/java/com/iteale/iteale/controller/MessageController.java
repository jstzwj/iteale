package com.iteale.iteale.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	@RequestMapping(value="/message")
    public String index(HttpServletResponse response, HttpServletRequest request){
        return "message";
    }
}
