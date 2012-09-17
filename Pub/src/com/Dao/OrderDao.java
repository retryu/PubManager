package com.Dao;

import com.model.Order;

public interface OrderDao {
	
	public void add(Order  order);
	public  void delete(int  id);
	public  void update(Order  order);
	public  Order  findById(int  id);
	

}
