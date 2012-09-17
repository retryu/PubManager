<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/controlhead.css" />
  <script type='text/javascript' src='/PubManager/dwr/engine.js'></script>
  <script type='text/javascript' src='/PubManager/dwr/interface/Remote.js'></script>
     <script type='text/javascript' src='js/globals.js'></script>
   <script type='text/javascript' src='js/controlhead.js'></script>
    <script>
    dwr.engine.setActiveReverseAjax(true);
   function  test(){
	   alert("test");
	  Remote.getDate('42',{
		 callback:function(str){
			 alert(str);
		 } 
	  });
   }
    </script>
</head>
<body  onload="dwr.engine.setActiveReverseAjax(true);">	
<div class='message-notify'  id="mnotify">
<div  class="notifynum"  id="notifynum">33</div>
</div>

<div  class="notify-dropdown-box"  id="downbox">
	<div class="notify-dropdown-content">
	<a  href=""  class="notify-text">查看 1条未处理服务请求 </a></div>
</div>
<input  type="button" style="float:left" value="test" onclick="test()"></input>
	 
</body>
</html>