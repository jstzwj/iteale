package com.iteale.iteale.controller;

import java.io.IOException;
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
	
	@RequestMapping(value = "/user", params = {"id"})
    public String showUser(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("id") int id){
		User curUser = userRepository.findById(id);
		if(curUser != null)
		{
			model.addAttribute("curUser", curUser);
			return "user";
		}
		else
		{
			return "error";
		}
    }
	
	@RequestMapping(value = "/user")
    public void showUser(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model) throws IOException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null)
		{
			response.sendRedirect("login");
		}
		else
		{
			response.sendRedirect("user?id="+user.getId());
		}
    }
}
