<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.TeacherBean"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("../index.jsp");
	}
%>
<%
	Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
	String ciderr = "", cnameerr = "";
	if (errors != null) {
		ciderr = errors.get("courseid");
		if (ciderr == null)
			ciderr = "";
		cnameerr = errors.get("cname");
		if (cnameerr == null)
			cnameerr = "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加课程信息</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css" />
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
 		<jsp:useBean id="newcourse" class="pojo.CourseBean" scope="request"/>
		<jsp:setProperty name="newcourse" property="*" /> 
		<div class="content">
			<form action="<%=request.getContextPath() %>/AddCourseServlet" method="post">
				<table class="mtable3" align=center>
					<caption>增加课程基本信息</caption>
					<tr>
						<td>课程号：</td>
						<td><input type="text" name="courseid" value="<%=newcourse.getCourseid() %>" /><%=ciderr%></td>
					</tr>
					<tr>
						<td>课程名:</td>
						<td><input type="text" name="cname" value="<%=newcourse.getCname()%>" /> <%=cnameerr%></td>
					</tr>
					<tr>
						<td>学分:</td>
						<td><input type="text" name="ccredit" value="<%=newcourse.getCcredit()%>" /></td>
					</tr>
					<tr>
						<td>先修课号</td>
						<td><input type="text" name="cpre" value="<%=newcourse.getCpre() %>" /></td>
					</tr>
					<tr>
						<td><input type="reset" value="重置" /><input type="submit"
							value="提交" /></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>

</body>
</html>