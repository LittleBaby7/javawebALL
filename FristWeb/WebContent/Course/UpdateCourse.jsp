<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.CourseBean"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("/index.jsp");
	}
	String courseid = request.getParameter("courseid");
	if (courseid == null || courseid.equals("")) {
		response.sendRedirect("MagCourse.jsp");
	}
	CourseBean updatecourse = (CourseBean) request.getAttribute("updatecourse");
	if (updatecourse == null) {
		updatecourse = CourseBean.getByCid(courseid);
	}

	Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
	String cnameerr = "";
	if (errors != null) {
		cnameerr = errors.get("cname");
		if (cnameerr == null)
			cnameerr = "";
	}
	/* if(tnameerr!=null&&!tnameerr.equals(""))
		teacher.setTname(null); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改课程信息</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css" />
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
			<form
				action="<%=request.getContextPath()%>/UpdateCourseServlet?courseid=<%=updatecourse.getCourseid()%> "
				method="post">
				<table class="mtable3" align=center>
					<caption>修改课程基本信息</caption>
					<tr>
						<td>课程号：</td>
						<td><%=updatecourse.getCourseid()%></td>
					</tr>
					<tr>
						<td>课程名:</td>
						<td><input type="text" name="cname"
							value="<%=updatecourse.getCname()%>" /><%=cnameerr%></td>
					</tr>
					<tr>
						<td>学分</td>
						<td><input type="text" name="ccredit"
							value="<%=updatecourse.getCcredit()%>" /></td>
					</tr>
					<tr>
						<td>先修课程号</td>
						<td><input type="text" name="cpre"
							value="<%=updatecourse.getCpre()%>" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="保存" /></td>
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