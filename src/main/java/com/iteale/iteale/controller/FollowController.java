package com.iteale.iteale.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iteale.iteale.User;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class FollowController {
	@Autowired
    private UserRepository userRepository;
	
	@RequestMapping(value="/follower")
    public String follower(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			model.addAttribute("followerList",user.getFollowers());
		}
		return "follower";
    }
	
	@RequestMapping(value="/follow/add")
	@ResponseBody
    public Map<String,String> followAdd(HttpServletResponse response,
    		HttpServletRequest request,
    		@RequestParam("followed_user") int followed_user_id){
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user!=null) {
			User followed_user =  userRepository.findById(followed_user_id);
			
			user.getFollowingUsers().add(followed_user);
			//followed_user.getFollowers().add(user);
			
			userRepository.save(user);
		}
        return map;
    }
	
	@RequestMapping(value="/follow/remove")
	@ResponseBody
    public Map<String,String> followRemove(HttpServletResponse response,
    		HttpServletRequest request,
    		@RequestParam("followed_user") int followed_user_id){
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			User followed_user =  userRepository.findById(followed_user_id);
			user.getFollowingUsers().remove(followed_user);
			
			userRepository.save(user);
		}
		
		return map;
    }
}
