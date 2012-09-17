package com.servelet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.Dao.MemberDao;
import com.Dao.OrderDao;
import com.Dao.RoomDao;
import com.model.Member;
import com.model.Order;
import com.model.Room;
import com.model.UserBean;

public class RoomServlet extends  HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		WebApplicationContext wac = WebApplicationContextUtils
		.getWebApplicationContext(this.getServletContext());
		
		RoomDao  roomDao=(RoomDao) wac.getBean("roomDao");
		System.out.print("room  getMethod()");
		
		MemberDao  memberDao=(MemberDao)wac.getBean("memberDao");
		
		
		HttpSession  session=req.getSession();
		UserBean  userBean=(UserBean)session.getAttribute("userBean");
		List<Room>  rooms;
		
		
		
		if(userBean==null){
			System.out.println("userBean  is  null");
			userBean=new  UserBean();
		}
		int  count=roomDao.getCount("select count(*) from  Room r where  r.type=1");
		int  totalPage=0;
		
		if(count%8==0)
		   totalPage=count/8;
		else
			totalPage=(count/8)+1;
			
		userBean.setToatalPage(totalPage);
		userBean.setSpan(8);
		userBean.setNowPage(0);
		session.setAttribute("userBean", userBean);
		String  type=req.getParameter("roomtype");
		if(type==null)
			{
			req.setAttribute("roomtype", "1");
			type="1";
			}
		else{
			System.out.print("roomtype"+type);
		}
		req.setAttribute("roomtype", type);
		
		String  action=req.getParameter("action");
		System.err.println("action"+action);
		
		 if(action==null){
			  rooms=roomDao.findByPagging(userBean.getNowPage(), userBean.getSpan(),"from  Room  r  where r.type="+type);
				req.setAttribute("rooms", rooms);
				System.out.println("count"+count);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/roomManager.jsp");
				rd.forward(req, resp);
				System.out.print("totalPage"+totalPage+" count:"+count);
				return ;
		}
			 
		if(action.equals("checkroom"))
		{
			 
			String memberId=req.getParameter("member_id");
			System.out.println("member_id"+memberId);
			List<Member>  members=(List<Member>) memberDao.findMembersByHQL("from  Member  m  where  m.idcard="+memberId);
			if(members!=null&&members.size()>0){
				resp.getWriter().write("exist");
			}
			else{
				resp.getWriter().write("notexist");
			}  
		}  
		else if(action.equals("changePage")){
			System.out.println("changePage");
			System.out.println("page"+req.getParameter("page"));
			req.setAttribute("toomtype", req.getParameter("roomtype"));
			int  page=Integer.parseInt(req.getParameter("page"));
			userBean.setNowPage(page);
			rooms=roomDao.findByPagging(userBean.getNowPage()*userBean.getSpan(), userBean.getSpan(),"from  Room  r where r.type="+type);
			req.setAttribute("rooms", rooms);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/roomManager.jsp");
			rd.forward(req, resp);
			
			
			
		}
		 
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html:charset=utf-8");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html:charset=utf-8");
		HttpSession  session=req.getSession();
		
		WebApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(this.getServletContext());
		
		
		ServletContext sc = getServletContext();
		
		String  action =req.getParameter("action");
		RoomDao  roomDao=(RoomDao) wac.getBean("roomDao");
		MemberDao  memberDao=(MemberDao)wac.getBean("memberDao");
		OrderDao  orderDao=(OrderDao)wac.getBean("orderDao");
		UserBean  userBean=(UserBean)session.getAttribute("userBean");
		
		if(userBean==null){
			System.out.println("userBean  is  null");
			userBean=new  UserBean();
		}
		 
			
		
		
		System.out.println("doPost");
