<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="jdbc.UserBpo"%>
<%@ page import="pojo.UserBean"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("/index.jsp");
	}
	String userid=request.getParameter("userid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
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
			<form action="UpdateUser_do.jsp?userid=<%=userid%> " method="post">
				<table class="mtable3" align=center>
					<caption>修改用户信息</caption>
					<tr>
						<td>账号：</td>
						<td><%=userid%></td>
					</tr>
					<tr>
						<td>请输入原密码:</td>
						<td><input type="password" name="oldpassword" "/></td>
					</tr>
					<tr>
						<td>请输入新密码</td>
						<td><input type="password" name="newpassword" "/></td>
					</tr>
					<tr>
						<td>请确认密码</td>
						<td><input type="password" name="checkpassword" "/></td>
					</tr>
					<tr>
						<td>用户名</td>
						<td><input type="text" name="username" "/></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td><input type="text" name="phonenumber" "/></td>
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