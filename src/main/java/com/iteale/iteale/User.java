package com.iteale.iteale;  
  
import javax.persistence.Column;  
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;  
  
@Entity  
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private String avatar;
    private String bio;
    
    public User() {
    }
    
    public User(String name, String password, String email) {
    	this.name = name;
    	this.password = password;
    	this.email = email;
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
}  