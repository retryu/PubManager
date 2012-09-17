package com.Dao;

import java.util.List;

import com.model.Member;

public interface MemberDao {
	public  void  add(Member m);
	public  void  delete(int id);  
	public  void update(Member  m);
	public Member  findById(int id);
	public  List<Member>  findMembersByHQL(String   hsql);
   
}
   