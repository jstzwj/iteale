package com.iteale.iteale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iteale.iteale.Reward;

public interface RewardRepository extends JpaRepository<Reward, Long>{
	public Reward findById(int id);
	public List<Reward> findByUserId(Integer userId);
	public List<Reward> findByRewardName(String reward_name);
}
