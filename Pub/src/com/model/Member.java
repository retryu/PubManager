package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.springframework.jmx.export.annotation.ManagedAttribute;

@Entity
public class Member {
	
	private  int  member_id;
	private  String  member_name;
	private  String  member_national;
	private  int member_integral;  
	private  String  member_birthday;
	private  String  member_sex;
	private  String  member_token;  
	private   String   member_grand;
	private  String  member_key;
	private  String   idcard;
	private  Order order;
	  
	public Member() {
		// TODO Auto-generated constructor stub
	}
	public Member(int member_id, String member_name, String member_national,
			int member_integral, String member_birthday, String member_sex,
			String member_token, String member_grand, String member_key) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_national = member_national;
		this.member_integral = member_integral;
		this.member_birthday = member_birthday;
		this.member_sex = member_sex;
		this.member_token = member_token;
		this.member_grand = member_grand;
		this.member_key = member_key;
	}
	@Id
	@GeneratedValue
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	} 
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_national() {
		return member_national;
	}
	public void setMember_national(String member_national) {
		this.member_national = member_national;
	}
	public int getMember_integral() {
		return member_integral;
	}
	public void setMember_integral(int member_integral) {
		this.member_integral = member_integral;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_token() {
		return member_token;
	}
	public void setMember_token(String member_token) {
		this.member_token = member_token;
	}
	public String getMember_grand() {
		return member_grand;
	}
	public void setMember_grand(String member_grand) {
		this.member_grand = member_grand;
	}
	public String getMember_key() {
		return member_key;
	}
	public void setMember_key(String member_key) {
		this.member_key = member_key;
	}


	
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	
	
	
	@OneToOne
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_name="
				+ member_name + ", member_national=" + member_national
				+ ", member_integral=" + member_integral + ", member_birthday="
				+ member_birthday + ", member_sex=" + member_sex
				+ ", member_token=" + member_token + ", member_grand="
				+ member_grand + ", member_key=" + member_key + ", idcard="
				+ idcard + "]";
	}
	 
	
	
	
	
	
}