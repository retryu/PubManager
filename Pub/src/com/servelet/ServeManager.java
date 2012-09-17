package com.servelet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.directwebremoting.Container;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.extend.ScriptSessionManager;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.DB.DBUtil;
import com.DB.DBinsert;
import com.model.Serve;

public class ServeManager extends  HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html:charset=utf-8");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html:charset=utf-8");
			System.out.print("doPost");
			WebApplicationContext wac = WebApplicationContextUtils
					.getWebApplicationContext(this.getServletContext());
			DBUtil db = (DBUtil) wac.getBean("DBUtil");
			DBinsert  dbinsert=(DBinsert)wac.getBean("DBinsert");
			Container container=null;
			try{
			 container = ServerContextFactory.get().getContainer();
				ScriptSessionManager manager = container.getBean(ScriptSessionManager.class);
				Collection<ScriptSession>  scriptSessions=manager.getAllScriptSessions();
				System.out.print("scriptSessions.size():"+scriptSessions.size());
				Iterator<ScriptSession> iter = scriptSessions.iterator();
				while(iter.hasNext()){
				ScriptSession  scriptSession= iter.next();
				System.out.println("scriptSession:"+scriptSession.toString());
				scriptSession.addScript(new  ScriptBuffer("showdownBox('鏌ョ湅鏂版湇鍔¤姹�)"));
				}
			}
			catch (Exception e) {
				System.out.println("getContainer  is  null\n");
			}  
		 			     
			
		 Serve  serve=new Serve();
			serve.setServe_type((String) req.getParameter("serve_type"));
			String  serve_type=serve.getServe_type();
			System.out.println("serve_type:"+serve_type);
			   
			String  data1;
			String  data2;
			String  data3;
			String  data4;
			String  data5;
			data1=req.getParameter("data1");
			data2=req.getParameter("data2");
			data3=req.getParameter("data3");
			data4=req.getParameter("data4");
			data5=req.getParameter("data5");
//			System.out.print("data1:"+data1+"\n"+"data2:"+data2+"\n"+"data3:"+data3+"\n"+"data4:"+data4+"\n"+"data5:"+data5+"\n");	
			
			if(!data1.equals(""))serve.setData_1(data1);
			if(!data2.equals(""))serve.setData_1(data2);
			if(!data3.equals(""))serve.setData_1(data3);
			if(!data4.equals(""))serve.setData_1(data4);
			if(!data5.equals(""))serve.setData_1(data5);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.SIMPLIFIED_CHINESE);
			sdf.applyPattern("yyyy-MM-dd-HH:mm:ss");
			String serve_time = sdf.format(new Date());
			serve.setServe_time(serve_time);
			
			System.out.print("serve:"+serve);
			
			dbinsert.inserTable("Serve", serve);		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doGet");
		WebApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(this.getServletContext());
		DBUtil db = (DBUtil) wac.getBean("DBUtil");
		DBinsert  dbinsert=(DBinsert)wac.getBean("DBinsert");
		Container container=null;
		try{
		 container = ServerContextFactory.get().getContainer();
		}
		catch (Exception e) {
			System.out.print("getContainer  is  null");
			return;
		}
		ScriptSessionManager manager = container.getBean(ScriptSessionManager.class);
		Collection<ScriptSession>  scriptSessions=manager.getAllScriptSessions();
		System.out.print("scriptSessions.size():"+scriptSessions.size());
		Iterator<ScriptSession> iter = scriptSessions.iterator();
		while(iter.hasNext()){
		ScriptSession  scriptSession= iter.next();
		System.out.println("scriptSession:"+scriptSession.toString());
		scriptSession.addScript(new  ScriptBuffer("showdownBox('鏌ョ湅鏂版湇鍔¤姹�)"));
		}
		
		
		String  server_type;
		String   server_state;
		String   server_time;
		String  data_1;
		String  data_2;
		String  data_3;
		String  data_4;
		String  data_5;
		String  member_id;
		
		
		server_type=(String) req.getAttribute("serve_type");
		server_state=(String) req.getAttribute("serve_state");
		
		
		
		
//		Serve serve=new  Serve();
//		serve.setServe_type("book_food");
//		serve.setServe_time("2012-05-16");  
//		serve.setData_4("2012-06-11");
//		serve.setData_5("2012-05-29");
//		serve.setMember_name("濂ョ埜濡�);
//		dbinsert.inserTable("Serve", serve);
		
	 
		
	}

}
