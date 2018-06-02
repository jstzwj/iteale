package com.iteale.iteale.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iteale.iteale.repository.UserRepository;

@Controller
public class SettingController {
	@Autowired
    private UserRepository userRepository;
	
	@RequestMapping(value="/setting")
    public String setting(HttpServletResponse response, HttpServletRequest request, Model model){
        return "setting";
    }
}