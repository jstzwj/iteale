package com.iteale.iteale;  
  
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;  
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;  
  
@Entity  
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private String avatar;
    private String bio;
    private int money;
    private List<User> following_users=new ArrayList<User>();
    private List<User> followers=new ArrayList<User>();
    
    public User() {
    }
    
    public User(String name, String password, String email) {
    	this.name = name;
    	this.password = password;
    	this.email = email;
    	this.avatar = "/avatar/matthew.png";
    }
      
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {  
        return id;
    }  
    public void setId(int id) {  
        this.id = id;  
    }
    
    @NotNull
    @Column(length=12)  
    public String getName() {  
        return name;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
    
    @NotNull
    @Column(length=255)  
    public String getPassword() {  
        return password;  
    }
    public void setPassword(String password) {
        this.password = password;
    }  
    
    @Column(length=50)
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    @NotNull
    @Column(length=255)
    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    @NotNull
    @Column
    public String getBio() {
        return bio;
    }
    public void setBio(String bio) {
        this.bio = bio;
    }
    
    @NotNull
    @Column
    public int getMoney() {
        return money;
    }
    public void setMoney(int money) {
        this.money = money;
    }
    
    @ManyToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    @JoinTable(name="follow",joinColumns=@JoinColumn(name="user_id"),inverseJoinColumns=@JoinColumn(name="follower_id"))
    public List<User> getFollowingUsers() {
        return following_users;
    }

    public void setFollowingUsers(List<User> following_users) {
        this.following_users = following_users;
    }
    
    @ManyToMany(cascade=CascadeType.ALL, mappedBy = "followingUsers", fetch = FetchType.LAZY)
    public List<User> getFollowers() {
        return followers;
    }

    public void setFollowers(List<User> followers) {
        this.followers = followers;
    }
}  