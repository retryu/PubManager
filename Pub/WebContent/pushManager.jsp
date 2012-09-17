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
                $('#from').datetimepicker();
                $('#endto').datetimepicker();
            });
        </script>




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





<script type='text/javascript' src='js/globals.js'></script>
   <script type='text/javascript' src='js/controlhead.js'></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<script type="text/javascript" src="js/push.js"></script>


<!-- JavaScript Plugins -->

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
	
</script><script src="js/highcharts.js"></script>

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
<!-- 
<script >
dwr.engine.setActiveReverseAjax(true);
dwr.engine._errorHandler = function(message, ex) {dwr.engine._debug("Error: " + ex.name + ", " + ex.message, true);};
</script>  -->



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
					<li><a href="room"
						class="mws-i-24 i-home">客房管理</a>
						</li>
						<li   class="active" ><a href="ManageServlet?action=login"
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


			<div class="checkgrid"">
				<div class="selectbox">
					<form action="ManageServlet" method="post" id="searchform"
						target="mainFrame">
						<div class="selecthead">
							<div class="boxname">
								<font class="boxfont"> 性别: </font>
							</div>
							<div class="checkallDiv">
								<font class="boxfont"> 全选 </font> <input class="checkallbox"
									type="checkbox">
							</div>
						</div>
						<div class="selectcontent">
							<div class="checkboxDiv" checkbox>
								<font> 男 </font> <input name="checkmale" class="checkbox"
									type="checkbox">
							</div>
							<div class="checkboxDiv" checkbox>
								<font> 女 </font> <input name="checkfemale" class="checkbox"
									type="checkbox">
							</div>
						</div>
				</div>


				<div class="selectbox">
					<div class="selecthead">
						<div class="boxname">
							<font class="boxfont"> 会员等级 </font>
						</div>
						<div class="checkallDiv">
							<font class="boxfont"> 全选 </font> <input class="checkallbox"
								type="checkbox">
						</div>
					</div>
					<div class="selectcontent">
						<div class="checkboxDiv" checkbox>
							<font>vip</font> <input name="1" class="checkbox" type="checkbox">
						</div>
						<div class="checkboxDiv" checkbox>
							白金 <input name="2" class="checkbox" type="checkbox">
						</div>
						<div class="checkboxDiv" checkbox>
							<font>钻石</font> <input name="3" class="checkbox" type="checkbox">
						</div>
						<div class="checkboxDiv" checkbox>
							<font>黄金</font> <input name="4" class="checkbox" type="checkbox">
						</div>
					</div>
				</div>


				<div class="selectbox">
					<div class="selecthead">
						<div class="boxname">
							<font class="boxfont"> 会员积分 </font>
						</div>
					</div>
					<div class="selectcontent">
						<div class="integralbox">
							<input name="integral1" style="width: 40px" type="text">------<input
								name="integral2" style="width: 40px" type="text">
						</div>
					</div>
				</div>





				<div class="selectbox">
					<div class="selecthead">
						<div class="boxname">
							<font class="boxfont"> 关键字搜索 </font>
						</div>
					</div>
					<div class="selectcontent" id="searchcontent">
						<input name="key" id="inputkey" style="width: 130px;" type="text">
						<input id="addkey" type="button" value="添加"> <input
							name="keywords" type="hidden">
						<div id="keycontent" class="keycontent"></div>
					</div>
				</div>



				<div class="searchbuttom">
					<input class="btnsubmit" type="button" value="筛选"
						onclick="submit()"> <input type="hidden" name="action"
						value="search">
					</form>
				</div>
			</div>
			<div class="container">
			 
				<!-- Panels Start -->

				<div class="mws-panel grid_8 mws-collapsible">
					<div class="mws-panel-header">
						<span class="mws-i-24 i-table-1">推送会员列表</span>
						<div class="mws-collapse-button mws-inset">
							<span></span>
						</div>
					</div>
					<div class="mws-panel-body">
						<table class="mws-table">
							<thead>
								<th>会员ID</th>
								<th>姓名</th>
								<th>性别</th>
								<th>会员级别</th>
								<th>国籍</th>
								<th>积分</th>
								<th>生日</th>
								<th>服务历史</th>
							</thead>
							<%
								System.out.println("jsp:   memberlist  size:" + membersList.size()
										+ "  totalPage" + userBean.getToatalPage() + "  now  page:"
										+ userBean.getNowPage());
								System.out.println("totlaPage:" + userBean.getToatalPage());
								for (int i = 0; i < membersList.size(); i++) {
									System.out.println(membersList.get(i).getMember_name());
								}
								if (membersList != null) {
									for (int i = 0; i < membersList.size(); i++) {
										String grand = "";
										if (membersList.get(i).getMember_grand().equals("1")) {
											grand = "vip";
										}
										if (membersList.get(i).getMember_grand().equals("2")) {
											grand = "白金";
										}
										if (membersList.get(i).getMember_grand().equals("3")) {
											grand = "钻石";
										}
										if (membersList.get(i).getMember_grand().equals("4")) {
											grand = "黄金";
										}
							%>
							<%
								out.print("<tr bgcolor='#EBF5FD' align='center'>");
							%>
							<td><%=membersList.get(i).getMember_name()%></td>
							<td><%=membersList.get(i).getMember_name()%></td>
							<td><%=membersList.get(i).getMember_sex()%></td>
							<%
								out.print("<td>" + grand + "</td>");
							%>
							<td><%=membersList.get(i).getMember_national()%></td>
							<td><%=membersList.get(i).getMember_integral()%></td>
							<td><%=membersList.get(i).getMember_birthday()%></td>
							<td><%=membersList.get(i).getMember_key()%></td>
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
											if (membersList != null) {
												if (userBean.getNowPage() > 1) {
										%> <a class="paging-button"
										href="ManageServlet?action=changePage&pagename=/pushManager.jsp&page=<%=userBean.getNowPage() - 1%>"
										target="mainFrame"> 上一页 </a> <%
 	}
 %> <%
 	for (int i = 0; i < userBean.getToatalPage(); i++) {
 %> <a
										<%if (userBean.getNowPage() == (i + 1))
						out.print("class='paging-button-current paging-button'");
					else
						out.print("class='paging-button'");%>
										href="ManageServlet?action=changePage&pagename=/pushManager.jsp&page=<%=i + 1%>"
										treget="mainFrame"><%=i + 1%></a> <%
 	}
 %> <%
 	if (userBean.getNowPage() < userBean.getToatalPage()) {
 %> <a class="paging-button"
										href="ManageServlet?action=changePage&pagename=/pushManager.jsp&page=<%=userBean.getNowPage() + 1%>"
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
				
				<div class="mws-panel grid_4">
				<div class="mws-tabs ui-tabs ui-widget ui-widget-content ui-corner-all">

                        <ul  id="tabs" class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                            <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tab-1">推送编辑</a></li>
                            <li class="ui-state-default ui-corner-top  "><a href="#tab-2">推送统计</a></li>
                        </ul>
                        <div  id="content">
				               <div class="ui-tabs-panel" style="width: 100%; height: 550px; padding: 10px;" id="tab-1">
											<form method="post" action="ManageServlet" id="pushform"
												enctype="multipart/form-data">
												<div class="launch">
													<ul class="launchprojects">
														<li><font>活动名称</font> <input name="activitytitle"
															id="activitytitle" type="text"></li>
														<li><font>上传小图片</font> <input class="upfilebutton"
															name="smallimg" id="fileInput" type="file"
															onchange='showUpload(this.files)'></li>
														<li><font>上传大图片</font> <input name="bigimg" type="file"
															id="fileInput" onchange='showUpload2(this.files)'></li>
														<li><font>活动正文</font> <input class="activitytext"
															id="activitytext" name="activitycontent"></li>
														<li>活动起始：<input id="from" type="text"
															style="width: 100px;" name="from">活动结束:<input
															type="text" id="endto" style="width: 100px;" name="endto" />
														</li>
														<div></div>
														<li><input type="button" class="pushButton" value="推送"
															onclick="submit()"></li>
													</ul>
												</div>
											</form>
											<div class="showphone">
												<div class="phonetitle">
														<div id="phoneimg"></div>
														<span class="phonefont" id="phonetitle">还未输入</span><br>  
												</div>
											</div>
												<div class="showphone2">
												<div class="phonecontent">
												 
													<div id="phoneimg2"></div>
													 活动内容： <div class="phonefont"	id="phonetext">还未输入</div	>
												</div>
											</div>
										</div>
                        
                        <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="tab-2">
							<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
                        </div>
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
