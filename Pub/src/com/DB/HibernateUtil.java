package com.DB;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HibernateUtil {
	
	static   SessionFactory   factory=null;
	static{
		try{
			BeanFactory  beanFactory=new ClassPathXmlApplicationContext("appcontext.xml");
			factory=(SessionFactory)beanFactory.getBean("sessionFactory");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public  static   Session  getSession(){
		return factory.openSession();
	}

}
