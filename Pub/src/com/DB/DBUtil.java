package com.DB;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.mapping.Array;

import com.model.Member;
import com.model.Serve;

public class DBUtil {
	private  SessionFactory  sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	
	
	
	
	
	
	public  List<?>  getInfo(String  hql){
		Session  sess=sf.openSession();
		Query  q=sess.createQuery(hql);
		List list=q.list();
		sess.close();
		return  list;
	}
	
	
	
	
	public  int  getTotalPage(String  hql,int  span){
		Session  sess=sf.openSession();
		Query  q=sess.createQuery(hql);
		List<Long>  list=q.list();
		System.out.println("get(0)"+list.get(0));
		int  count=(list.get(0)).intValue();
		int  page=(count%span==0)?(count/span):(count/span+1);
		sess.close();
		return  page;
		
	}
	
	
	public  Object  getObject(String  tablename,String id){
		System.out.print("start");
		Session  sess=sf.openSession();
		Object  obj=null;
		if(tablename.equals("Member")){
			System.out.print("table  is  Member");
			obj=sess.get(Member.class,id);
		}
		else{
			System.out.print("Member  not");
		}
		sess.close();
		return   obj;
	}
	
	public   List<?>  getPageContent(String hql,int  page,int  span){
		
		List  temp=new  ArrayList();
		Session   sess=sf.openSession();
		Query   q=sess.createQuery(hql);
		List  list=q.list();
		int i=0;
		while((page-1)*span+i<list.size()&&i<span){
			temp.add(list.get((page-1)*span+i));
			i++;
		}
		sess.close();
		return  temp;
	}
	public  List<?>  getmPageContent(String  hql,int  page,int  span){
		List  temp=new  ArrayList();
		Session   sess=sf.openSession();
		Query q = sess.createQuery(hql);
		List  list=q.list();
//		List<Serve>  serves=(List<Serve>)list;
//		for(int  i=0;i<serves.size();i++){
//			System.out.println(serves.get(i));
//		}
		int i=0;
		while((page-1)*span+i<list.size()&&i<span){
			temp.add(list.get((page-1)*span+i));
			i++;
		}
		sess.close();
		return  temp;

	}
	
	
	
	
	
	
	
	

}
