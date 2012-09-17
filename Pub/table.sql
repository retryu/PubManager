member_id  member_name  member_grand  member_national  member_integral   member_birthday

create  table Member
 (
member_id  varchar(20)  primary  key , 
member_sex varchar(2)  not  null,
member_name varchar(20)  not  null, 
member_grand  varchar(10)  not  null,
member_national varchar(20)  not  null,
member_integral int default 0 ,
member_birthday  date,
member_token  text
);

insert  into  Member(member_id,member_name,member_sex,member_grand,member_birthday,member_national,member_integral,member_key) values('18522107659','andy','男',1,'1990-02-09',' 美国',500,'旅游');



 create  table  Activity(activity_id  int  primary  key  auto_increment,
     activity_title  text  not  null,
     activity_smallImg char(100)  not  null,
     activity_bigImg  char(100)  not null,
     activity_content  text  not null,
     activity_status  int  not null);


 
insert  into   Activity(activity_title,activity_bigImg,activity_smallImg,activity_content)  values('可爱的阿呆','/home/yu/tomcat/apache-tomcat-7.0.26/webapps/PubManager/WebContent/activityImg/a.jpg','/home/yu/tomcat/apache-tomcat-7.0.26/webapps/PubManager/WebContent/activityImg/a.jpg','阿呆');


