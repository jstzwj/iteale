package com.iteale.iteale.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iteale.iteale.User;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class UserController {
	@Autowired
    private UserRepository userRepository;
	
	@RequestMapping("/user")
    public String showUser(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("id") int id){
		User curUser = userRepository.findById(id);
		if(curUser != null)
		{
			model.addAttribute("curID", curUser.getId());
			model.addAttribute("curName", curUser.getName());
			model.addAttribute("curEmail", curUser.getEmail());
			model.addAttribute("curAvatar", curUser.getAvatar());
			model.addAttribute("curBio", curUser.getBio());
			return "user";
		}
		else
		{
			return "error";
		}
    }
}
