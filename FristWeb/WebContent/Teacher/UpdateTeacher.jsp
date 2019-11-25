<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.TeacherBean"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("/index.jsp");
	}
	String tno = request.getParameter("tno");
	if (tno == null || tno.equals("")) {
		response.sendRedirect("MagTeacher.jsp");
	}
	TeacherBean updateteacher=(TeacherBean)request.getAttribute("updateteacher");
	if(updateteacher==null)
		updateteacher=TeacherBean.getByTno(tno);
	Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
	String tnoerr = "", tnameerr = "";
	if (errors != null) {
		tnameerr = errors.get("tname");
		if (tnameerr == null)
			tnameerr = "";
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改教师信息</title>
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
			<form action="UpdateTeacher_do.jsp?tno=<%=updateteacher.getTno()%> "
				method="post">
				<table class="mtable3" align=center>
					<caption>修改教师基本信息</caption>
					<tr>
						<td>职工号：</td>
						<td><%=updateteacher.getTno()%></td>
					</tr>
					<tr>
						<td>姓名:</td>
						<td><input type="text" name="tname"
							value="<%=updateteacher.getTname()%>" /><%=tnameerr %></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><input type="text" name="sex"
							value="<%=updateteacher.getSex()%>" /></td>
					</tr>
					<tr>
						<td>所属教研室</td>
						<td><select name="tdept">
								<option value="软件工程教研室">软件工程教研室</option>
								<option value="计科教研室">计科教研室</option>
								<option value="网络教研室">网络教研室</option>
								<option value="基础教研室">基础教研室</option></td>
					</tr>
					<tr>
						<td>职称</td>
						<td><select name="tpost">
								<option value="助教">助教</option>
								<option value="讲师">讲师</option>
								<option value="副教授">副教授</option>
								<option value="教授">教授</option></td>
					</tr>
					<tr>
						<td>研究方向</td>
						<td><input type="text" name="tdirect"
							value="<%=updateteacher.getTdirect()%>" /></td>
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