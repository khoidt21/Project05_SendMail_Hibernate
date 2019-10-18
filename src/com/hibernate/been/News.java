package com.hibernate.been;

import java.sql.Date;

import javax.persistence.Column;

public class News {
	
	private int id;
	private String title;
	private String description;
	private String content;
	private Date publisher;
	private String author;
	private int released;
	
	public News() {
	}
	
	public News(String title,String description,String content,Date publisher,String author,int released) {	
		this.title = title;
		this.description = description;
		this.content = content;
		this.publisher = publisher;
		this.author = author;
		this.released = released;
	}
	public News(int id,String title,String description,String content,Date publisher,String author,int released) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.content = content;
		this.publisher = publisher;
		this.author = author;
		this.released = released;
	}
	
	
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name="content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name="publisher")
	public Date getPublisher() {
		return publisher;
	}
	public void setPublisher(Date publisher) {
		this.publisher = publisher;
	}
	@Column(name="author")
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Column(name="released")
	public int getReleased() {
		return released;
	}

	public void setReleased(int released) {
		this.released = released;
	}
	
	
}
