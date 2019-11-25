<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.HashSet"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆窗口</title>
</head>
<body>
  <form action="LoginValid.jsp" method="post">
  	<table border=0>
  		<tr>
  			<td>请选择用户类型：</td><td> <select name="usertype">
					<option value="1">教师</option>
					<option value="2">学生</option>
				</select></td>
  		</tr>
  		<tr>
  			<td>账号：</td><td><input name='userid' type='text' value=''/></td>
  		</tr>
  		<tr>
  			<td>密码：</td><td><input name='password' type='password' value=''/></td>
  		</tr>
  		<tr><td colspan=2 align=right>
  		${param.error}
  			<input type="reset" value="重置" class="btn">
  			<input type='submit' value='提交'/></td>
  		</tr>
  	</table>
  </form>
</body>
</html>