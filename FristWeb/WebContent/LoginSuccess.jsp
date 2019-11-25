<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%
	String userid=(String)(session.getAttribute("userid")); 
	if(userid==null || userid.equals("")){
		response.sendRedirect("index.jsp");
	}
%> --%>
<c:if test="${sessionScope.user==null}">
	<jsp:forward page="index.jsp"/>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>登陆成功</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	</head>
	<body>
	  <div id="wrapper">
	 	<!-- header -->
	   <div class="header">
			<jsp:include page="header.jsp" flush="true"/>
	    </div>
		<!-- menu -->
		<div class="menu">
			<ul>
				<li><a href="User/MagUser.jsp">用户管理</a></li>
				<li><a href="Student/MagStu.jsp">学生管理</a></li>
				<li><a href="Teacher/MagTeacher.jsp">教师管理</a></li>
				<li><a href="Course/MagCourse.jsp">课程管理</a></li>
			</ul>
		</div>
		<!-- content -->
		<div class="content">
			
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="footer.jsp" flush="true"/>
		</div>
	  </div>
		
	</body>
</html>