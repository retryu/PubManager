package com.servelet;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javapns.back.PushNotificationManager;
import javapns.back.SSLConnectionHelper;
import javapns.data.Device;
import javapns.data.PayLoad;
public class Push2Iphone {
	
	
	public  static  void  main(String[] agrs){
	}
	
	public     void  Push2Phone(String  url,String  token){
		System.out.print("url:"+url);
		String deviceToken = "e702d403 91ace315 819dfa06 612c8417 a0d5779c 5fae385e d3966b41 767b4cc6";
		deviceToken=token;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.SIMPLIFIED_CHINESE);
		sdf.applyPattern("yyyy年MM月dd日_HH时mm分ss秒");
		try {
			String starttime = sdf.format(new Date());
			System.out.println("\nstart  push"+"  satrt  time:"+starttime);
			
			PayLoad payLoad = new PayLoad();
			payLoad.addAlert("酒店推送");// push的内容
			payLoad.addCustomDictionary("url",url);
			payLoad.addBadge(1);// 图标小红圈的数值
			payLoad.addSound("default");// 铃音
			PushNotificationManager pushNotificationManager = PushNotificationManager
					.getInstance();
			pushNotificationManager.addDevice("iPhone", deviceToken);
			String host = "gateway.sandbox.push.apple.com";
			int port = 2195;
			String certificatePath = "/home/yu/tomcat/apache-tomcat-7.0.26/webapps/PubManager/WebContent/key/Orion_dev_push.p12";// 导出的证书
			String certificatePassword = "123abc";// 此处注意导出的证书密码不能为空因为空密码会报错
			pushNotificationManager.initializeConnection(host, port,certificatePath, certificatePassword,SSLConnectionHelper.KEYSTORE_TYPE_PKCS12);
			Device client = pushNotificationManager.getDevice("iPhone");
			pushNotificationManager.sendNotification(client, payLoad);
			payLoad=null;
			pushNotificationManager.stopConnection();
			pushNotificationManager.removeDevice("iPhone");

		} catch (Exception e) {
			e.printStackTrace();
		}
		String endtime = sdf.format(new Date());
		System.out.println("\npush  finsh()  end time:"+endtime);
	}
	public  static  void pushJason(){
	}
	
	
	
	
	
}
