package com.servelet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.DB.DBUtil;
import com.DB.DBdelete;
import com.DB.DBinsert;
import com.model.Activity;
import com.model.Member;
import com.model.Serve;
import com.model.UserBean;
import com.util.resolvingsearch;

public class ServletManager extends HttpServlet {
	List data = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub  
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		System.out.print("doPost");
		resp.setContentType("text/html:charset=utf-8");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html:charset=utf-8");

		HttpSession session = req.getSession();
		UserBean userBean = (UserBean) session.getAttribute("userBean");
		if (userBean == null) {
			System.out.println("\n   userBean  is  null");
			userBean = new UserBean();
		}

		ServletContext sc = getServletContext();
		PrintWriter out = resp.getWriter();
		WebApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(this.getServletContext());
		DBUtil db = (DBUtil) wac.getBean("DBUtil");
		DBinsert  dbinsert=(DBinsert)wac.getBean("DBinsert");
		DBdelete  dbdelete=(DBdelete)wac.getBean("DBdelete");

		
		String action = req.getParameter("action");
		if(action==null)action="";
		
		System.out.println("action:"+action);
		
		System.out.println("action:" + action + "\n\n\n");
		 
		
		
		if (action.equals("login")) {
				
			String  aname=req.getParameter("id");
			
			String  apwd=req.getParameter("pd");
			
			
			System.out.println("username:"+aname+"   apwd:"+apwd+"\n\n");
			
			int totalPage = db.getTotalPage("select count(*) from  Member", 7);
			userBean.setToatalPage(totalPage);
			userBean.setNowPage(1);
			userBean.setHql("from  Member");
			data = (List<Member>) db.getPageContent(userBean.getHql(), 1, 7);
			System.out.println("size"+data.size());
			for (int i = 0; i < data.size(); i++) {
				System.out.println("member:"+i+":"+data.get(i).toString());
			}
			req.setAttribute("list", data);
			System.out.println("userBean.TotalPage:"+userBean.getToatalPage()+"  userBean.NowPage:"+userBean.getNowPage()+"\n\n");
			RequestDispatcher rd = sc.getRequestDispatcher("/pushManager.jsp");
			rd.forward(req, resp);
		}

