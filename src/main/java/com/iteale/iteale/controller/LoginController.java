package com.iteale.iteale.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iteale.iteale.User;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class LoginController {
	@Autowired
    private UserRepository userRepository;
	
	@RequestMapping(value="/login", method = {RequestMethod.GET})
    public String login(HttpServletResponse response, HttpServletRequest request){
        return "login";
    }
	
	@RequestMapping(value="/login", params = { "email","password" }, method = {RequestMethod.POST})
    public String login(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("email") String email,
    		@RequestParam("password") String password) throws IOException{
		HttpSession session = request.getSession();
		User user = userRepository.findByEmail(email);
		if(user != null && user.getPassword().equals(password))
		{
			session.setAttribute("userID", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userEmail", user.getEmail());
	        response.sendRedirect("user?id="+user.getId());
	        return "";
		}
		else
		{
			model.addAttribute("loginFail", "true");
	        return "login";
		}
    }
	
	@RequestMapping("/register")
    public String register(HttpServletResponse response, HttpServletRequest request){
        return "register";
    }
	
	@RequestMapping(value="/register", method = {RequestMethod.POST})
    public ModelAndView register(HttpServletResponse response,
    		HttpServletRequest request,
    		@RequestParam("name") String name,
    		@RequestParam("email") String email,
    		@RequestParam("password") String password) throws IOException{
		HttpSession session = request.getSession();
		
		User user = userRepository.findByEmail(email);
		
		if(user!=null)
		{
			ModelAndView mav=new ModelAndView();
			mav.addObject("registerFail", "true");
	        mav.setViewName("register");
	        return mav;
		}
		else
		{
			userRepository.save(new User(name, password, email));
			User newuser = userRepository.findByEmail(email);
			session.setAttribute("userID", newuser.getId());
	        response.sendRedirect("user?id="+newuser.getId());
	        return new ModelAndView();
		}
		
    }
	
	@RequestMapping(value="/signout")
    public String signout(HttpServletResponse response, HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("userID");
        return "index";
    }
}