//		Map map = new HashMap();  
//	     Enumeration paramNames = req.getParameterNames();  
//	    while (paramNames.hasMoreElements()) {  
//	      String paramName = (String) paramNames.nextElement();  
//	  
//	      String[] paramValues = req.getParameterValues(paramName);  
//	      if (paramValues.length == 1) {  
//	        String paramValue = paramValues[0];  
//	        if (paramValue.length() != 0) {  
//	          System.out.println("����" + paramName + "=" + paramValue);  
//	          map.put(paramName, paramValue);  
//	        }  
//	      }  
//	    }  
		
		
		if(action==null)return ;
		else  System.out.print("action:"+action);
		if(action.equals("changeroomtype")){
		String hql=null;
		String roomtype=req.getParameter("roomtype");
		System.out.print("action:"+action+"  recordetype:"+roomtype);
		int  type=Integer.parseInt(roomtype);
		 
			hql="from  Room  r  where  r.type="+type;
			
			int  count=roomDao.getCount("select count(*) from  Room  r where r.type="+type);
			System.err.println("count"+count);
			int  totalpage=count%8==0?count/8:count/8+1;
			userBean.setToatalPage(totalpage);
			userBean.setSpan(8);
			userBean.setNowPage(0);
			
			
			
			
			
			List<Room>  rooms=roomDao.findByPagging(userBean.getNowPage()*userBean.getSpan(), userBean.getSpan(),"from  Room  r where  r.type="+type);
			if(rooms!=null)
			req.setAttribute("rooms", rooms);
			session.setAttribute("userBean", userBean);
			 req.setAttribute("roomtype", String.valueOf(type));
			RequestDispatcher  rd=sc.getRequestDispatcher("/roomManager.jsp");
			rd.forward(req, resp);
		
		}
		if(action.equals("order")){
			Room  room=new  Room();
			System.out.println(req.getParameter("room_number"));
			System.out.println(req.getParameter("room_type"));
			System.out.println(req.getParameter("room_price"));
			String  room_type=req.getParameter("room_type");
			int type=0;
			System.err.print(room_type);
			if(room_type.equals("标准双人间"))
		    	type=2;
			if(room_type.equals("标准单人间"))
				type=1;
			if(room_type.equals("豪华间"))
				type=3;
			if(room_type.equals("学生情侣房"))
				type=4;
			
			room.setType(type);
			room.setNumber(Integer.parseInt(req.getParameter("room_number")));
			room.setPrice(Integer.parseInt(req.getParameter("room_price")));
			room.setState(2);
			
			
			String  time=req.getParameter("check_in");
			String  time2=req.getParameter("check_out");
			System.out.println(time);
			Date date=null;
			Date date2=null;
			try {
				date = new SimpleDateFormat("MM/dd/yyyy HH:mm").parse(time);
				date2=new SimpleDateFormat("MM/dd/yyyy HH:mm").parse(time2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			room.setCheck_in(date);
			room.setChec_out(date2);
			System.err.println("room"+room);
			
			 
			
			
			
			Member  member=new Member();
			member.setMember_birthday("1990-06-18");
			member.setMember_grand("1");
			member.setMember_integral(200);
			member.setMember_key(" 抽烟");
			member.setMember_national("中国");
			member.setMember_name(req.getParameter("member_name"));
			member.setMember_sex(req.getParameter("member_sex"));
			member.setIdcard(req.getParameter("idcard"));
			
			Order  order=new  Order();
			order.setMember(member);
			String deposit=req.getParameter("deposit");
			order.setDeposit(new Integer(deposit));
			order.setRoom(room);
			orderDao.add(order);
			
			
			 System.out.println("member"+member);
			 System.out.println("room"+room);
			 
			 
			 
			 List<Room> rooms=roomDao.findByHql("from  Room  r where  r.type="+type);
			 req.setAttribute("tabtag", String.valueOf(type-1));
			 req.setAttribute("rooms", rooms);
				RequestDispatcher rd = sc.getRequestDispatcher("/roomManager.jsp");
				rd.forward(req, resp);
		}
		
		  
		
		if(action.equals("bill"))
		{
			System.err.println("bill");
			int   number=Integer.parseInt(req.getParameter("room_number"));
			String  room_type=req.getParameter("room_type");
			int type=0;
			System.err.print(room_type);
			if(room_type.equals("标准双人间"))
		    	type=2;
			if(room_type.equals("标准单人间"))
				type=1;
			if(room_type.equals("豪华间"))
				type=3;
			if(room_type.equals("学生情侣房"))
				type=4;
			Room  room=roomDao.findById(number);
			System.out.println(room);
			room.setChec_out(null);
			room.setCheck_in(null);
			room.setState(1);
			roomDao.update(room);
			 List<Room> rooms=roomDao.findByHql("from  Room  r where  r.type="+type);
			 req.setAttribute("rooms", rooms);
			 req.setAttribute("tabtag",String.valueOf(type-1));
			RequestDispatcher rd = sc.getRequestDispatcher("/roomManager.jsp");
			rd.forward(req, resp);
		}
		
		if(action==null){
			System.out.print("action  is  null");
		}
		if(action!=null&&action.equals("checkmember"))
		{
			 
			String memberId=req.getParameter("member_id");
//			String  d1=req.getParameter("check_in");
//			String  d2=req.getParameter("check_out");
//			SimpleDateFormat  simple=new SimpleDateFormat("MM/dd/yyyy hh:mm");
//			Date date1=null;
//			Date  date2=null;
//			System.out.println("d1"+d1+"d2"+d2);
//			try{
//			  date1=simple.parse(d1);
//			   date2=simple.parse(d2);
//			}
//			catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			long  datelong=date2.getTime()-date1.getTime();
//			
//			if(datelong<0){
//				resp.getWriter().write("时间设置错误");
//				return ;
//			}
			
			System.err.println("member_id"+memberId);
			List<Member>  members=(List<Member>) memberDao.findMembersByHQL("from  Member  m  where  m.idcard="+memberId);
			if(members!=null&&members.size()>0){
				resp.getWriter().write("exist");
				System.out.print("exist");
			}
			else{
				System.out.print("not  exist");
				RequestDispatcher rd = sc.getRequestDispatcher("/roomManager.jsp");
				rd.forward(req, resp);
			}
		}  
		
		
		if(action.equals("settlement")){
			String s="";
			String   roomid=req.getParameter("room_id");
			System.err.print(roomid);
			
			Room room=roomDao.findById(Integer.parseInt(roomid));
			System.out.println(room);
			
			
			long  a=(room.getChec_out().getTime()-room.getCheck_in().getTime())/1000;  
			System.out.println(a);
			long day  =(a/24/60/60);
			long hour=(a-(day*24)*60*60)/60/60;
			long  balance=0;
			if(hour>0){
				day=day+1;
			}
			int  coast=(int) ((room.getPrice())*day);
			
			
		balance=room.getOrder().getDeposit()-coast;
		 
			
			
			
			s="您住了"+day+"天 "+hour+" 小时 余额为"+ balance;
			System.out.print(s);
			resp.getWriter().write(s);
			
			
			
		}
		
		
	}

}
