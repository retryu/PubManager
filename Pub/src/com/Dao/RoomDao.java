package com.Dao;

import java.util.List;

import com.model.Room;

public interface RoomDao {
	public void  add(Room  room);
	public void  update(Room  room);
	public void  delete(int  id);
	public  Room  findById(int id);
	public  List<Room>  findByHql(String  sql);
	public  List<Room>  findByPagging(int  index,int rows,String  hql);
	public  int  getCount(String  hql);
	
}
  