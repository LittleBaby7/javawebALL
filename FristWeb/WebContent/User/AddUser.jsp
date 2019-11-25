<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="pojo.UserBean"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("../index.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加用户信息</title>
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
			<form action="AddUser_do.jsp" method="post">
				<table class="mtable3" align=center>
					<caption>增加用户基本信息</caption>
					<tr>
						<td>账号：</td>
						<td><input type="text" name="userid" /></td>
					</tr>
					<tr>
						<td>用户名:</td>
						<td><input type="text" name="userName" /></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input type="password" name="password" /></td>
					</tr>
					<tr>
						<td>确认密码:</td>
						<td><input type="password" name="checkpassword" /></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td><input type="text" name="phoneNumber" /></td>
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