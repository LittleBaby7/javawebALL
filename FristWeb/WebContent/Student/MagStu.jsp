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
		<title>学生管理</title>
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
			<% 
			  List<Student> students=StudentCRUD.getAllStudent();
			%>
			<table class="mtable2">
				<caption>学生列表</caption>
				<tr><th>学号</th><th>姓名</th><th>性别</th><th>年龄</th><th>班级</th><th>出生日期</th><th>操作</th></tr>
				<%
					for(int i=0;i<students.size();i++){
						Student student=students.get(i);%>
						<tr>
							<td><%=student.getStuID()%></td>
						    <td><%=student.getSname()%></td>
						    <td><%=student.getSex()%></td>
						    <td><%=student.getAge()%></td>
						    <td><%=student.getClassName()%></td>
						    <td><%=student.getBirthDay()%></td>
						    <td><a href="UpdateStu.jsp?stuid=<%=student.getStuID()%> ">修改</a>
						   	 &nbsp;&nbsp;&nbsp;&nbsp;
						    	<a href="DelStu_do.jsp?stuid=<%=student.getStuID()%>"  >删除</a></td>
						</tr>
					<%}
				%>
			</table>
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true"/>
		</div>
	  </div>
		
	</body>
</html>