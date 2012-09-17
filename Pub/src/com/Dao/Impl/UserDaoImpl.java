package com.Dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.DB.HibernateUtil;
import com.Dao.UserDao;
import com.model.Room;
import com.model.User;

public class UserDaoImpl  implements  UserDao {
	
	private  SessionFactory  sessionFactory;
	

	@Override
	public void add(User  u) {
		
		Session session=HibernateUtil.getSession();
		try{
			session.beginTransaction();
			session.save(u);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
 

		
	}

	@Override
	public void update(User u) {
		
		
		Session session=HibernateUtil.getSession();
		try{
			session.beginTransaction();
			session.update(u);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}

	@Override
	public void delete(int id) {
		Session session=HibernateUtil.getSession();
		try{
			session.beginTransaction();
			User  u=new  User();
			u.setId(id);
			session.delete(u);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
	}

	@Override
	public User findById(int id) {
		User  u=null;
		Session session=HibernateUtil.getSession();
		try{
			session.beginTransaction();
			u=(User)session.get(User.class, id);
			session.getTransaction().commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return  u;
	}
 

}
