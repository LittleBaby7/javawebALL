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
	String tnoerr = "", tnameerr = "";
	if (errors != null) {
		tnoerr = errors.get("tno");
		if (tnoerr == null)
			tnoerr = "";
		tnameerr = errors.get("tname");
		if (tnameerr == null)
			tnameerr = "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加教师信息</title>
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
		<jsp:useBean id="newteacher" class="pojo.TeacherBean" scope="request"/>
		<jsp:setProperty name="newteacher" property="*" />
		<div class="content">
			<form action="AddTeacher_do.jsp" method="post">
				<table class="mtable3" align=center>
					<caption>增加教师基本信息</caption>
					<tr>
						<td>职工号：</td>
						<td><input type="text" name="tno" value="<%=newteacher.getTno() %>" /><%=tnoerr%></td>
					</tr>
					<tr>
						<td>职工名:</td>
						<td><input type="text" name="tname" value="<%=newteacher.getTname()%>" /> <%=tnameerr%></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><input type="text" name="sex" value="<%=newteacher.getSex()%>" /></td>
					</tr>
					<tr>
						<td>所属教研室:</td>
						<td><select name="tdept">
								<option value="软件工程教研室">软件工程教研室</option>
								<option value="计科教研室">计科教研室</option>
								<option value="网络教研室">网络教研室</option>
								<option value="基础教研室">基础教研室</option></select></td>
					</tr>
					<tr>
						<td>职称</td>
						<td><select name="tpost">
								<option value="助教">助教</option>
								<option value="讲师">讲师</option>
								<option value="副教授">副教授</option>
								<option value="教授">教授</option></select>></td>
					</tr>
					<tr>
						<td>研究方向</td>
						<td><input type="text" name="tdirect" value="<%=newteacher.getTdirect() %>" /></td>
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