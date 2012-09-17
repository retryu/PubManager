<%@page import="com.model.Room"%>
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
	List<Room> rooms = (List<Room>) request
			.getAttribute("rooms");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Apple iOS and Android stuff (do not remove) -->
<meta name="apple-mobile-web-app-capable" content="no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1">
	
	
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
		<link rel="stylesheet" href="css/jquery.ui.datepicker.css"/>
		    <script type='text/javascript' src='/PubManager/dwr/engine.js'></script>
		    <script type='text/javascript' src='js/controlhead.js'></script>
        <script type="text/javascript" src="js/jquery-1.7.1.min.js">  </script>
   		<script type="text/javascript" src="js/jquery-ui.min.js">  </script>
		<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
        <script type="text/javascript" src="js/jquery-ui-slide.min.js"> </script>  
        <script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"> </script>
        <script type="text/javascript">
            $(function(){
                $('#check_out').datetimepicker();
                $('#check_in').datetimepicker();
            });
        </script>
	
	
	
	
	
	
	
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

<link rel="stylesheet" type="text/css" href="css/room.css" />
<link rel="stylesheet" type="text/css" href="css/search.css" />
<link rel="stylesheet" type="text/css" href="css/push.css" />
<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="./Dashboard/mws.theme.css"
	media="screen">
	<link rel="stylesheet" type="text/css" href="css/record.css"
	media="screen">
	
	
	
	
<!-- JavaScript Plugins -->
<script type="text/javascript" src="./Dashboard/jquery-1.7.1.min.js"></script>
     <script type='text/javascript' src='js/globals.js'></script>
         <script type='text/javascript' src='js/room.js'></script>
     <script type='text/javascript' src='js/recorde.js'></script>
 
<script type="text/javascript"
	src="./Dashboard/jquery.mousewheel-min.js">
	
</script>
<!-- jQuery-UI Dependent Scripts -->
<script type="text/javascript" src="./Dashboard/jquery-ui.js"></script>
<script type="text/javascript" src="./Dashboard/ui.spinner.min.js"></script>
<script type="text/javascript" src="./Dashboard/timepicker-min.js"></script>
<script type="text/javascript" src="./Dashboard/jquery.ui.touch-punch.min.js"></script>

<!--[if lt IE 9]>
            <script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
        <![endif]-->
<script type="text/javascript" src="./Dashboard/jquery.flot.min.js"></script>
<script type="text/javascript" src="./Dashboard/jquery.flot.pie.min.js"></script>
<script type="text/javascript"	src="./Dashboard/jquery.flot.stack.min.js"></script>
<script type="text/javascript"
	src="./Dashboard/jquery.flot.resize.min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/jquery.tipsy-min.js">
	
</script>
<script type="text/javascript" src="./Dashboard/Sourcerer-1.2-min.js"></script>
<script type="text/javascript"	src="./Dashboard/jquery.placeholder-min.js"></script>
<script type="text/javascript"src="./Dashboard/jquery.smartWizard-2.0.js"></script>
<script type="text/javascript" src="./Dashboard/jquery.validate-min.js">
	
</script>
<!-- Core Script -->
<script type="text/javascript" src="./Dashboard/mws.js"></script>
<script type="text/javascript" src="./Dashboard/demo.dashboard.js"></script>
 
 

 
<title>酒店管理</title>

</head>
<body >
  
<jsp:useBean id="userBean" class="com.model.UserBean" scope="session" />


 <index  id="tag"><%
 String  index=(String)request.getAttribute("roomtype");
 if(index!=null)out.print(index);
 else  out.print("0");
 %></index>


<div  class="mws-panel grid_8 mws-collapsible  roomdialog">
		<div class="mws-panel-header">
						<span class="mws-i-24 i-table-1"></span>
		</div>
		<div class="mws-panel-body">
			<form method="post"  id="mf"   action="room" target="mainFrame">
			<div class="content_div">
			<label   >房号:</label>
			<input  class="unUpdateInput" name="room_number" id="room_number"  value="101">
			<label   >类型:</label>
			<input   class="unUpdateInput_1" name="room_type" id="room_type" >
			<label>价格:</label>
			<input class="unUpdateInput" name="room_price" id="room_price"> 
			</div>
			<label  id="warning_lable" class="warning_lable">asd</label>
			<div class="member_info"> 
			<div class="inputlable">
			<label  >姓名</label>
			<input class="dialog_input" name="member_name" type="text"  value="老黄">
			</div>
			<div class="inputlable">
			<label  >性别</label>
			<select  name="member_sex">
 				 <option value ="男">男</option>
 				 <option value ="女">女</option>
				</select>
			</div>
			<div class="inputlable">
			<label  >身份证</label>
			<input class="dialog_input"  id="idcard" name="idcard" type="text"  value="330382199006186917">
			</div>
			<div class="inputlable" >
			<label  >押金</label>
			<input  class="dialog_input" name="deposit" type="text"  value="200">
			</div>
		  <div class="content_div">
			<lable>入住时间</lable>	<input id="check_in" name="check_in" id="endto" class="dialog_input" type="text" >
			<lable>结束时间</lable><input   id="check_out" name="check_out" id="from" class="dialog_input"  type="text"  >
			</div>
			</div>
		 
		 	<div>
			<input id="room_floor" name="room_floor"  hidden="true">
			<input  id="room_state" name="room_state"  hidden="true">
			<input type="hidden" id="action" name="action" value="order">
			</div>
			</form>
			<input name="a"  id="orderroom" type="button" value="入住" class="action" onclick="submit()">
			<input  id="bill" type="button" value="结账" class="action"  hidden="true" onclick="bill()">
			<input  id="cancel" type="button" value="取消" class="action"  onclick="cancel()">
		</div>
		
		
