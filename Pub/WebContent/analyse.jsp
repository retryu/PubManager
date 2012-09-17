<%@page import="com.model.Activity"%>
<%@page import="com.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.model.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	List<Activity> activityList = (List<Activity>) request
			.getAttribute("list");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Apple iOS and Android stuff (do not remove) -->
<meta name="apple-mobile-web-app-capable" content="no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1">
<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="./Dashboard/reset.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="./Dashboard/text.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="./Dashboard/stylesheet.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="./Dashboard/fluid.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="./Dashboard/mws.style.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="./Dashboard/24x24.css"
	media="screen">

<link rel="stylesheet" type="text/css" href="css/search.css" />
<link rel="stylesheet" type="text/css" href="css/push.css" />
<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="./Dashboard/mws.theme.css"
	media="screen">
	<link rel="stylesheet" type="text/css" href="css/controlhead.css" />
<!-- JavaScript Plugins -->



<script type='text/javascript' src='js/globals.js'></script>
   <script type='text/javascript' src='js/controlhead.js'></script>


<script type="text/javascript" src="./Dashboard/jquery-1.7.1.min.js">
	
</script>
<script type="text/javascript"
	src="./Dashboard/jquery.mousewheel-min.js">
	
</script>
<!-- jQuery-UI Dependent Scripts -->
<script type="text/javascript" src="./Dashboard/jquery-ui.js">
	
</script>
<script type="text/javascript" src="./Dashboard/ui.spinner.min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/timepicker-min.js">
	
</script>
<script type="text/javascript"
	src="./Dashboard/jquery.ui.touch-punch.min.js">
	
</script>

<!--[if lt IE 9]>
            <script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
        <![endif]-->
<script type="text/javascript" src="./Dashboard/jquery.flot.min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/jquery.flot.pie.min.js">
	
</script>
<script type="text/javascript"
	src="./Dashboard/jquery.flot.stack.min.js">
	
</script>
<script type="text/javascript"
	src="./Dashboard/jquery.flot.resize.min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/jquery.tipsy-min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/Sourcerer-1.2-min.js">
	
</script>
<script type="text/javascript"
	src="./Dashboard/jquery.placeholder-min.js">
	
</script>
<script type="text/javascript"
	src="./Dashboard/jquery.smartWizard-2.0.js">
	
</script>
<script type="text/javascript" src="./Dashboard/jquery.validate-min.js">
	
</script>
<!-- Core Script -->
<script type="text/javascript" src="./Dashboard/mws.js">
	
</script>
<script type="text/javascript" src="./Dashboard/demo.dashboard.js">
	
</script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<script type="text/javascript" src="js/push.js"></script>
<title>酒店管理</title>
 



