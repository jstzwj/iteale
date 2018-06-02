package com.iteale.iteale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
public class Post {
	private int id;
	private int user_id;
    private String title;
    private String content;
    private int reward;
    
    public Post() {
    }
    
    public Post(int user_id, String title, String content, int reward) {
    	this.user_id = user_id;
    	this.title = title;
    	this.content = content;
    	this.reward = reward;
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
    @Column(length=512)
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    
    @NotNull
    @Column
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    
    @NotNull
    @Column
    public int getReward() {
        return reward;
    }
    public void setReward(int reward) {
        this.reward = reward;
    }
}
