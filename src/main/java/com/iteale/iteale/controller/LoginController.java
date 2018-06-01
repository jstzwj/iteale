package com.iteale.iteale.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public ModelAndView login(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("login");
        return mav;
    }
	
	@RequestMapping(value="/login", params = { "email","password" }, method = {RequestMethod.POST})
    public ModelAndView login(HttpServletResponse response,
    		HttpServletRequest request,
    		@RequestParam("email") String email,
    		@RequestParam("password") String password) throws IOException{
		HttpSession session = request.getSession();
		User user = userRepository.findByEmail(email);
		if(user != null && user.getPassword().equals(password))
		{
			session.setAttribute("userID", user.getId());
	        response.sendRedirect("user?id="+user.getId());
	        return new ModelAndView();
		}
		else
		{
			ModelAndView mav=new ModelAndView();
			mav.addObject("loginFail", "true");
	        mav.setViewName("login");
	        return mav;
		}
    }
	
	@RequestMapping("/register")
    public ModelAndView register(){
        ModelAndView mav=new ModelAndView();
        //mav.addObject("message", "hello world");
        mav.setViewName("register");
        return mav;
    }
	
	@RequestMapping(value="/register", method = {RequestMethod.POST})
    public void register(HttpServletResponse response,
    		HttpServletRequest request,
    		@RequestParam("name") String name,
    		@RequestParam("email") String email,
    		@RequestParam("password") String password) throws IOException{
		HttpSession session = request.getSession();
		
		
		userRepository.save(new User(name, password, email));
		
		User user = userRepository.findByEmail(email);
		
		session.setAttribute("userID", user.getId());
		
        response.sendRedirect("user?id="+user.getId());
    }
}
