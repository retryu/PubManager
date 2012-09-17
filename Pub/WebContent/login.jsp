<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0052)http://www.malijuthemeshop.com/themes/mws-admin/1.4/ -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- Apple iOS and Android stuff (do not remove) -->
<meta name="apple-mobile-web-app-capable" content="no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1">

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/text.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css" media="screen">

<link rel="stylesheet" type="text/css" href="css/form.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/login.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/button.css" media="screen">

<link rel="stylesheet" type="text/css" href="css/mws.theme.css" media="screen">

<!-- JavaScript Plugins -->
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<!-- jQuery-UI Dependent Scripts -->
<script type="text/javascript" src="js/jquery-ui-effecs.min.js"></script>

<!-- Plugin Scripts -->
<script type="text/javascript" src="js/jquery.placeholder-min.js"></script>
<script type="text/javascript" src="js/jquery.validate-min.js"></script>

<!-- Login Script -->
<script type="text/javascript" src="js/login.js"></script>

<title>MWS Admin - Login Page</title>

</head>

<body>
 <jsp:useBean     id="userBean"  class="com.model.UserBean" scope="session"/>
    <div id="mws-login-wrapper">
        <div id="mws-login">
            <h1>登入</h1>
            <div class="mws-login-lock"><img src="img/locked-2.png" alt=""></div>
            <div id="mws-login-form">
                <form class="mws-form" action="ManageServlet"  method="post" novalidate="novalidate">
                    <div class="mws-form-row">
                        <div class="mws-form-item large">
                            <input type="text" name="username" class="mws-login-username mws-textinput required" placeholder="用户名">
                        </div>
                    </div>
                    <div class="mws-form-row">
                        <div class="mws-form-item large">
                            <input type="password" name="password" class="mws-login-password mws-textinput required" placeholder="密码">
                        </div>
                    </div>
                    <div class="mws-form-row mws-inset">
                        <ul class="mws-form-list inline">
                            <li><input type="checkbox"> <label>记住我</label></li>
                        </ul>
                    </div>
                    <div class="mws-form-row">
                        <input type="submit" value="提交" class="mws-button green mws-login-button">
								<input  type="hidden" name="action"   value="login">
                    </div>
                </form>
            </div>
        </div>
    </div>



</body></html>