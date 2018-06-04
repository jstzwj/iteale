package com.iteale.iteale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iteale.iteale.Post;

public interface PostRepository extends JpaRepository<Post, Long>{
	public Post findById(int id);
	public List<Post> findByUserId(Integer userId);
	public List<Post> findByTitle(String title);
	
	public List<Post> findByTitleContaining(String title);
}
