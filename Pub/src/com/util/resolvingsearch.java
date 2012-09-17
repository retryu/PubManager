package com.util;

import org.omg.Messaging.SYNC_WITH_TRANSPORT;

public class resolvingsearch {
	
	public   static  void  main(String  []  args){
		resolvkeywords("可乐 茶&车");
		
	}
	public static String resolvkeywords(String  s){
		String  select_search="";    
		String  []	keywords=s.split("&");
		for(int i=0;i<keywords.length;i++){
			if(i==0)	select_search=resolvkeyword(keywords[i]);
			else  select_search=select_search+" or "+resolvkeyword(keywords[i]);
		}
		
		return select_search;
	}
	public static  String  resolvkeyword(String s){
		String  select="";
		String  []keys=s.split(" ");
		for(int  i=0;i<keys.length;	i++){
			String  select_param="(member_id like '%"+keys[i]
					+"%' or member_sex like '%"+keys[i]
					+"%' or member_name  like '%"+keys[i]
					+"%' or member_grand like '%"+keys[i]
					+"%' or member_national  like '%"+keys[i]
					+"%' or member_integral  like '%"+keys[i]
					+"%' or member_birthday  like '%"+keys[i]
					+"%' or member_key like '%"+keys[i]+"%')";
			if(i==0)select="("+select_param;
			else  select=select+" and "+select_param;
		}
		select=select+")";
	//	System.out.println("select:"+select+"\n\n");
		return  select;
	}
}
