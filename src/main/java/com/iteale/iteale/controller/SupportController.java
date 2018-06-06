package com.iteale.iteale.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iteale.iteale.Reward;
import com.iteale.iteale.User;
import com.iteale.iteale.repository.RewardRepository;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class SupportController {
	@Autowired
    private UserRepository userRepository;
	@Autowired
    private RewardRepository rewardRepository;
	@RequestMapping(value="/support")
    public String support(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("id") int id,
    		@RequestParam("reward_id") int reward_id){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		User supporting_user = userRepository.findById(id);
		List<Reward> rewardList=null;
		if(user!=null) {
			rewardList = rewardRepository.findByUser(supporting_user);
		}
		
		model.addAttribute("rewardList", rewardList);
        return "support";
    }
}
