package com.iteale.iteale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
public class Reward {
	private int id;
	private int user_id;
    private String reward_name;
    private String reward_content;
    private int reward_price;
    
    public Reward() {
    	
    }
    
    public Reward(int user_id, String reward_name, String reward_content, int reward_price) {
    	this.user_id = user_id;
    	this.reward_name = reward_name;
    	this.reward_content = reward_content;
    	this.reward_price = reward_price;
    }
    
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    @NotNull
    @Column
    public int getUserId() {
        return user_id;
    }
    public void setUserId(int user_id) {
        this.user_id = user_id;
    }
    
    @NotNull
    @Column(length=64)
    public String getRewardName() {
        return reward_name;
    }
    public void setRewardName(String reward_name) {
        this.reward_name = reward_name;
    }
    
    @NotNull
    @Column
    public String getRewardContent() {
        return reward_content;
    }
    public void setRewardContent(String reward_content) {
        this.reward_content = reward_content;
    }
    
    @NotNull
    @Column
    public int getRewardPrice() {
        return reward_price;
    }
    public void setRewardPrice(int reward_price) {
        this.reward_price = reward_price;
    }
}