		if (action.equals("changePage")) {

			String page = req.getParameter("page");
			String url = req.getParameter("pagename");
			userBean.setNowPage(Integer.parseInt(page));
			System.out.println("page:" + page + "    pagename" + url+"  hql"+userBean.getHql());
			System.out.println("user  hql:"+userBean.getHql()+"user  page"+userBean.getNowPage());
			List  list = db.getPageContent(userBean.getHql(), userBean.getNowPage(), userBean.getSpan());
			 
			req.setAttribute("list", list);
			System.out.println("list size:"+list.size());
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(req, resp);
		}
		if(action.equals("search")){
			
			String  hql="";
			boolean  select_mark=true;
			String   select_sex="";
			String  select_grand="";
			String  select_intergal="";
			String  keywords=req.getParameter("keywords");
			String female=req.getParameter("checkfemale");
			String  male=req.getParameter("checkmale");
			String grand_type_1=req.getParameter("1");
			String  grand_type_2=req.getParameter("2");
			String  grand_type_3=req.getParameter("3");
			String  grand_type_4=req.getParameter("4");
			String  integral1=req.getParameter("integral1");
			String  integral2=req.getParameter("integral2");
			String	select_keysearch="";
		//	System.out.print("keys "+keywords);
			if(!keywords.equals(""))
			 	select_keysearch=resolvingsearch.resolvkeywords(keywords);
		 
			if(!integral1.equals("") &&!integral2.equals(""))
			select_intergal="member_integral>="+integral1+"  and "+"  member_integral<= "+integral2;
			
			if(female!=null&&male==null)select_sex=" member_sex='濂� ";
			if(female==null&&male!=null)select_sex=" member_sex='鐢� ";
			
		 
			if(grand_type_1!=null){
				if(!select_grand.equals(""))
					select_grand+=" or member_grand=1";
				else select_grand+="member_grand=1";
			}
			if(grand_type_2!=null){
				if(!select_grand.equals("")) select_grand+=" or member_grand=2";
				else select_grand+="member_grand=2";
			}
			if(grand_type_3!=null){
				if(!select_grand.equals("")) select_grand+=" or member_grand=3";
				else select_grand+="member_grand=3";
			}
			if(grand_type_4!=null){
				if(!select_grand.equals("")) select_grand+=" or member_grand=4";
				else select_grand+="member_grand=4";
			}
			
			
			
			if(!select_grand.equals(""))
			{
			hql+=" where ("+select_grand+")";
			select_mark=false;
			}
			if(!select_sex.equals("")){
				if(select_mark==true)
				{
					hql+=" where "+select_sex;
					select_mark=false;
				}
				else{
					hql+=" and ("+select_sex+")";
				}
			}
			if(!select_intergal.equals("")){
				if(select_mark==true){
					hql+=" where "+select_intergal;
					select_mark=false;
				}
				else{
					hql+=" and ("+select_intergal+")";
				}
			}
			if(!select_keysearch.equals("")){
				if(select_mark==true){
					hql+=" where "+select_keysearch;
					select_mark=false;
				}
				else{
					hql+=" and ("+select_keysearch+")";
				}
			}
			
			System.out.println(hql);
			
			hql="from Member "+hql;
			System.out.println("\nhql:  "+hql);
			
			int totalPage = db.getTotalPage("select count(*) from  Member", 7);
			System.out.print("totlPage:"+totalPage);
			userBean.setToatalPage(totalPage);
			userBean.setNowPage(1);
			userBean.setHql(hql);
			data = (List<Member>) db.getPageContent(hql, 1, 7);
			
			System.out.println("list Size:"+data.size()+"\n\n");
			req.setAttribute("list", data);
			System.out.println("datalist size:"+data.size()+"  userBean.TotalPage:"+userBean.getToatalPage()+"  userBean.NowPage:"+userBean.getNowPage()+"\n\n");
			RequestDispatcher rd = sc.getRequestDispatcher("/pushManager.jsp");
			rd.forward(req, resp);
		}
		if(action.equals(""))
		{  
		 
			try {
				System.out.println("req  charset:"+req.getCharacterEncoding());
				DiskFileItemFactory  factory=new  DiskFileItemFactory();
				String  rootpath="/home/yu/apache-tomcat-7.0.26/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PubManager/activityImg";
				String  path1=ServletManager.class.getClassLoader().getResource("").getPath();
				String  path2=sc.getRealPath("/");
				System.out.println("path1:"+path1+"    path2:"+path2);
				
				factory.setRepository(new File(rootpath+"/temp")); 
				ServletFileUpload  upload=new  ServletFileUpload(factory);
				upload.setHeaderEncoding("utf-8");
				List<FileItem>  items=upload.parseRequest(req);
				Activity  activity=new  Activity();
					Iterator  iterator=items.iterator();
					while(iterator.hasNext()){
						FileItem  item=(FileItem)iterator.next();
						if(item.getContentType()!=null&&item.getContentType().contains("image")&&item.getSize()>0){
							try {
								if(item.getFieldName().equals("bigimg")){
									item.write(new  File(rootpath+"/"+item.getName()));
									activity.setActivity_bigImg("http://retryu.oicp.net:8080/PubManager/activityImg"+"/"+item.getName());
								}  
								if(item.getFieldName().equals("smallimg")){
									item.write(new File(rootpath+"/"+item.getName()));
									activity.setActivity_smallImg("http//retryu.oicp.net:8080/PubManafer/activityImg"+"/"+item.getName());
								}
							} catch (Exception e) {
								e.printStackTrace();
							} 
						}
						if(item.getFieldName().equals("activitytitle")){
							//System.out.println("actitle_title:"+new  String(item.getString().getBytes(),"UTF-16"));
							activity.setActivity_title(item.getString("utf-8"));
						}  
						if(item.getFieldName().equals("activitycontent")){
						//	System.out.println("activity_content:"+new  String(item.getString().getBytes(),"ISO-8859-1"));
							activity.setActivity_content(item.getString("utf-8"));
						}
						if(item.getFieldName().equals("from")){
							activity.setStart_time(item.getString("utf-8").trim());
							System.out.println("start  time:"+item.getString("utf-8"));
						}
						if(item.getFieldName().equals("endto")){
							activity.setEnd_time(item.getString("utf-8").trim());
							System.out.println("end  time:"+item.getString("utf-8"));
						}
					}
					//
					System.out.println("activity:"+activity.toString());
					dbinsert.inserTable("Activity", activity);
						List<Member>  memberList=data;
						for(int  i=0;i<memberList.size();i++){
							if(memberList.get(i).getMember_token()!=null){
								System.out.println("\n\nredy  to push:"+memberList.get(i).toString());
							Push2Iphone  p2phione=new  Push2Iphone();
							p2phione.Push2Phone("http://retryu.oicp.net:8080/PubManager/registMember?activity_id="+activity.getActivity_id(),memberList.get(i).getMember_token());
							RequestDispatcher  rd=sc.getRequestDispatcher("/pushManager.jsp");
							req.setAttribute("list", data);
							rd.forward(req, resp);
							}
						}
				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		if(action.equals("activitydelete")){
			String deleteID=req.getParameter("id");
			userBean.setToatalPage(db.getTotalPage("select  count(*)  from  Activity", userBean.getSpan()));
			
			
			dbdelete.deleteTable("Activity", deleteID);
			RequestDispatcher  rd=sc.getRequestDispatcher("/analyse.jsp");
			List<Activity>  activityList=(List<Activity>) db.getPageContent("from Activity", userBean.getNowPage(), userBean.getSpan());
			req.setAttribute("list", activityList);
			rd.forward(req, resp);
		}
		if(action.equals("activity")){
			int  totalPage=db.getTotalPage("select  count(*)  from  Activity",7);
			String  hql="from  Activity";
			userBean.setToatalPage(totalPage);
			userBean.setNowPage(1);
			userBean.setHql(hql);
			userBean.setSpan(7);
			List<Activity>  activityList=(List<Activity>) db.getPageContent("from  Activity", 1, 7);
			
			System.out.println("activity List:"+activityList.size());
			req.setAttribute("list", activityList);
			RequestDispatcher rd=sc.getRequestDispatcher("/analyse.jsp");
			rd.forward(req, resp);
			
		}  
		if(action.equals("serverManager")){
			 
			
			String  hql="select new  Serve(s.serve_id,s.serve_type,s.data_1,s.data_2,s.data_3,s.data_4,s.data_5,s.serve_time,s.serve_state,s.member_id,m.member_name)from Member  m, Serve s where  s.member_id=m.member_id  order  by  s.serve_id  desc" ;
			String  counthql="select  count(*) from  Serve";
			int  totalPage=db.getTotalPage(counthql, 10);
			userBean.setToatalPage(totalPage);
			userBean.setNowPage(1);
			userBean.setHql(hql);
			data=	(List<Serve> )db.getPageContent(hql, 1, 10);
			req.setAttribute("list", data);
			RequestDispatcher  rd=sc.getRequestDispatcher("/serverManager.jsp");
			rd.forward(req, resp);
		}
		
		if(action.equals("changercordetype")){
			String  recodertype="";
			recodertype=req.getParameter("recordetype");
			String  counthql="select  count(*)  from   Member  m, Serve s where  s.member_id=m.member_id ";
			String  hql="select new  Serve(s.serve_id,s.serve_type,s.data_1,s.data_2,s.data_3,s.data_4,s.data_5,s.serve_time,s.serve_state,s.member_id,m.member_name)from Member  m, Serve s where  s.member_id=m.member_id ";
			if(!recodertype.equals("recent")){
				hql=hql+" and  serve_type='"+recodertype+"'";
				counthql=counthql+" and  serve_type='"+recodertype+"'";
			}
			hql=hql+"order  by  s.serve_id  desc";
			
			
			int  totalPage=db.getTotalPage(counthql, 10);
			System.out.println("totlaPgae:"+totalPage+" recodertype:"+recodertype);
			userBean.setHql(hql);
			userBean.setNowPage(1);
			userBean.setToatalPage(totalPage) ;
			data =(List<Serve>)db.getPageContent(hql, 1, 10);
			System.out.println("doPost:  changerecordetype  && actiontype:"+recodertype+"  hql:"+hql);
			for(int  i=0;i<data.size();i++){
				System.out.println("  data  i:"+i+"  "+data.get(i).toString());
			}
			req.setAttribute("list", data);
			if(recodertype.equals("recent"))req.setAttribute("tabtag","0");
			if(recodertype.equals("book_tickets"))req.setAttribute("tabtag","1");
			if(recodertype.equals("book_food"))req.setAttribute("tabtag","2");
			if(recodertype.equals("check"))req.setAttribute("tabtag","3");
			if(recodertype.equals("close"))req.setAttribute("tabtag","4");
			
			RequestDispatcher  rd=sc.getRequestDispatcher("/serverManager.jsp");
			rd.forward(req, resp);
			
			
			
			
			
			 
			
		}
				
		if(action.equals("flow")){
			RequestDispatcher  rd=sc.getRequestDispatcher("/flow.jsp");
			rd.forward(req, resp);
		}
		
		  
		
	}
	
	
	
	
	public  void   push(){
		
		
	}
	 
	
	//member_id like  '%li%' or  member_id like '%li%'  or member_sex  like '%li%'  or  member_name  like '%li%'  or  member_grand  like '%li%'  or  member_natioanal  like '%li%'  or  member_integral like '%li%' or  member_birthday  like '%li;
	//member_id like  '%as%' or  member_id like '%as%'  or member_sex  like '%as%'  or  member_name  like '%as%'  or  member_grand  like '%as%'  or  member_natioanal  like '%as%'  or  member_integral like '%as%' or  member_birthday  like '%as%'
//insert  into  Member(member_id,member_name,member_sex,member_grand,member_birthday,member_national,member_integral,memeber_) values('18042107657','lily','濂�,1,'1990-02-09',' 缇庡浗',500);

}
