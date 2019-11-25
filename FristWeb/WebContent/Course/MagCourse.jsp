<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="pojo.CourseBean"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<c:if test="${sessionScope.user==null}">
	<jsp:forward page="index.jsp"/>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程管理</title>
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
			<%
				List<CourseBean> courses=CourseBean.getAllCourse();
			%>
			<table class="mtable2">
				<caption>课程列表</caption>
				<tr>
					<th>课程号</th>
					<th>课程名</th>
					<th>学分</th>
					<th>先修课程号</th>
					<th>操作</th>
				</tr>
				<%
						for (int i = 0; i < courses.size(); i++) {
							CourseBean course = courses.get(i);
				%>
				<tr>
					<td><%=course.getCourseid()%></td>
					<td><%=course.getCname()%></td>
					<td><%=course.getCcredit()%></td>
					<td><%=course.getCpre()%></td>
					<td><a href="UpdateCourse.jsp?courseid=<%=course.getCourseid()%> ">修改</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="<%=request.getContextPath() %>/DelCourseServlet?courseid=<%=course.getCourseid()%>" onclick="if(!confirm('确定要删除吗？')) return false;">删除</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>

</body>
</html>