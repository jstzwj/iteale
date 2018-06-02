package com.iteale.iteale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
public class Post {
	public final int TYPE_FREE = 0;
	public final int TYPE_PAID = 1;
	
	private int id;
	private int user_id;
    private String title;
    private String content;
    private int type; // 0 free 1 paid
    
    public Post() {
    }
    
    public Post(String title, String content, int type) {
    	this.title = title;
    	this.content = content;
    	this.type = type;
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
    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }
}
