package test;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.Dao.MemberDao;
import com.model.Member;


public class MemberDaoTest {

	@Test
	public void  MemberDaoAddTest(){
	BeanFactory  beanFactory=new  ClassPathXmlApplicationContext("appcontext.xml");
	MemberDao  memberDao=(MemberDao) beanFactory.getBean("memberDao");
	Member  m=memberDao.findById(1);
	System.out.print(m);
	 
	}
}
