package com.DB;

import java.awt.Menu;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.model.Member;

 

public class DBupdate {
	private  SessionFactory  sf;
	private  DBUtil db;
	
	
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
	
	public  void  updateTable(String  tablename,Object  obj,String  id){
		Session  sess=sf.openSession();
		Transaction  t=sess.beginTransaction();
		if(tablename.equals("Member")){
			System.out.println("table  name is  Member");
			Member member=(Member) sess.get(Member.class, id);
			Member  updatamember=(Member)obj;
			System.out.println("\n\n  !!update   Member:"+updatamember.toString());
			
			
			if(updatamember.getMember_birthday()!=null){
				member.setMember_name(updatamember.getMember_name());
			}
			if(updatamember.getMember_name()!=null){
				member.setMember_name(updatamember.getMember_name());
			}
			if(updatamember.getMember_grand()!=null){
				member.setMember_grand(updatamember.getMember_grand());
			}
			if(updatamember.getMember_integral()!=0){
				member.setMember_integral(updatamember.getMember_integral());
			}
			if(updatamember.getMember_national()!=null){
				member.setMember_national(updatamember.getMember_national());
			}
			if(updatamember.getMember_sex()!=null){
				member.setMember_sex(updatamember.getMember_sex());
			}
			if(updatamember.getMember_token()!=null){
				member.setMember_token(updatamember.getMember_token());
			}
			sess.save(member);
		}
		t.commit();
		sess.close();
		
		
		
		
	}
	
	
	
	
	
	
	
	

}
