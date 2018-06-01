package com.iteale.iteale.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iteale.iteale.repository.UserRepository;

@Controller
public class PostController {
	@Autowired
    private UserRepository userRepository;
	
	@RequestMapping(value="/post/add")
    public String postAdd(HttpServletResponse response, HttpServletRequest request){
        return "post";
    }
}
