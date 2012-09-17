<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script>
            function check(){
                var uname = document.getElementById("uname").value;
                var upwd = document.getElementById("upwd").value;
                if (uname.trim() == "") {
                    alert("用户名不能为空");
                    return;
                }
                if (upwd.trim() == "") {
                    alert("密码不能空");
                    return;
                }
                document.getElementById("mf").submit();
                
            }
            
            
            
        </script>
</head>
<body>
 <jsp:useBean     id="userBean"  class="com.model.UserBean" scope="session"/>
<form  action="ManageServlet"  method="post"   id="mf"  target="mainFrame">
<table  class="logintable">
	<tr>
		<td>用户名</td>
		<td>
			<input  type="text"  id="uname"  name="id"  value="zrk">
		</td>
	</tr>
	<tr>
		<td>
		密&nbsp;码
		</td>
		<td>
			<input  type="text"  id="upwd"  name="pd" value="123">
		</td>
		<tr>
			<td  colspan="2"  align="center">
					<input  type="button"  value="登入"  onclick="javasScript:check()">
					<input  type="button" value="重置"  onclick="javaScript:document.all.mf.reset()">
					<input  type="hidden" name="action"   value="login">
			</td>
	
	
	</tr>
	



</table>



</form>

</body>
</html>