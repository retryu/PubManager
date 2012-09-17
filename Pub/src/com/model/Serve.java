package com.model;

public class Serve {	
	int  serve_id;
	String   serve_type="";
	String  data_1="";
	String  data_2="";
	String  data_3="";
	String  data_4;
	String 	data_5;
	String  serve_time;
	int  serve_state=0;
	String  member_id="18042107650";
	String  member_name="奥爸妈";
	
	public Serve() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Serve(int serve_id, String serve_type, String data_1, String data_2,
			String data_3, String data_4, String data_5, String serve_time,
			int serve_state, String member_id, String member_name) {
		super();
		this.serve_id = serve_id;
		this.serve_type = serve_type;
		this.data_1 = data_1;
		this.data_2 = data_2;
		this.data_3 = data_3;
		this.data_4 = data_4;
		this.data_5 = data_5;
		this.serve_time = serve_time;
		this.serve_state = serve_state;
		this.member_id = member_id;
		this.member_name = member_name;
	}





	public int getServe_id() {
		return serve_id;
	}





	public void setServe_id(int serve_id) {
		this.serve_id = serve_id;
	}





	public String getServe_type() {
		return serve_type;
	}





	public void setServe_type(String serve_type) {
		this.serve_type = serve_type;
	}





	public String getData_1() {
		return data_1;
	}





	public void setData_1(String data_1) {
		this.data_1 = data_1;
	}





	public String getData_2() {
		return data_2;
	}





	public void setData_2(String data_2) {
		this.data_2 = data_2;
	}





	public String getData_3() {
		return data_3;
	}





	public void setData_3(String data_3) {
		this.data_3 = data_3;
	}





	public String getData_4() {
		return data_4;
	}





	public void setData_4(String data_4) {
		this.data_4 = data_4;
	}





	public String getData_5() {
		return data_5;
	}





	public void setData_5(String data_5) {
		this.data_5 = data_5;
	}





	public String getServe_time() {
		return serve_time;
	}





	public void setServe_time(String serve_time) {
		this.serve_time = serve_time;
	}





	public int getServe_state() {
		return serve_state;
	}





	public void setServe_state(int serve_state) {
		this.serve_state = serve_state;
	}





	public String getMember_id() {
		return member_id;
	}





	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}





	public String getMember_name() {
		return member_name;
	}





	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}





	@Override
	public String toString() {
		return "Serve [serve_id=" + serve_id + ", serve_type=" + serve_type
				+ ", data_1=" + data_1 + ", data_2=" + data_2 + ", data_3="
				+ data_3 + ", data_4=" + data_4 + ", data_5=" + data_5
				+ ", serve_time=" + serve_time + ", serve_state=" + serve_state
				+ ", member_id=" + member_id + ", member_name=" + member_name
				+ "]";
	}

 
	 
	
	
	
	
}
