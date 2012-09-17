package com.servelet;

import java.util.Random;

import org.omg.Messaging.SYNC_WITH_TRANSPORT;

public class t {
	public  static  void  main(String [] args){
		Random  r=new Random(123);
		for(int  i=0;i<100;i++){
				System.out.println(Math.abs(r.nextInt())%200);
		}
	}

}
