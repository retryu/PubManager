package com.servelet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;


public class RefershServlet extends  HttpServlet{
	Random  r=new Random(System.currentTimeMillis());
	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int  visitordata[]=null;
		int  orderdata[]=null;
		int  incomedata[]=null;
		int  newvisitordata[] = null;
		int  data[][]=new int[2][12];
			String  action=req.getParameter("action");
			String  s1=req.getParameter("s1");
			String   s2=req.getParameter("s2");
		 
			String jason="";
			JSONArray  jsarray=new JSONArray();
			System.out.println("s1:"+s1+" s2:"+s2+" action:"+action);
			System.out.println("\n\nRefersh doGet");
			if(action.equals("refershcompare")){
					visitordata=new  int[12];
					orderdata=new  int[12];
					incomedata=new  int[12];
					newvisitordata=new  int[12];
					visitordata=getRandomData(12);
					orderdata=getRandomData(12);
					incomedata=getRandomData(12);
					newvisitordata=getRandomData(12);
				
						if(s1.equals("newvisitor")){
							data[0]=newvisitordata;
						}
						if(s1.equals("visitor")){
							data[0]=visitordata;
						}
						if(s2.equals("order")){
							data[1]=orderdata;
						}
						if(s2.equals("income")){
							data[1]=incomedata;
						}
			}
			if(action.equals("refershPeriod")){
				String  period=req.getParameter("period");
				if(period.equals("week")){
					visitordata=new  int[7];
					orderdata=new  int[7];
					incomedata=new  int[7];
					newvisitordata=new  int[7];
					visitordata=getRandomData(7);
					orderdata=getRandomData(7);
					incomedata=getRandomData(7);
					newvisitordata=getRandomData(7);
				}
				if(period.equals("month")){
					visitordata=new  int[12];
					orderdata=new  int[12];
					incomedata=new  int[12];
					newvisitordata=new  int[12];
					visitordata=getRandomData(12);
					orderdata=getRandomData(12);
					incomedata=getRandomData(12);
					newvisitordata=getRandomData(12);
				}
				if(period.equals("day")){
					visitordata=new  int[6];
					orderdata=new  int[6];
					incomedata=new  int[6];
					newvisitordata=new  int[6];
					visitordata=getRandomData(6);
					orderdata=getRandomData(6);
					incomedata=getRandomData(6);
					newvisitordata=getRandomData(6);
				}
				if(s1.equals("newvisitor")){
					data[0]=newvisitordata;
				}
				if(s1.equals("visitor")){
					data[0]=visitordata;
				}
				if(s2.equals("order")){
					data[1]=orderdata;
				}
				if(s2.equals("income")){
					data[1]=incomedata;
				}
			}
			jason=jsarray.fromObject(data).toString();
			System.out.print("jason:"+jason);
		resp.getWriter().write(jason);
	}
	public  int[]  getRandomData(int  length){
		int  a[]=new  int[length];
		System.out.println(System.currentTimeMillis());
		for(int  i=0;i<length;i++){
				a[i]=Math.abs(r.nextInt())%200;
		}
		return  a;
	}
 
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			System.out.println("\n\nRefersh doPost");
	}
}
