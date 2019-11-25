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
	<jsp:forward page="/index.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选课管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
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
			<form action="${pageContext.request.contextPath}/chooseCourseServlet"
				method="post">
				课程名：<input type="text" name="cname" value="${cname}" />&nbsp;&nbsp;<br />
				<br /> <input type="submit" value="查询" />
			</form>
			<table class="mtable2">
				<caption>课程列表</caption>
				<tr>
					<th>课程号</th>
					<th>课程名</th>
					<th>学分</th>
					<th>先修课程号</th>
					<th>当前选课人数</th>
					<th>操作</th>
				</tr>
				<c:forEach var="course"
					items="${courses}">
				<tr>
					<td>${course.courseid}</td>
					<td>${course.getCname()}</td>
					<td>${course.getCcredit()}</td>
					<td>${course.getCpre()}</td>
					<td>${CourseBpo.getNumber(course.getCourseid())}</td>
					<td><a
						href="${pageContext.request.contextPath}/PickCourseServlet?courseid=${course.getCourseid()}&stuid=${user.userid}"
						onclick="if(!confirm('确定要选择此课程吗？')) return false;">选课</a></td>
				</tr>
			</c:forEach>
			</table>
			${errors.get("picking")}
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>

</body>
</html>