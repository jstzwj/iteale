package com.iteale.iteale.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iteale.iteale.Reward;
import com.iteale.iteale.User;
import com.iteale.iteale.repository.RewardRepository;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class SettingController {
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private RewardRepository rewardRepository;
	
	@RequestMapping(value="/setting", method = {RequestMethod.GET})
    public String setting(HttpServletResponse response, HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			List<Reward> rewardList = rewardRepository.findByUserId(user.getId());
			model.addAttribute("rewardList", rewardList);
		}
		
        return "setting";
    }
	
	@RequestMapping(value="/setting", method = {RequestMethod.POST})
    public String setting(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam(value="action", required = false) String action,
    		@RequestParam(value="username", required = false) String username,
    		@RequestParam(value="email", required = false) String email,
    		@RequestParam(value="title", required = false) String title,
    		@RequestParam(value="money", required = false) Integer money,
    		@RequestParam(value="editor", required = false) String editor){
		HttpSession session = request.getSession();
		if(action.equals("profile"))
		{
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
		}
		else if(action.equals("rewards"))
		{
			User user = (User)session.getAttribute("user");
			if(user!=null)
			{
				rewardRepository.save(new Reward(user.getId(),title, editor, money));
				List<Reward> rewardList = rewardRepository.findByUserId(user.getId());
				model.addAttribute("rewardList", rewardList);
			}
		}
		
        return "setting";
    }
	
	@RequestMapping(value="/setting/reward/delete")
	@ResponseBody
    public Map<String,String> reward_delete(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam(value="id") int id){
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			Reward reward = rewardRepository.findById(id);
			rewardRepository.delete(reward);
		}
		
		return map;
	}
}
