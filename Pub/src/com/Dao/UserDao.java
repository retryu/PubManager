package com.Dao;

import java.util.List;

import com.model.User;

public interface UserDao {
	
	
	public void  add(User u);
	public  void  update(User  u);
	public  void  delete(int  id);
	public User  findById(int  id);  

}
