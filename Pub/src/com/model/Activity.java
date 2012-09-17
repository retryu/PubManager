package com.model;

public class Activity {
	int activity_id;
	String  activity_title;
	String  activity_smallImg;
	String  activity_bigImg;
	String  activity_content;
	int activity_status;
	String  start_time;
	String end_time;
	
	public Activity() {
	 
	}
	public Activity(int activity_id, String activity_title,
			String activity_smallImg, String activity_bigImg,
			String activity_content, int activity_status, String start_time,
			String end_time) {
		super();
		this.activity_id = activity_id;
		this.activity_title = activity_title;
		this.activity_smallImg = activity_smallImg;
		this.activity_bigImg = activity_bigImg;
		this.activity_content = activity_content;
		this.activity_status = activity_status;
		this.start_time = start_time;
		this.end_time = end_time;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public String getActivity_title() {
		return activity_title;
	}
	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}
	public String getActivity_smallImg() {
		return activity_smallImg;
	}
	public void setActivity_smallImg(String activity_smallImg) {
		this.activity_smallImg = activity_smallImg;
	}
	public String getActivity_bigImg() {
		return activity_bigImg;
	}
	public void setActivity_bigImg(String activity_bigImg) {
		this.activity_bigImg = activity_bigImg;
	}
	public String getActivity_content() {
		return activity_content;
	}
	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}
	public int getActivity_status() {
		return activity_status;
	}
	public void setActivity_status(int activity_status) {
		this.activity_status = activity_status;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	@Override
	public String toString() {
		return "Activity [activity_id=" + activity_id + ", activity_title="
				+ activity_title + ", activity_smallImg=" + activity_smallImg
				+ ", activity_bigImg=" + activity_bigImg
				+ ", activity_content=" + activity_content
				+ ", activity_status=" + activity_status + ", start_time="
				+ start_time + ", end_time=" + end_time + "]";
	}
 
	

}
