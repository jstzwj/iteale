package com.iteale.iteale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iteale.iteale.Reward;
import com.iteale.iteale.User;

public interface RewardRepository extends JpaRepository<Reward, Long>{
	public Reward findById(int id);
	public List<Reward> findByUser(User user);
	public List<Reward> findByRewardName(String reward_name);
}
