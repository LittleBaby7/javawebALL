<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="java.util.List" %>
<%@ page import="jdbc.StudentCRUD" %>
<%@ page import="pojo.Student" %>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String userID=(String)(session.getAttribute("userid")); 
	if(userID==null || userID.equals("")){
		response.sendRedirect("/index.jsp");
	}

String StuID=request.getParameter("stuid");
	if(StuID==null || StuID.equals("")){
		response.sendRedirect("MagStu.jsp");
	}
Student stu=StudentCRUD.get(StuID);
	if(stu==null)
		response.sendRedirect("MagStu.jsp");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>修改学生信息</title>
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
			<form action="UpdateStu_do.jsp?stuid=<%=StuID%> " method="post">
				<table class="mtable3" align=center>
					<caption>修改学生基本信息</caption>
					<tr><td>学号：</td>
						<td><%=StuID%></td></tr>
					<tr><td>姓名:</td>
						<td><input type="text" name="sname" value="<%=stu.getSname()%>"/></td></tr>
					<tr><td>性别</td>
						<td><input type="text" name="sex" value="<%=stu.getSex()%>"/></td></tr>
					<tr><td>年龄</td>
						<td><input type="text" name="age" value="<%=stu.getAge()%>"/></td></tr>
					<tr><td>班级</td>
						<td><input type="text" name="classname" value="<%=stu.getClassName()%>"/></td></tr>
					<tr><td>出生日期</td>
						<td><input type="text" name="birthday" value="<%=stu.getBirthDay()%>"/></td></tr>
					<tr><td><input type="submit" value="保存"/></td></tr>
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