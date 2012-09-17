package test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.DB.HibernateUtil;
import com.Dao.RoomDao;
import com.Dao.Impl.RoomDaoImp;
import com.model.Room;
import com.model.UserBean;

public class RoomDaotest {

	private  SessionFactory  sessionFactory;
 
	BeanFactory  beanFactory=null;
	@Before
	public  void before(){
		
		  beanFactory =new  ClassPathXmlApplicationContext("appcontext.xml");
//		new SchemaExport(new  AnnotationConfiguration().configure("/hibernate.cfg.xml")).create(true, true);
//		 System.out.println("inited  databases  finished");
//		BeanFactory  beanFactory=new ClassPathXmlApplicationContext("appcontext.xml");
	}
	
	
	@Test
	public void testadd() {
		RoomDao  roomDao=new RoomDaoImp();
		Room  room=new  Room();
		room.setFlooor(2);
		room.setNumber(4444);
		room.setState(1);
		room.setType(2);
		roomDao.add(room);
	}
	
	@Test
	public void  testuodate(){
		RoomDao  roomDao=new RoomDaoImp();
		Room  room=(Room)roomDao.findById(2);
		System.out.print("room"+room);
		room.setNumber(7777);
		roomDao.update(room);
	}
	
	@Test
	public  void  testDelete(){
		RoomDao  roomDao=new RoomDaoImp();
		roomDao.delete(11);
		
	}
	@Test
	public  void  testFindByHQL(){
		RoomDao  RoomDao=(com.Dao.RoomDao) beanFactory.getBean("roomDao");
		Room  room;
		room=RoomDao.findById(1201);
		System.out.println("room"+room);
		System.out.println("order"+room.getOrder());
	}
	
	/*
	 * 测试获得ROOm 记录数
	 */
	@Test
	public  void  testGetCOunt(){
		RoomDao  RoomDao=(com.Dao.RoomDao) beanFactory.getBean("roomDao");
		UserBean userBean=new  UserBean();
		
		int  count=RoomDao.getCount("select count(*) from  Room r where  r.type=1");
		userBean.setToatalPage(count/8);
		System.out.println("count:"+userBean.getToatalPage());
	}
	
	/*
	 * 测试
	 */
	@Test
	public  void  testRoomPadding(){
		RoomDao  RoomDao=(com.Dao.RoomDao) beanFactory.getBean("roomDao");
		
		
	List<Room> rooms=RoomDao.findByPagging(0, 6,"from  Room r where  r.type=2   ");
	
	for (Room room : rooms) {
		System.out.println(room);
	}
		
		
		
		
		
		
	}
	
	

}
