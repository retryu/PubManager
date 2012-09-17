package com.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_order")
public class Order {
	private  int  id;
	private  int  deposit;
	private  Room  room;
	private  Member  member;
	private  Date  order_time;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	 
	 
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	@OneToOne
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
 
	@OneToOne
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	 
	
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", deposit=" + deposit + ", room=" + 
				 ", member=" + member + ", order_time=" + order_time + "]";
	}
	 
	
	
	
	
	
	
	
	 
	
	
	
	

}
