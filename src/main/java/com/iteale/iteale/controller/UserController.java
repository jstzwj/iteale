package com.iteale.iteale.controller;

import java.io.IOException;
import java.util.List;
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

import com.iteale.iteale.Post;
import com.iteale.iteale.Reward;
import com.iteale.iteale.User;
import com.iteale.iteale.repository.PostRepository;
import com.iteale.iteale.repository.RewardRepository;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class UserController {
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private PostRepository postRepository;
	
	@Autowired
    private RewardRepository rewardRepository;
	
	@RequestMapping(value = "/user", params = {"id"})
    public String showUser(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("id") int id){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		User curUser = userRepository.findById(id);
		if(curUser != null && user!=null)
		{
			model.addAttribute("curUser", curUser);
			List<Post> postList = postRepository.findByUserId(curUser.getId());
			model.addAttribute("curPost", postList);
			List<Reward> rewardList = rewardRepository.findByUserId(curUser.getId());
			model.addAttribute("curReward", rewardList);
			
			boolean isFollowed = false;
			for(int i=0;i<user.getFollowingUsers().size();++i)
			{
				if(user.getFollowingUsers().get(i).getId()==curUser.getId()) {
					isFollowed = true;
					break;
				}
			}
			
			model.addAttribute("isFollowed", isFollowed);
			
			model.addAttribute("followerNum", curUser.getFollowers().size());
			
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
		if(user != null)
		{
			response.sendRedirect("user?id="+user.getId());
		}
    }
}
