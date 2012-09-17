<%@page import="com.util.ServeUtil"%>
<%@page import="com.model.Activity"%>
<%@page import="com.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.model.Serve"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	List<Serve> serveList = (List<Serve>) request
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
	<link rel="stylesheet" type="text/css" href="css/controlhead.css" />
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
	<link rel="stylesheet" type="text/css" href="css/record.css"
	media="screen">
<!-- JavaScript Plugins -->
     <script type='text/javascript' src='js/globals.js'></script>
   <script type='text/javascript' src='js/controlhead.js'></script>
     <script type='text/javascript' src='js/recorde.js'></script>
<script type="text/javascript" src="./Dashboard/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="./Dashboard/jquery.mousewheel-min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/jquery-ui.js"></script>
<script type="text/javascript" src="./Dashboard/ui.spinner.min.js"></script>
<script type="text/javascript" src="./Dashboard/timepicker-min.js"></script>
<script type="text/javascript"src="./Dashboard/jquery.ui.touch-punch.min.js"></script>

<script type="text/javascript" src="./Dashboard/jquery.flot.min.js"></script>
 
<script type="text/javascript"src="./Dashboard/jquery.flot.stack.min.js"></script>
<script type="text/javascript"src="./Dashboard/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="./Dashboard/jquery.tipsy-min.js"></script>
<script type="text/javascript" src="./Dashboard/Sourcerer-1.2-min.js"></script>
<script type="text/javascript"src="./Dashboard/jquery.placeholder-min.js"></script>
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
<!-- <script >
 
dwr.engine.setActiveReverseAjax(true);



dwr.engine._errorHandler = function(message, ex) {dwr.engine._debug("Error: " + ex.name + ", " + ex.message, true);};
</script>  -->

 
 

 
<title>酒店管理</title>

</head>
<body >  
 <index  id="tag"><%
 String  index=(String)request.getAttribute("tabtag");
 if(index!=null)out.print(index);
 else  out.print("0");
 %></index>

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
					<a  href=""  class="notify-text"  id="dropdowntext">查看 1条未处理服务请求 </a></div>
				            <embed id="soundControl" src="iphone_Ring.mp3" mastersound hidden="true" loop="false" autostart="false"></embed>
				
				</div>			 
			<!-- Messages -->
			<div id="mws-user-message" class="mws-dropdown-menu">
				<a
					href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"
					class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
				<!-- Unred messages count -->
				<!-- Messages dropdown -->
			 
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
							href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">信息</a>
						</li>
						<li><a
							href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">修改密码</a>
						</li>
						<li><a
							href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/index.html">登出</a>
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
							<li><a href="room"
						class="mws-i-24 i-home">客房管理</a>
						</li>
					<li><a href="ManageServlet?action=login"
						class="mws-i-24 i-home">优惠推送</a></li>

					<li ><a href="ManageServlet?action=activity"
						class="mws-i-24 i-table-1">活动管理</a></li>
					<li><a href="ManageServlet?action=flow"
						class="mws-i-24 i-list">流量分析</a>
					</li>
							<li  class="active" ><a href="ManageServlet?action=activity"
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
					<div  class="selectbox">
					<div class="select" id="recent">最近请求</div>
					<div  class="select" id="book_tickets">出行预定</div>
					<div  class="select"  id="book_food">饮食预定</div>
					<div  class="select"  id="check">物品寄存</div>
					<div class="select"  id="close">贴心服务</div>
					<form id="recordeform" action="ManageServlet" method="post">
						<input type="hidden"  id="recordetype"   name="recordetype" value="req">
						<input  type="hidden" name="action" value="changercordetype">
						 
					
					</form>
					</div>
						<table class="mws-table">
							<thead>
								<tr class="headtr" algin="center">
									<th>服务请求时间</th>
									<th>房间号</th>
									<th>姓名</th>
									<th>服务内容</th>
									<th>联系电话</th>
									<th>处理状态</th>
								</tr>
							</thead>
							<%
								if (serveList == null)
									return;
								System.out.println("jsp  : memberlist  size:" + serveList.size()
										+ "  totalPage" + userBean.getToatalPage() + "  nowPage"
										+ userBean.getNowPage());
								System.out.println("totlaPage:" + userBean.getToatalPage());
								if (serveList != null) {
									for (int i = 0; i < serveList.size(); i++) {
										Serve serve = serveList.get(i);
							%>
							<%
								out.print("<tr   align='center'>");
							%>
							<td><%=serve.getServe_time() %></td>
							<td>1305</td>
							<td><%=serve.getMember_name() %></td>
						 	<td><%  out.print(ServeUtil.conver2text(serve)); %></td>
							<td><%=serve.getMember_id() %></td>
							<td>
								<% 
								if(serve.getServe_state()==0){
									out.print("未处理");
								}
								else{
									out.print("已处理");
								}
								%>
							</td>
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
											if (serveList != null) {
												if (userBean.getNowPage() > 1) {
										%> <a class="paging-button"
										href="ManageServlet?action=changePage&pagename=/serverManager.jsp&page=<%=userBean.getNowPage() - 1%>"
										target="mainFrame"> 上一页 </a> <%
 	}
 %> <%
 	for (int i = 0; i < userBean.getToatalPage(); i++) {
 %> <a
				<%if (userBean.getNowPage() == (i + 1))
						out.print("class='paging-button-current paging-button '");
					else {
						out.print("class='paging-button'");
					}%>
										href="ManageServlet?action=changePage&pagename=/serverManager.jsp&page=<%=i + 1%>"
										treget="mainFrame"><%=i + 1%></a> <%
 	}
 %> <%
 	if (userBean.getNowPage() < userBean.getToatalPage()) {
 %> <a class="paging-button"
										href="ManageServlet?action=changePage&pagename=/serverManager.jsp&page=<%=userBean.getNowPage() + 1%>"
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
