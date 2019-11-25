<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.TeacherBean"%>
<%
	Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
	String tdepterr = "", tnameerr = "";
	if (errors != null) {
		tdepterr = errors.get("tdept");
		if (tdepterr == null)
			tdepterr = "";
		tnameerr = errors.get("tname");
		if (tnameerr == null)
			tnameerr = "";
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("../index.jsp");
	}
	String tname = (String) request.getParameter("tname");
	if (tname == null)
		tname = "";

	String tdept = (String) request.getParameter("tdept");
	if (tdept == null)
		tdept = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教师管理</title>
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
			<%
				List<TeacherBean> teachers = (List<TeacherBean>) request.getAttribute("teachers");
			%>
			<form action="<%=request.getContextPath()%>/GetTeachersServlet"
				method="post">
				姓名：<input type="text" name="tname" value="<%=tname%>" /><%=tnameerr%>&nbsp;&nbsp;<br />
				教研室： <select name="tdept">
					<option value="">&nbsp;&nbsp;</option>
					<option value="软件工程教研室">软件工程教研室</option>
					<option value="计科教研室">计科教研室</option>
					<option value="网络教研室">网络教研室</option>
					<option value="基础教研室">基础教研室</option>
				</select> <br /> <input type="submit" value="查询" />
			</form>
			<table class="mtable2">
				<caption>教师列表</caption>
				<tr>
					<th>职工号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>所属教研室</th>
					<th>职称</th>
					<th>研究方向</th>
					<th>操作</th>
				</tr>
				<%
					if (teachers != null)
						for (int i = 0; i < teachers.size(); i++) {
							TeacherBean teacher = teachers.get(i);
				%>
				<tr>
					<td><%=teacher.getTno()%></td>
					<td><%=teacher.getTname()%></td>
					<td><%=teacher.getSex()%></td>
					<td><%=teacher.getTdept()%></td>
					<td><%=teacher.getTpost()%></td>
					<td><%=teacher.getTdirect()%></td>
					<td><a href="UpdateTeacher.jsp?tno=<%=teacher.getTno()%> ">修改</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="<%=request.getContextPath() %>/Teacher/DelTeacher_do.jsp?tno=<%=teacher.getTno()%>" onclick="
						if(!confirm('确定要删除吗？')) return false;">删除</a></td>
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