</head>
<body>

	<jsp:useBean id="userBean" class="com.model.UserBean" scope="session" />
	<div id="mws-header" class="clearfix">
		<!-- Logo Container -->
		<div id="mws-logo-container">
			<!-- Logo Wrapper, images put within this wrapper will always be vertically centered -->
			<div id="mws-logo-wrap">
				<img src="./Dashboard/mws-logo.png" alt="mws admin">
			</div>
		</div>
		<!-- User Tools (notifications, logout, profile, change password) -->
		<div id="mws-user-tools" class="clearfix">
			<!-- Notifications -->
			 <div class='message-notify'  id="mnotify">
				<div  class="notifynum"  id="notifynum">33</div>
				</div>
				<div  class="notify-dropdown-box"  id="downbox">
				
					<div class="notify-dropdown-content">
					<a  href="http://retryu.oicp.net:8080/PubManager/ManageServlet?action=serverManager"  class="notify-text"  id="dropdowntext">查看 1条未处理服务请求 </a></div>
				</div>		
			<!-- Messages -->
			<div id="mws-user-message" class="mws-dropdown-menu">
				<a
					href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"
					class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
				<!-- Unred messages count -->
				<span class="mws-dropdown-notif">35</span>
				<!-- Messages dropdown -->
				<div class="mws-dropdown-box">
					<div class="mws-dropdown-content">
						<ul class="mws-messages">
							<li class="read"><a
								href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span
									class="sender">John Doe</span><span class="message">Lorem
										ipsum dolor sit amet consectetur adipiscing elit, et al
										commore</span><span class="time">January 21, 2012</span></a></li>
							<li class="read"><a
								href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span
									class="sender">John Doe</span><span class="message">Lorem
										ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
							</li>
							<li class="unread"><a
								href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span
									class="sender">John Doe</span><span class="message">Lorem
										ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
							</li>
							<li class="unread"><a
								href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span
									class="sender">John Doe</span><span class="message">Lorem
										ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
							</li>
						</ul>
						<div class="mws-dropdown-viewall">
							<a
								href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">View
								All Messages</a>
						</div>
					</div>
				</div>
			</div>
			<!-- User Information and functions section -->
			<div id="mws-user-info" class="mws-inset">
				<!-- User Photo -->
				<div id="mws-user-photo">
					<img src="./Dashboard/profile.jpg" alt="User Photo">
				</div>
				<!-- Username and Functions -->
				<div id="mws-user-functions">
					<div id="mws-username">hello~ 酒店管理员</div>
					<ul>
						<li><a
							href="#">信息</a>
						</li>
						<li><a
							href="#">修改密码</a>
						</li>
						<li><a
							href="http://retryu.oicp.net:8080/PubManager">登出</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Start Main Wrapper -->
	<div id="mws-wrapper">
		<!-- Necessary markup, do not remove -->
		<div id="mws-sidebar-stitch"></div>
		<div id="mws-sidebar-bg"></div>
		<!-- Sidebar Wrapper -->
		<div id="mws-sidebar">
			<!-- Searchbox -->
			<div id="mws-searchbox" class="mws-inset">
				<form
					action="http://www.malijuthemeshop.com/themes/mws-admin/1.4/typography.html">
					<input type="text" class="mws-search-input"><input
						type="submit" class="mws-search-submit">
				</form>
			</div>
			<!-- Main Navigation -->
			<div id="mws-navigation">
					<ul>
						<ul>
						<li class="active" ><a href="room"
						class="mws-i-24 i-home">客房管理</a>
						</li>
						
					<li><a href="ManageServlet?action=login"
						class="mws-i-24 i-home">优惠推送</a></li>

					<li   class="active"><a href="ManageServlet?action=activity"
						class="mws-i-24 i-table-1  ">活动管理</a></li>
					<li><a href="ManageServlet?action=flow"
						class="mws-i-24 i-list">流量分析</a>
					</li>
							<li    ><a href="ManageServlet?action=serverManager"
						class="mws-i-24 i-table-1">服务管理</a></li>
				</ul>
			</div>
		</div>
		<!-- Main Container Start -->
		<div id="mws-container" class="clearfix">
			<!-- Inner Container Start -->
			<div class="container">

				<!-- Panels Start -->
				<div class="mws-panel grid_8 mws-collapsible">
					<div class="mws-panel-header">
						<span class="mws-i-24 i-table-1">活动记录</span>
						<div class="mws-collapse-button mws-inset">
							<span></span>
						</div>
					</div>
					<div class="mws-panel-body">
						<table class="mws-table">
							<thead>
								<tr class="headtr" algin="center">
									<th>标题</th>
									<th>内容</th>
									<th>操作</th>
								</tr>
							</thead>
							<%
								System.out.println("jsp  : memberlist  size:" + activityList.size()
										+ "  totalPage" + userBean.getToatalPage()+"  nowPage"+userBean.getNowPage());
								System.out.println("totlaPage:" + userBean.getToatalPage());
								if (activityList != null) {
									for (int i = 0; i < activityList.size(); i++) {
										Activity activity = activityList.get(i);
							%>
							<%
								out.print("<tr   align='center'>");
							%>
							<td><%=activity.getActivity_title()%></td>
							<td><%=activity.getActivity_content()%></td>
							<td><img src="img/edi.gif"> <a
								href="ManageServlet?action=activitydelete&id=<%=activity.getActivity_id()%>">
									<img src="img/del.gif">
							</a></td>
							<!--  					<td><a
								href="ManageServlet?action=activitydelete&id=<%=activity.getActivity_id()%>">
									<img src="img/del.gif">
							</a></td>
							 -->
							<%
								out.print("</tr>");
							%>

							<%
								}
								}
							%>
						</table>
						<div class="actionBar" style="padding-right: 500px">
							<form method="psot" id="mf" action="ManagerServlet">
								<tr>
									<td align="left"><font size="2">共<%=userBean.getToatalPage()%>页&nbsp;&nbsp;
											当前页<%=userBean.getNowPage()%>&nbsp;&nbsp;&nbsp;&nbsp;
									</font></td>
									<td align="right">
										<%
											if (activityList != null) {
												if (userBean.getNowPage() > 1) {
										%> <a class="paging-button"
										href="ManageServlet?action=changePage&pagename=/analyse.jsp&page=<%=userBean.getNowPage() - 1%>"
										target="mainFrame"> 上一页 </a> <%
 	}
 %> <%
 	for (int i = 0; i < userBean.getToatalPage(); i++) {
 %> <a
				<%if (userBean.getNowPage()==(i+1))
						out.print("class='paging-button-current paging-button '");
					else {
						out.print("class='paging-button'");
					}%>
										href="ManageServlet?action=changePage&pagename=/analyse.jsp&page=<%=i + 1%>"
										treget="mainFrame"><%=i + 1%></a> <%
 	}
 %> <%
 	if (userBean.getNowPage() < userBean.getToatalPage()) {
 %> <a class="paging-button"
										href="ManageServlet?action=changePage&pagename=/analyse.jsp&page=<%=userBean.getNowPage() + 1%>"
										target="mainFrame"> 下一页 </a> <%
 	} else {

 			out.print("<img src='img/next.gif'  style='visibility:hidden'");
 		}
 	}
 %>
									</td>
								</tr>
							</form>
						</div>
					</div>
				</div>



			</div>
			<div id="mws-footer">行客生活 thinker lift 版权所有</div>
			<!-- Main Container End -->
		</div>
	</div>


	</div>
</body>
</html>
