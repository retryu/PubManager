package com.DB;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.model.Activity;
   
public class DBdelete {    
	private  SessionFactory sf;     
	private DBUtil  db;
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
	public  void  deleteTable(String  tablename,String  id){
		Session  sess=sf.openSession();
		Transaction   t=sess.beginTransaction();
		if(tablename.equals("Activity")){
			Activity activity  =(Activity) sess.get(Activity.class, new  Integer(id));
			if(activity!=null){
				sess.delete(activity);
			}
		}
		t.commit();
		sess.close();
		
	}

}
