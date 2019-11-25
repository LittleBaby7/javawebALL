<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="java.util.List" %>
<%@ page import="jdbc.StudentCRUD" %>
<%@ page import="pojo.Student" %>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String userID=(String)(session.getAttribute("userid")); 
if(userID==null || userID.equals("")){
	response.sendRedirect("../index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>增加学生信息</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
	</head>
	<body>
	  <div id="wrapper">
	 	<!-- header -->
	   <div class="header">
			<jsp:include page="../header.jsp" flush="true"/>
	    </div>
		<!-- menu -->
		<div class="menu">
			<jsp:include page="menu.jsp"/>
		</div>
		<!-- content -->
		<div class="content">
			<form action="AddStu_do.jsp" method="post">
				<table class="mtable3" align=center>
					<caption>增加学生基本信息</caption>
					<tr><td>学号：</td><td><input type="text" name="stuid"/></td></tr>
					<tr><td>姓名:</td><td><input type="text" name="sname"/></td></tr>
					<tr><td>性别:</td><td><input type="text" name="sex"/></td></tr>
					<tr><td>年龄:</td><td><input type="text" name="age"/></td></tr>
					<tr><td>班级</td><td><input type="text" name="classname"/></td></tr>
					<tr><td>出生日期</td><td><input type="text" name="birthday"/></td></tr>
					<tr><td><input type="reset" value="重置"/><input type="submit" value="提交"/></td></tr>
				</table>
			</form>
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true"/>
		</div>
	  </div>
		
	</body>
</html>