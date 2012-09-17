package com.servelet;

import java.util.Collection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessions;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.util.SendInfoService;

public class Remote implements  ServletContextAware{
	  SendInfoService  sendinfo=null;
	  private ServletContext servletContext = null;
	  public Remote() {
		// TODO Auto-generated constructor stub
		  System.out.print("\n~~inir  Remote");
	}
	  public  String  getDate(String  usercode){
		  	System.out.println("method  getDate():"+usercode);
		  	
		  ScriptSessions.addScript("setnotify('10')");
		  return  "call methods  getDate()"+usercode;
	  }
	  public  void  noticeNewOrder(String  fileName,int  con,String  userCode){
		  System.out.println("method():noticeNewOrder");
		  WebContext  wctx=WebContextFactory.get();
		  
		  
		  ScriptSessions.setAttribute("usercode",userCode);
		  String  currentPage="/PubManager/index.jsp";
		  ScriptBuffer  script=new  ScriptBuffer();
	        script.appendScript("InitMsgBox(").appendData(fileName)
            .appendScript("," + con + ");");
	        Collection<ScriptSession> pages = wctx.getScriptSessionsByPage(currentPage);
	        for (ScriptSession session: pages) {
	            if(session.getAttribute("usercode")!=null){
	            String usercode=(String)session.getAttribute("usercode");
	            System.out.println("sessionattri:"+usercode );
	            //鍒ゅ畾鐩爣鐢ㄦ埛 鎺ㄤ俊鎭�	            if(sendinfo.checkTargetUser(usercode)){
	                session.addScript(script);
	            }
	            }
		  
	  }
	  
	  public  void  test(){
		  System.out.println("method():test");
	  }
	  
	  
	  
	 public  SendInfoService  getSendInfo(){
		  System.out.println("method():getSendInfo");
		 return  new  SendInfoService();
	 }
	@Override
	public void setServletContext(ServletContext sc) {
			this.servletContext=sc;
	}
 
	  
	  
}
