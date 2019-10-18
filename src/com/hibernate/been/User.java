
package com.hibernate.been;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

public class User {
    	
	private int id;
	private String userName;
	private String password1;
	private String email;
	private String phone;
	private String city;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String userName,String password1,String email,String phone,String city) {
		this.userName = userName;
		this.password1 = password1;
		this.email = email;
		this.phone = phone;
		this.city = city;
	}
	
	// update information user
	public User(int id,String userName,String password1,String email,String phone,String city) {
		this.id = id;
		this.userName = userName;
		this.password1 = password1;
		this.email = email;
		this.phone = phone;
		this.city = city;
	}
	
	@Column(name="id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="userName")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name="Password1")
	public String getPassword1() {
		return password1;
	}
    
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	@Column(name="email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name="city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	
	
}
