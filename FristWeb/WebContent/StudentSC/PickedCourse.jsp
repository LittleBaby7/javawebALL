<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="pojo.Student"%>
<%@ page import="jdbc.StudentCRUD"%>
<%@ page import="pojo.CourseBean"%>
<%@ page import="jdbc.CourseBpo"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<c:if test="${sessionScope.user==null}">
	<jsp:forward page="index.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>已选课程信息</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head>
<body>
	<div id="wrapper">
		<!-- header -->
		<div class="header">
			<jsp:include page="../header.jsp" flush="true" />
		</div>
		<!-- menu -->
		<div class="menu">
			<jsp:include page="menu.jsp" />
		</div>
		<!-- content -->
		<div class="content">
			<table class="mtable2">
				<caption>已选课程信息</caption>
				<tr>
					<th>课程号</th>
					<th>课程名</th>
					<th>学分</th>
					<th>先修课程号</th>
				</tr>
				<c:forEach var="courseid"
					items="${StudentCRUD.getScCourse(user.userid) }">
					<tr>
						<td>${courseid}</td>
						<td>${CourseBean.getByCid(courseid).getCname()}</td>
						<td>${CourseBean.getByCid(courseid).getCcredit()}</td>
						<td>${CourseBean.getByCid(courseid).getCpre()}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>
</html>