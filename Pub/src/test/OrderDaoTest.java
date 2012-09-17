package test;

import java.util.Date;

import org.hibernate.SessionFactory;
import org.junit.Test;

import com.Dao.OrderDao;
import com.Dao.RoomDao;
import com.Dao.UserDao;
import com.Dao.Impl.OrderDaoImpl;
import com.Dao.Impl.RoomDaoImp;
import com.Dao.Impl.UserDaoImpl;
import com.model.Order;
import com.model.Room;
import com.model.User;


public class OrderDaoTest {
	
	private  SessionFactory sessionFactory;
	
	
	@Test
	public  void  OrderAddTest(){
		RoomDao  roomDao=new RoomDaoImp();
		Room  room=roomDao.findById(2);
		
		UserDao  userDao=new  UserDaoImpl();
		User  user=userDao.findById(4);
		
		
		OrderDao  orderDao=new OrderDaoImpl();
		Order  order=new  Order();
		order.setRoom(room);
		order.setDeposit(2);
		
		orderDao.add(order);
		
	}
	@Test
	public  void  OrderDeleteTest(){
		OrderDao  orderDao=new OrderDaoImpl();
		orderDao.delete(7);
	}
	
	@Test
	public  void  OrderFindTest(){
		OrderDao  orderDao=new OrderDaoImpl();
		Order  order=orderDao.findById(5);
		System.out.println(order.toString());
	}

}
