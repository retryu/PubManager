package com.util;

import com.model.Serve;

public class ServeUtil {
	
	
	
	public  static  String conver2text(Serve  serve){
		String  text=null;
		if(serve.getServe_type().equals("book_tickets")){
			String   type="";
			if(type.equals("single")){
				type="单程";
			}
			else{  
				type="返程";  
			}
			text=type+" "+serve.getData_2()+" 到  "+serve.getData_3()+" "+"  "+serve.getData_4()+"出发"+"   "+serve.getData_5()+"返回";
		}
		if(serve.getServe_type().equals("book_food")){  
			text=serve.getData_2() +serve.getData_3()+" 个";
		}   
		if(serve.getServe_type().equals("check")){
			text="寄存"+serve.getData_1();
		}
		if(serve.getServe_type().equals("close")){
			String  close_type=serve.getData_1();
			if(close_type.equals("baby")){
				text="照看小孩";
			}
			if(close_type.equals("spa"))text="SPA";
			if(close_type.equals("child"))text="早看小孩";
			if(close_type.equals("alarm"))text="叫醒功能";
			if(close_type.equals("dnd"))text="免打扰";
		}
		return  text;
	}

}
