package com.model;

import org.omg.Messaging.SYNC_WITH_TRANSPORT;


public class UserBean {
private  int span=8;
private  int  toatalPage=1;
private  int  nowPage=1;
private String  hql="";
private   String   PageHql="";

public UserBean(){
	System.out.print("userBean  init");
}

public int getSpan() {
	return span;
}
public void setSpan(int span) {
	this.span = span;
}
public int getToatalPage() {
	return toatalPage;
}
public void setToatalPage(int toatalPage) {
	this.toatalPage = toatalPage;
}
public int getNowPage() {
	return nowPage;
}
public void setNowPage(int nowPage) {
	this.nowPage = nowPage;
}
public String getHql() {
	return hql;
}
public void setHql(String hql) {
	this.hql = hql;
}
public String getPageHql() {
	return PageHql;
}
public void setPageHql(String pageHql) {
	PageHql = pageHql;
}

@Override
public String toString() {
	return "UserBean [span=" + span + ", toatalPage=" + toatalPage
			+ ", nowPage=" + nowPage + ", hql=" + hql + ", PageHql=" + PageHql
			+ "]";
}


	
	
}
