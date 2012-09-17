package com.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Room {
	private  int  number;
	private   int  type;
	private  Date check_in;
	private  Date chec_out;
	private int  state;
	private  int  flooor;
	private  int price;
	private  Order  order;
	@Id
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getFlooor() {
		return flooor;
	}
	public void setFlooor(int flooor) {
		this.flooor = flooor;
	}
	public Date getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}
	public Date getChec_out() {
		return chec_out;
	}
	public void setChec_out(Date chec_out) {
		this.chec_out = chec_out;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
		return "Room [number=" + number + ", type=" + type + ", check_in="
				+ check_in + ", chec_out=" + chec_out + ", state=" + state
				+ ", flooor=" + flooor + ", price=" + price + ", order="
				+ order + "]";
	}


	 
	
	
}