<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="pojo.Student"%>
<%@ page import="jdbc.StudentCRUD"%>
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
<title>个人信息</title>
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
		学号:${StudentCRUD.get(user.userid).getStuID()}<br />
		 姓名:${StudentCRUD.get(user.userid).getSname()}<br />
		性别:${StudentCRUD.get(user.userid).getSex()}<br /> 
		年龄:${StudentCRUD.get(user.userid).getAge()}<br />
		班级:${StudentCRUD.get(user.userid).getClassName()}<br /> 
		出生日期:${StudentCRUD.get(user.userid).getBirthDay()}<br />
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentMag.jsp">返回</a>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>
</html>