package com.iteale.iteale.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iteale.iteale.Post;
import com.iteale.iteale.Reward;
import com.iteale.iteale.User;
import com.iteale.iteale.repository.PostRepository;
import com.iteale.iteale.repository.RewardRepository;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class PostController {
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private PostRepository postRepository;
	
	@Autowired
    private RewardRepository rewardRepository;
	
	@RequestMapping(value="/post/add",method = {RequestMethod.GET})
    public String postAddGet(
    		HttpServletResponse response,
    		HttpServletRequest request,
    		Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			List<Reward> rewardList = rewardRepository.findByUserId(user.getId());
			model.addAttribute("rewardList", rewardList);
		}
        return "post";
    }
	
	@RequestMapping(value="/post/add",method = {RequestMethod.POST})
    public String postAddPost(
    		HttpServletResponse response,
    		HttpServletRequest request,
    		Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			postRepository.save(
					new Post(user,
					request.getParameter("title"),
					request.getParameter("editor"),
					0));
		}
        return "redirect:/user";
    }
}
