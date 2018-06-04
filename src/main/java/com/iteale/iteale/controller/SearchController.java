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
import org.springframework.web.bind.annotation.RequestParam;

import com.iteale.iteale.Post;
import com.iteale.iteale.Reward;
import com.iteale.iteale.User;
import com.iteale.iteale.repository.PostRepository;
import com.iteale.iteale.repository.UserRepository;

@Controller
public class SearchController {
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private PostRepository postRepository;
	@RequestMapping(value="/search")
    public String search(
    		HttpServletResponse response,
    		HttpServletRequest request,
    		Model model,
    		@RequestParam(value="search_text") String search_text){
		List<User> user_search_result = userRepository.findByNameContaining(search_text);
		List<Post> post_search_result = postRepository.findByTitleContaining(search_text);
		
		model.addAttribute("user_search_result", user_search_result);
		model.addAttribute("post_search_result", post_search_result);
		
        return "search";
    }
}
