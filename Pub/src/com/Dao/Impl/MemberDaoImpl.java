package com.Dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.DB.HibernateUtil;
import com.Dao.MemberDao;
import com.model.Member;
import com.model.Room;

public class MemberDaoImpl implements  MemberDao{

	@Resource(name="sessionFactory")
	SessionFactory sessionFactory;
	@Override
	public void add(Member m) {
		Session  session=sessionFactory.getCurrentSession();  
		try{
			session.beginTransaction();
			session.save(m); 
			session.getTransaction();  
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
			
		
	}

	@Override
	public void delete(int id) {
		Session  session=sessionFactory.getCurrentSession();
		try{
			session.beginTransaction();
			Member  m=new Member();
			m.setMember_id(id);
			session.delete(m);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}

	@Override
	public void update(Member m) {
		Session  session=sessionFactory.getCurrentSession();
		try{
			session.beginTransaction();
			session.update(m);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}

	@Override
	public Member findById(int id) {
		Session  session=sessionFactory.getCurrentSession();
		Member  member=null;
		try{
			session.beginTransaction();
			member	=(Member)session.get(Member.class, id);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return  member;
	}

	@Override
	public List<Member> findMembersByHQL(String hql) {
		Session  session=sessionFactory.openSession();
		List<Member>  members=null;
		try{
			session.beginTransaction();
			Query  q=session.createQuery(hql);
			members=q.list();
			for (Member member : members) {
				System.out.println(member);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return  members;		
	}
 
}
