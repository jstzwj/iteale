package com.iteale.iteale;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

@Entity
public class Post {
	private int id;
    private User user;
    private String title;
    private String content;
    private int reward;
    
    public Post() {
    }
    
    public Post(User user, String title, String content, int reward) {
    	this.user = user;
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
    
    @OneToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName = "id")
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
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
