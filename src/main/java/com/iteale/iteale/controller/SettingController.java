package com.iteale.iteale.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iteale.iteale.User;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class SettingController {
	@Autowired
    private UserRepository userRepository;
	
	@RequestMapping(value="/setting")
    public String setting(HttpServletResponse response, HttpServletRequest request, Model model){
        return "setting";
    }
	
	@RequestMapping(value="/setting/profile")
    public String setting(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("username") String username,
    		@RequestParam("email") String email){
		HttpSession session = request.getSession();
		if(userRepository.findByEmail(email)!=null)
		{
			model.addAttribute("failure", "duplicate email.");
		}
		else
		{
			User user = (User)session.getAttribute("user");
			if(user!=null)
			{
				user.setName(username);
				user.setEmail(email);
				userRepository.save(user);
			}
		}
		
        return "setting";
    }
}
