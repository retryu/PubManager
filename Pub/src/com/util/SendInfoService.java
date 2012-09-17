package com.util;

import java.util.List;

import com.model.serveMessage;
import com.servelet.ServletManager;

public class SendInfoService {
	List<serveMessage> sms = null;

	public List<serveMessage> getMessages() {
		return sms;
	}
	public void delete(serveMessage  sm){
		
	}
	public  boolean  checkTargetUser(String usercode){
		return  true;
	}

}
