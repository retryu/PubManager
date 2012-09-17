package test;

import org.hibernate.SessionFactory;
import org.junit.Test;

import com.Dao.UserDao;
import com.Dao.Impl.UserDaoImpl;
import com.model.User;


public class UserDaoTest {
	private  SessionFactory  sessionFactory;
	
	
	@Test
	public  void   UserAddTest(){
		UserDao  userDao=new  UserDaoImpl();
		User  u=new User();
		u.setAge(11);
		u.setName("retryu2");
		u.setNote("需要特别服务2");
		u.setSex("男2");
		u.setType(3);
		userDao.add(u);
	}
	
	@Test
	public  void UserfindTest(){
	UserDao  userDao=new  UserDaoImpl();
	User  u=userDao.findById(2);
	System.out.println("user"+u);
	}
	
	
	@Test
	public  void  UserDeleteTest(){
	UserDao  userDao=new  UserDaoImpl();
	userDao.delete(3);
	}

	@Test
	public  void UserUpdateTest(){
	UserDao  userDao=new  UserDaoImpl();
	User  u=userDao.findById(2);
	u.setName("ruanxiao2");
	u.setNote("hah");
	userDao.update(u);
	System.out.println("user"+u);
	}
	

}
