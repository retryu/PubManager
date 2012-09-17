<%@page import="com.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.model.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	List<Member> membersList = (List<Member>) request
			.getAttribute("list");
%>
<html>
<head>

<title>主页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link  rel="stylesheet" type="text/css" href="css/push.css"/>
</head>
<body>
	<jsp:useBean id="userBean" class="com.model.UserBean" scope="session" />
	 
	<table width="100%" border="0" cellspacing="1" bgcolor="white">
		<tr bgcolor="#D1F1FE" algin="center">
			<th>会员ID</th>
			<th>姓名</th>
			<th>性别</th>
			<th>会员级别</th>
			<th>国籍</th>
			<th>积分</th>
			<th>生日</th>
			<th>服务历史</th>
		</tr>
		<%
			System.out.println("totlaPage:" + userBean.getToatalPage());
			if(membersList!=null){
			for (int i = 0; i < membersList.size(); i++) {
			String  grand="";
			if(membersList.get(i).getMember_grand().equals("1")){
				grand="vip";
			}
			if(membersList.get(i).getMember_grand().equals("2")){
				grand="白金";
			}
			if(membersList.get(i).getMember_grand().equals("3")){
				grand="钻石";
			}
			if(membersList.get(i).getMember_grand().equals("4")){
				grand="黄金";
			}
			
		%>
		<%  out.print("<tr bgcolor='#EBF5FD' align='center'>");  %>
			<td><%=membersList.get(i).getMember_id()%></td>
			<td><%=membersList.get(i).getMember_name()%></td>
			<td><%=membersList.get(i).getMember_sex()%></td>
			 <%out.print("<td>"+grand+"</td>");  %>
			<td><%=membersList.get(i).getMember_national()%></td>
			<td><%=membersList.get(i).getMember_integral()%></td>
			<td><%=membersList.get(i).getMember_birthday()%></td>
			<td>咖啡 SPA 葡萄酒 租车</td>

<%  out.print("</tr>");  %>
		 
		<%
			}
			}
		%>
	</table>
	<center> 
	<form method="psot" id="mf" action="ManagerServlet">
		<tr>
			<td align="left">
				<font size="2">共<%=userBean.getToatalPage()%>页&nbsp;&nbsp;
					当前页<%=userBean.getNowPage()%>&nbsp;&nbsp;&nbsp;&nbsp;
				</font></td>

			<td align="right">
				<%
				if(membersList!=null){
					if (userBean.getNowPage() > 1) {
				%> <a
				href="ManageServlet?action=changePage&pagename=/membermanage.jsp&page=<%=userBean.getNowPage() - 1%>"
				target="mainFrame"> <img src="img/prev.gif" border="0">
			</a> <%
 	}
 %> <%
 	for (int i = 0; i < userBean.getToatalPage(); i++) {
 %> <a
				href="ManageServlet?action=changePage&pagename=/membermanage.jsp&page=<%=i + 1%>"
				treget="mainFrame"><%=i + 1%></a> <%
 	}
 %> <%
 	if (userBean.getNowPage() < userBean.getToatalPage()) {
 %>
				<a
				href="ManageServlet?action=changePage&pagename=/membermanage.jsp&page=<%=userBean.getNowPage() + 1%>"
				target="mainFrame"> <img src="img/next.gif" border="0">
			</a> <%
 	} else {

 		out.print("<img src='img/next.gif'  style='visibility:hidden'");
 	}
 	}
 %>
			</td>
		</tr>
	</form>
</center>
	 

<form  method="post" style="padding-top:150px " action="ManageServlet"  id="pushform"  enctype="multipart/form-data"  >
 	<div  class="launch"> 
 		<div  class="stepintro">
 			<strong>活动编辑</strong>
 		</div>
 		<ul  class="launchprojects">
 			<li>
 				<lable>活动名称</lable>
 				<input name="activitytitle" type="text">
 			</li>
 			<li>
 				<lable  >上传大图片</lable>
 				<input  name="bigimg" type="file"   >
 			</li>
 			<li>
 				<lable >上传小图片</lable>
 				<input name="smallimg" type="file" >
 			</li>
 			<li>
 				<lable  >活动正文</lable>
 				<input  class="activitytext"   name="activitycontent" rows="30"   row="40" >
 			</li>
 		<li>
 		 <input  type="button" value="推送" onclick="submit()">
 		</li>
 		</ul>
	</div>	
	</form>











</body>
</html>