</div>




 <index  id="tag"><%
 String  tag=(String)request.getAttribute("tabtag");
 if(index!=null)out.print(tag);
 else  out.print("0");
 %></index>

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
					<li class="active" ><a href="room"
						class="mws-i-24 i-home">客房管理</a>
						</li>
						<li><a href="ManageServlet?action=login"
						class="mws-i-24 i-list">优惠推送</a>
						</li>

					<li ><a href="ManageServlet?action=activity"
						class="mws-i-24 i-table-1">活动管理</a></li>
					<li><a href="ManageServlet?action=flow"
						class="mws-i-24 i-list">流量分析</a>
					</li>
							<li ><a href="ManageServlet?action=activity"
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
						<span class="mws-i-24 i-table-1">客房</span>
						<div class="mws-collapse-button mws-inset">
							<span></span>
						</div>
					</div>
					<div class="mws-panel-body">
					<div  class="selectbox">
					<div class="select" id="1">标准单人间</div>
					<div  class="select" id="2">标准双人间</div>
					<div  class="select"  id="3">豪华客房</div>
					<div  class="select"  id="4">学生情侣房间</div>
					<form id="recordeform" action="room" method="post">
						<input type="hidden"  id="roomtype"   name="roomtype" value="req">
						<input  type="hidden" name="action" value="changeroomtype">
						 
					 
					</form>
					</div>
						<table class="mws-table">
							<thead>
								<tr class="headtr" algin="center">
									<th>房号  </th>
									<th>房间状态</th>
									<th>房间类型</th>
									<th>房间楼层</th>
									<th>价格</th>
									<th>入住时间</th>
									<th>结账时间</th>
								</tr>
							</thead>
							<%
								if (rooms == null)
									return;
								System.out.println("jsp  : memberlist  size:" + rooms.size()
										+ "  totalPage" + userBean.getToatalPage() + "  nowPage"
										+ userBean.getNowPage());
								System.out.println("totlaPage:" + userBean.getToatalPage());
								if (rooms != null) {
									for (int i = 0; i < rooms.size(); i++) {
										Room room = rooms.get(i);
							%>
							<%
								out.print("<tr   align='center'  class='room_item'>");
							%>
							<td><%=room.getNumber() %></td>
							<td><%
							if(room.getState()==1){out.print("空净房");}	
							if(room.getState()==2){out.print("住房");}	
							if(room.getState()==3){out.print("脏房");}	
							if(room.getState()==5){out.print("维修房");}	
							 %></td>
						 	<td><% 
						 	if(room.getType()==1){out.print("标准单人间");	}
							if(room.getType()==2){out.print("标准双人间");	}
							if(room.getType()==3){out.print("豪华间");	}
							if(room.getType()==4){out.print("学生情侣房");	}
						 	%></td>
							<td><%=room.getFlooor() %></td>
							 <td><%=room.getPrice() %></td>
						 
							<td><%
							if(room.getCheck_in()==null){
								out.println("-");
								 
								}
							else{
								out.println(room.getCheck_in());
							}
								
								%></td>
							<td><%
							if(room.getChec_out()==null){
							 	out.println("-");
							}
							else{
								out.println(room.getChec_out());
							}
							 %></td>

							<%
								}
								}
							%>
						</table>
						<div class="actionBar" style="padding-right: 500px">
							<form method="psot" id="mf" action="ManagerServlet">
								<tr>
									<td align="left"><font size="2">共<%=userBean.getToatalPage()%>页&nbsp;&nbsp;
											当前页<%=userBean.getNowPage()+1%>&nbsp;&nbsp;&nbsp;&nbsp;
									</font></td>
									<td align="right">
										<%
											if (rooms != null) {
												if (userBean.getNowPage() > 0) {
										%> <a class="paging-button"
										href="room?action=changePage&page=<%=userBean.getNowPage()- 1%>&roomtype=<%=request.getAttribute("roomtype") %>"
										target="mainFrame"> 上一页 </a> <%
 	}
 %> <%
 	for (int i = 0; i < userBean.getToatalPage(); i++) {
 %> <a
				<%if (userBean.getNowPage() == i )
						out.print("class='paging-button-current paging-button '");
					else {
						out.print("class='paging-button'");
					}%>
										href="room?action=changePage&page=<%=i%>"
										treget="mainFrame"><%=i + 1%></a> <%
 	}
 %> <%
 	if (userBean.getNowPage() < (userBean.getToatalPage()-1)) {
 %> <a class="paging-button"
										href="room?action=changePage&page=<%=userBean.getNowPage() + 1%>&roomtype=<%=request.getAttribute("roomtype") %>"
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
