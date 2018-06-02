package com.iteale.iteale.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iteale.iteale.Post;
import com.iteale.iteale.User;
import com.iteale.iteale.repository.PostRepository;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class PostController {
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private PostRepository postRepository;
	
	@RequestMapping(value="/post/add",method = {RequestMethod.GET})
    public String postAddGet(HttpServletResponse response, HttpServletRequest request){
        return "post";
    }
	
	@RequestMapping(value="/post/add",method = {RequestMethod.POST})
    public String postAddPost(HttpServletResponse response, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		postRepository.save(
				new Post(user.getId(),
				request.getParameter("title"),
				request.getParameter("editor"),
				0));
        return "redirect:/user";
    }
}
