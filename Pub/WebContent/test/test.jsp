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
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1">
        <!-- Required Stylesheets -->
        <link rel="stylesheet" type="text/css" href="./Dashboard/reset.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/text.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/stylesheet.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/fluid.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/mws.style.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/16x16.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/24x24.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/32x32.css" media="screen">
        <!-- Demo and Plugin Stylesheets -->
        <link rel="stylesheet" type="text/css" href="./Dashboard/demo.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/colorpicker.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/imgareaselect-default.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/fullcalendar.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/fullcalendar.print.css" media="print">
        <link rel="stylesheet" type="text/css" href="./Dashboard/chosen.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/prettyPhoto.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/tipsy.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/Sourcerer-1.2.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/jquery.jgrowl.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/fileinput.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/ui.spinner.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/timepicker.css" media="screen">
        <link rel="stylesheet" type="text/css" href="./Dashboard/jquery.ui.css" media="screen">
        <!-- Theme Stylesheet -->
        <link rel="stylesheet" type="text/css" href="./Dashboard/mws.theme.css" media="screen">
        <!-- JavaScript Plugins -->
        <script type="text/javascript" src="./Dashboard/jquery-1.7.1.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.mousewheel-min.js">
        </script>
        <!-- jQuery-UI Dependent Scripts -->
        <script type="text/javascript" src="./Dashboard/jquery-ui.js">
        </script>
        <script type="text/javascript" src="./Dashboard/ui.spinner.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/timepicker-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.ui.touch-punch.min.js">
        </script>
        <!-- Plugin Scripts -->
        <script type="text/javascript" src="./Dashboard/jquery.imgareaselect.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.dualListBox-1.3.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.jgrowl-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jQuery.fileinput.js">
        </script>
        <script type="text/javascript" src="./Dashboard/fullcalendar.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.dataTables-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/chosen.jquery.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.prettyPhoto-min.js">
        </script>
        <!--[if lt IE 9]>
            <script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="./Dashboard/jquery.flot.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.flot.pie.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.flot.stack.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.flot.resize.min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/colorpicker-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.tipsy-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/Sourcerer-1.2-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.placeholder-min.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.smartWizard-2.0.js">
        </script>
        <script type="text/javascript" src="./Dashboard/jquery.validate-min.js">
        </script>
        <!-- Core Script -->
        <script type="text/javascript" src="./Dashboard/mws.js">
        </script>
        <!-- Themer Script (Remove if not needed) -->
        <script type="text/javascript" src="./Dashboard/themer.js">
        </script>
        <!-- Demo Scripts (remove if not needed) -->
        <script type="text/javascript" src="./Dashboard/demo.js">
        </script>
        <script type="text/javascript" src="./Dashboard/demo.dashboard.js">
        </script>
        <title>酒店管理</title>
       
    </head>
    <body>
        <!-- Themer (Remove if not needed) -->
        <div id="mws-header" class="clearfix">
            <!-- Logo Container -->
            <div id="mws-logo-container">
                <!-- Logo Wrapper, images put within this wrapper will always be vertically centered -->
                <div id="mws-logo-wrap">
                    <img src="./Dashboard/mws-logo.png" alt="mws admin">
                </div>
            </div><!-- User Tools (notifications, logout, profile, change password) -->
            <div id="mws-user-tools" class="clearfix">
                <!-- Notifications -->
                <div id="mws-user-notif" class="mws-dropdown-menu">
                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#" class="mws-i-24 i-alert-2 mws-dropdown-trigger">Notifications</a>
                    <!-- Unread notification count --><span class="mws-dropdown-notif">35</span>
                    <!-- Notifications dropdown -->
                    <div class="mws-dropdown-box">
                        <div class="mws-dropdown-content">
                            <ul class="mws-notifications">
                                <li class="read">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="message">Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore</span><span class="time">January 21, 2012</span></a>
                                </li>
                                <li class="read">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="message">Lorem ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
                                </li>
                                <li class="unread">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="message">Lorem ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
                                </li>
                                <li class="unread">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="message">Lorem ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
                                </li>
                            </ul>
                            <div class="mws-dropdown-viewall">
                                <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">View All Notifications</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Messages -->
                <div id="mws-user-message" class="mws-dropdown-menu">
                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#" class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
                    <!-- Unred messages count --><span class="mws-dropdown-notif">35</span>
                    <!-- Messages dropdown -->
                    <div class="mws-dropdown-box">
                        <div class="mws-dropdown-content">
                            <ul class="mws-messages">
                                <li class="read">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="sender">John Doe</span><span class="message">Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore</span><span class="time">January 21, 2012</span></a>
                                </li>
                                <li class="read">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="sender">John Doe</span><span class="message">Lorem ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
                                </li>
                                <li class="unread">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="sender">John Doe</span><span class="message">Lorem ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
                                </li>
                                <li class="unread">
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#"><span class="sender">John Doe</span><span class="message">Lorem ipsum dolor sit amet</span><span class="time">January 21, 2012</span></a>
                                </li>
                            </ul>
                            <div class="mws-dropdown-viewall">
                                <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">View All Messages</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- User Information and functions section -->
                <div id="mws-user-info" class="mws-inset">
                    <!-- User Photo -->
                    <div id="mws-user-photo">
                        <img src="./Dashboard/profile.jpg" alt="User Photo">
                    </div><!-- Username and Functions -->
                    <div id="mws-user-functions">
                        <div id="mws-username">
                        hello~ 酒店管理员
                        </div>
                        <ul>
                            <li>
                                <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">信息</a>
                            </li>
                            <li>
                                <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#">修改密码</a>
                            </li>
                            <li>
                                <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/index.html">登出</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Start Main Wrapper -->
        <div id="mws-wrapper">
            <!-- Necessary markup, do not remove -->
            <div id="mws-sidebar-stitch">
            </div>
            <div id="mws-sidebar-bg">
            </div>
            <!-- Sidebar Wrapper -->
            <div id="mws-sidebar">
                <!-- Searchbox -->
                <div id="mws-searchbox" class="mws-inset">
                    <form action="http://www.malijuthemeshop.com/themes/mws-admin/1.4/typography.html">
                        <input type="text" class="mws-search-input"><input type="submit" class="mws-search-submit">
                    </form>
                </div><!-- Main Navigation -->
                <div id="mws-navigation">
                    <ul>
                        <li class="active">
                            <a href="./Dashboard/MWS Admin - Dashboard.html" class="mws-i-24 i-home">优惠推送</a>
                        </li>
                       
                        <li>
                            <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/table.html" class="mws-i-24 i-table-1">活动管理</a>
                        </li>
                        <li>
                            <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/dashboard.html#" class="mws-i-24 i-list">流量分析</a>
                            <ul>
                                <li>
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/form_layouts.html">营销计划</a>
                                </li>
                                <li>
                                    <a href="http://www.malijuthemeshop.com/themes/mws-admin/1.4/form_elements.html">联系我们</a>
                                </li>
                            </ul>
                        </li>
                      
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
                                <tbody>
                                    <tr class="gradeX even">
                                        <td>
                                            Trident
                                        </td>
                                        <td>
                                            Internet
                                            Explorer 4.0
                                        </td>
                                        <td>
                                            Win 95+
                                        </td>
                                        <td class="center">
                                            4
                                        </td>
                                        <td class="center">
                                            X
                                        </td>
                                    </tr>
                                    <tr class="gradeC odd">
                                        <td>
                                            Trident
                                        </td>
                                        <td>
                                            Internet
                                            Explorer 5.0
                                        </td>
                                        <td>
                                            Win 95+
                                        </td>
                                        <td class="center">
                                            5
                                        </td>
                                        <td class="center">
                                            C
                                        </td>
                                    </tr>
                                    <tr class="gradeA even">
                                        <td>
                                            Trident
                                        </td>
                                        <td>
                                            Internet
                                            Explorer 5.5
                                        </td>
                                        <td>
                                            Win 95+
                                        </td>
                                        <td class="center">
                                            5.5
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA odd">
                                        <td>
                                            Trident
                                        </td>
                                        <td>
                                            Internet
                                            Explorer 6
                                        </td>
                                        <td>
                                            Win 98+
                                        </td>
                                        <td class="center">
                                            6
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA even">
                                        <td>
                                            Trident
                                        </td>
                                        <td>
                                            Internet Explorer 7
                                        </td>
                                        <td>
                                            Win XP SP2+
                                        </td>
                                        <td class="center">
                                            7
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA odd">
                                        <td>
                                            Trident
                                        </td>
                                        <td>
                                            AOL browser (AOL desktop)
                                        </td>
                                        <td>
                                            Win XP
                                        </td>
                                        <td class="center">
                                            6
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA even">
                                        <td>
                                            Gecko
                                        </td>
                                        <td>
                                            Firefox 1.0
                                        </td>
                                        <td>
                                            Win 98+ / OSX.2+
                                        </td>
                                        <td class="center">
                                            1.7
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA odd">
                                        <td>
                                            Gecko
                                        </td>
                                        <td>
                                            Firefox 1.5
                                        </td>
                                        <td>
                                            Win 98+ / OSX.2+
                                        </td>
                                        <td class="center">
                                            1.8
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA even">
                                        <td>
                                            Gecko
                                        </td>
                                        <td>
                                            Camino 1.5
                                        </td>
                                        <td>
                                            OSX.3+
                                        </td>
                                        <td class="center">
                                            1.8
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                    <tr class="gradeA odd">
                                        <td>
                                            Gecko
                                        </td>
                                        <td>
                                            Netscape 7.2
                                        </td>
                                        <td>
                                            Win 95+ / Mac OS 8.6-9.2
                                        </td>
                                        <td class="center">
                                            1.7
                                        </td>
                                        <td class="center">
                                            A
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="mws-footer">
                      行客生活 thinker lift 版权所有
                </div>
            </div>
            <!-- Main Container End -->
        </div>
    
         
        
        </div>
    </body>
</html>
