<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="stylesheet" type="text/css" href="css/push.css"/>
</head>
<body>
	<form  method="post"  action="ManageServlet"  id="pushform"  enctype="multipart/form-data"  >
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