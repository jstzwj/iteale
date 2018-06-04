package com.iteale.iteale.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iteale.iteale.Reward;
import com.iteale.iteale.User;

@Controller
public class SearchController {
	@RequestMapping(value="/search")
    public String postAddGet(
    		HttpServletResponse response,
    		HttpServletRequest request,
    		Model model){
        return "search";
    }
}
