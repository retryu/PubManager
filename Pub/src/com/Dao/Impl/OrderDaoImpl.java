package com.Dao.Impl;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.omg.CORBA.ORB;

import com.DB.HibernateUtil;
import com.Dao.OrderDao;
import com.model.Order;

public class OrderDaoImpl implements  OrderDao {

	@Resource(name="sessionFactory")
	SessionFactory sessionFactory;
	
	
	@Override
	public void add(Order order) {
		Session session  =sessionFactory.getCurrentSession();
		session.beginTransaction();
	try{
		
		
		session.save(order);
		
		if(order.getMember()!=null)
		{
			System.err.println("save Member");
			session.save(order.getMember());
		}
		else{
			System.err.println("not  save Member");
		}
		if(order.getRoom()!=null){
			order.getRoom().setOrder(order);
			session.update(order.getRoom());
		}
		 
	 
		session.getTransaction().commit();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	}

	@Override
	public void delete(int id) {
		Session  session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try{
			Order  order=new  Order();
			order.setId(id);
			session.delete(order);
			session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
		
		
		
	}

	@Override
	public void update(Order order) {
		Session session  =sessionFactory.getCurrentSession();
		session.beginTransaction();
	try{
		session.getTransaction();
		session.update(order);
		session.getTransaction().commit();
	}
	catch (Exception e) {
		e.printStackTrace();
		session.getTransaction().rollback();
	}		
	}

	@Override
	public Order findById(int id) {
		
		Session session  =sessionFactory.getCurrentSession();
		session.beginTransaction();
		Order  order=null;
		try{
		session.getTransaction();
		order=(Order) session.get(Order.class, id);
		session.getTransaction().commit();
	}
	catch (Exception e) {
		e.printStackTrace();
		session.getTransaction().rollback();
	}
		
		
		return order;
	}
	

}
