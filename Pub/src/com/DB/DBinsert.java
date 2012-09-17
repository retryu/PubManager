package com.DB;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.model.Activity;
import com.model.Member;
import com.model.Serve;
public class DBinsert {
	private  SessionFactory sf;
	private  DBUtil  db;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	public DBUtil getDb() {
		return db;
	}
	public void setDb(DBUtil db) {
		this.db = db;
	}
	public  void  inserTable(String tablename,Object  obj){
		int  _id;
			System.out.println("table:"+tablename);
			Session  sess=sf.openSession();
			Transaction  t=sess.beginTransaction();
			if(tablename.equals("Activity")){
				Activity  activity=(Activity)obj;
				sess.save(activity);
				System.out.println("\ninsert into  activity_id:"+activity.getActivity_id());
			}
			if(tablename.equals("Member")){
				Member  member=(Member)obj;
				sess.save(member);
				
			}
			if(tablename.equals("Serve")){
				Serve  serve=(Serve)obj;
				sess.save(serve);
			}
			t.commit();
		 
			sess.close();
			
	}

}
