package com.iteale.iteale;  
  
import javax.persistence.Column;  
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;  
  
@Entity  
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    
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
    
    @Column(length=12)  
    public String getName() {  
        return name;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
    
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
}  