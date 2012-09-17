package com.Dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.Dao.RoomDao;
import com.model.Room;

public class RoomDaoImp implements RoomDao {
	
	@Resource(name="sessionFactory")
	SessionFactory sessionFactory;

	@Override
	public void add(Room room) {
		Session  session=sessionFactory.getCurrentSession();
		try{
			session.beginTransaction();
			session.save(room);
			session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
	}

	@Override
	public void update(Room room) {
		Session  session=sessionFactory.getCurrentSession();
		try{
			session.beginTransaction();
			session.update(room);
			session.getTransaction().commit();
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
			Room  room=new Room();
			room.setNumber(id);
			session.delete(room);
			session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}

	@Override
	public Room findById(int id) {
		Session  session=sessionFactory.getCurrentSession();
		Room  room=null;
		try{
			session.beginTransaction();
			room	=(Room)session.get(Room.class, id);
			session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return  room;
	}
	
	
	@Override
	public List<Room> findByHql(String hql) {
		Session  session=sessionFactory.getCurrentSession();
		List<Room>  rooms=null;
		try{
			session.beginTransaction();
			Query  q=session.createQuery(hql);
			rooms=q.list();
			for (Room room : rooms) {
				System.out.println(room);
			}
			session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return  rooms;
		
		
		
		
	 
	}

	@Override
	public List<Room> findByPagging(int index, int rows,String hql) {
		
		Session session=sessionFactory.getCurrentSession();
		List<Room> rooms=null;
		try{
		session.beginTransaction();
		Query  q=session.createQuery(hql);
		q.setMaxResults(rows);
		q.setFirstResult(index);
		rooms= q.list();
		
		session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return  rooms;
	}
	
	
	@Override
	public int getCount(String hql) {
		Session session=sessionFactory.getCurrentSession();
		int  count=0;
		try{
		session.beginTransaction();
		Query  q=session.createQuery(hql);
		count=Integer.parseInt(q.uniqueResult().toString());
		System.out.print(count);
		
		session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return   count;
	}
	

}
