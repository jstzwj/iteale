package com.iteale.iteale.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
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
    		@RequestParam(value="email", required = false) String email){
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
		
        return "setting";
    }
	
	@RequestMapping(value="/setting/reward/add")
	@ResponseBody
    public Map<String,String> rewardAdd(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam(value="reward_title") String reward_title,
    		@RequestParam(value="reward_content") String reward_content,
    		@RequestParam(value="reward_price") int reward_price
    		){
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null)
		{
			Reward reward = rewardRepository.save(new Reward(user,reward_title, reward_content, reward_price));
			map.put("reward_id", String.valueOf(reward.getId()));
			map.put("reward_title", reward.getRewardName());
			map.put("reward_content", reward.getRewardContent());
			map.put("reward_price", String.valueOf(reward.getRewardPrice()));
		}
		
		return map;
	}
	
	@RequestMapping(value="/setting/reward/delete")
	@ResponseBody
    public Map<String,String> rewardDelete(HttpServletResponse response,
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
	
	@RequestMapping(value="/setting/password/update")
	@ResponseBody
    public Map<String,String> passwordUpdate(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam(value="old_password") String old_password,
    		@RequestParam(value="new_password") String new_password,
    		@RequestParam(value="confirm_password") String confirm_password){
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isSuccess = false;
		if(user!=null)
		{
			if(user.getPassword().equals(old_password)&&
					new_password.equals(confirm_password))
			{
				user.setPassword(new_password);
				userRepository.save(user);
				isSuccess = true; 
			}
		}
		
		if(isSuccess) map.put("is_success", "true");
		else map.put("is_success", "false");
		
		return map;
	}
	
	@RequestMapping(value="/avatar/update")
	@ResponseBody
    public Map<String,String> avatarUpdate(HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam("avatar") MultipartFile avatar){
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String dateDir = df.format(new Date());
        String fileName = user.getId() + "_" + dateDir 
        		+ "." + avatar.getName().substring(avatar.getName().lastIndexOf(".") + 1);
        File tempFile = new File("avatar" + File.separator
        		+ fileName);
        if (!avatar.isEmpty()) {
            try {
                BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(tempFile));
                out.write(avatar.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                map.put("msg", "fail to upload:" + e.getMessage());
                map.put("state", "false");
                return map;
            } catch (IOException e) {
                e.printStackTrace();
                map.put("msg", "fail to upload:" + e.getMessage());
                map.put("state", "false");
                return map;
            }
            map.put("msg", "succeed to upload");
            user.setAvatar(File.separator + fileName);
            map.put("state", "true");
        } else {
            map.put("msg", "fail to upload: empty file");
            map.put("state", "false");
        }
		
		return map;
	}
}
