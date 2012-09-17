<%@page import="com.model.Activity"%>
<%@page import="com.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.DB.DBUtil"%>
<%@page import="com.model.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
List<Activity> activityList = (List<Activity>) request
.getAttribute("list"); %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Apple iOS and Android stuff (do not remove) -->
<meta name="apple-mobile-web-app-capable" content="no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1">
<!-- datepicker  css  file -->
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/jquery.ui.datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="plugins/timepicker/timepicker.css" media="screen" />


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
<link rel="stylesheet" type="text/css" href="css/flow.css"
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
	<script type="text/javascript" src="js/jquery-1.7.1.min.js">
</script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js">
	
</script>
<script src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
	<script  type="text/javascript" src="js/flow.js"></script>
	
</script>
 





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
						<li  ><a href="room"
						class="mws-i-24 i-home">客房管理</a>
						</li>
						<li><a href="ManageServlet?action=login"
							class="mws-i-24 i-home">优惠推送</a></li>
						<li><a href="ManageServlet?action=activity"
							class="mws-i-24 i-table-1">活动管理</a></li>
						<li class="active"><a href="ManageServlet?action=flow"
							class="mws-i-24 i-list">流量分析</a></li>
						<li><a href="ManageServlet?action=serverManager"
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
						<span class="mws-i-24 i-table-1">流量分析</span>
						<div class="mws-collapse-button mws-inset">
							<span></span>
						</div>
					</div>
					<div class="mws-panel-body">
						<div style="height: 700px; background: #FDFDFD">
							<div class="sectionSelectDiv">
								日期范围：<input id="from" class="dateinput" type="text"></input>至 <input
									id="endto" class="dateinput" type="text"></input>
								<div style="float: right">
									<ul  id="dateul" class="dateul">
										<div id="day" class="dateli">日</div>
										<div  id="week" class="dateli"  >周</div>
										<div id="month" class="dateli  liactivity">月</div>
									</ul>
								</div>
							</div>
							<div class="selectDiv ">
								<select id="refrom" class="refSelction">
									<option  id="visitor" vlaue="volvo">访客</option>
									<option id="newvisitor" value="saab">新客户</option>
								</select> 对比 <select id="refto" class="refSelction">
									<option id="order" vlaue="volvo">订单数</option>
									<option id="income"  value="fiat">收入</option>
								</select>
							</div>

							<div id="container"
								style="min-width: 400px; height: 400px; margin: 0, auto;">
							</div>
							<div
								style="width: 100%; height: 180px; margin-top: 125px;">
								<table  class="statisticsTable"
									style="width:100%; background-color: #FDFDFD; border-collapse: collapse;">
									<tr style="text-align:center;">
										<th class="statisticsTh">会员总数</th>
										<th class="statisticsTh">访客总次数</th>
										<th class="statisticsTh">总收入</th>
										<th >总订单数</th>
									</tr>
									<tr style="text-align:center;">
										<td class="statisticsTh statisticsTd">1000</td>
										<td class="statisticsTh statisticsTd">1000</td>
										<td class="statisticsTh statisticsTd">1000</td>
										<td class="statisticsTh statisticsTd">1000</td>
									</tr>
									<table>

									</table>
							</div>
						</div>
					</div>
				</div>

				<div class="mws-panel grid_8 mws-collapsible">
					<div class="mws-panel-header">
						<span class="mws-i-24 i-table-1">渠道分析</span>
						<div class="mws-collapse-button mws-inset">
							<span></span>
						</div>
					</div>
					<div class="mws-panel-body">
						<table class="mws-table">
							<thead>
								<th>应用市场</th>
								<th>访客</th>
								<th>订单数</th>
								<th>收入</th>
							</thead>
							<tr>
							 
								<td>二维码</td>
								<td>872</td>
								<td>1254</td>
								<td>8432</td>
							</tr>
							<tr>
							 
								<td>android market</td>
								<td>7897</td>
								<td>321</td>
								<td>8432</td>
							</tr>
							<tr>
								<td>机锋市场</td>
								<td>8741</td>
								<td>1231</td>
								<td>7120</td>
							</tr>
							<tr>
								<td>app Store</td>
								<td>1701</td>
								<td>2434</td>
								<td>5390</td>
							</tr>
							<tr>
								<td>安桌市场</td>
								<td>12309</td>
								<td>2742</td>
								<td>13900</td>
							</tr>

							<tr>
								<td>安智市场</td>
								<td>5000</td>
								<td>1000</td>
								<td>73900</td>
							</tr>
							<tr>
								<td>91市场</td>
								<td>12312</td>
								<td>124</td>
								<td>71412</td>
							</tr>
							<tr>
								<td>应用汇</td>
								<td>1244</td>
								<td>12341</td>
								<td>7123</td>
							</tr>
							<tr>
								<td>N多</td>
								<td>2241</td>
								<td>9755</td>
								<td>13900</td>
							</tr>
								<tr>
								<td>应用汇</td>
								<td>3240</td>
								<td>1230</td>
								<td>8900</td>
							</tr>
								<tr>
								<td>安桌星空</td>
								<td>1234</td>
								<td>9727</td>
								<td>7123</td>
							</tr>
								<tr>
								<td>威锋网</td>
								<td>2000</td>
								<td>867</td>
								<td>7300</td>
							</tr>
								<tr>
								<td>爱APPS</td>
								<td>5121</td>
								<td>1097</td>
								<td>8640</td>
							</tr>
								<tr>
								<td>同步推</td>
								<td>5000</td>
								<td>1000</td>
								<td>73900</td>
							</tr>
							
							<!-- 
							线下二维码
							Android market
							APP Store
							Blackberry
							机锋市场
							91市场
							安卓市场
							安智
							天网
							N多
							应用汇
							安卓星空
							威锋网
							爱APPS
							苹果I派党
							APP每日推送
							91手机助手
							同步推
							 -->
							</tr>
						</table>
						<div id="container2"
							style="min-width: 400px; height: 400px; margin: 0 auto"></div>
					</div>

				</div>
				<div class="mws-panel-body">
					<div id="container"
						style="min-width: 400px; height: 400px; margin: 0 auto"></div>
				</div>
			</div>


			<div id="mws-footer">行客生活 thinker lift 版权所有</div>
			<!-- Main Container End -->
		</div>
	</div>
	</div>
</body>
</html>
