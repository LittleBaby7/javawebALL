<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="error.jsp"%>
<%@page import="jdbc.UserBpo"%>
<%@page import="java.util.HashSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<%-- <%
	String userid=request.getParameter("userid");
    String password=request.getParameter("password");
    boolean successflag=UserBpo.validlogin(userid, password);
    if(successflag==true){
    	
    	HashSet sessions=(HashSet)application.getAttribute("sessions");
   	 	if (sessions == null) {
            sessions = new HashSet();
            application.setAttribute("sessions", sessions);
      	}
    	sessions.add(session);
    	
    	session.setAttribute("userid", userid);
    	response.sendRedirect("LoginSuccess.jsp");
    }else{
    	throw new Exception(userid+":账号或密码不正确，登陆失败！");
    }
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>校验登陆是否成功</title>
</head>
<body>
	<jsp:useBean id="user" class="pojo.UserBean" />
	<jsp:setProperty name="user" property="userid" />
	<jsp:setProperty name="user" property="password" />
	<jsp:setProperty name="user" property="usertype" />
	<c:set var="successflag"
		value="${UserBpo.validlogin(user.userid,user.password)}" />
	<c:choose>
		<c:when test="${successflag and UserBpo.getUser(user.userid).getUsertype() eq user.usertype}">
			<c:choose>
				<c:when test="${UserBpo.getUser(user.userid).getUsertype() eq '1'}">
					<c:set var="user" value="${user}" scope="session" />
					<c:redirect url="LoginSuccess.jsp" />
				</c:when>
				<c:when test="${UserBpo.getUser(user.userid).getUsertype() eq '2'}">
					<c:set var="user" value="${user}" scope="session" />
					<c:redirect url="StudentSC/StudentMag.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:forward page="index.jsp">
						<jsp:param name="error" value="用户名或密码不正确，请重新输入！" />
					</jsp:forward>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<jsp:forward page="index.jsp">
				<jsp:param name="error" value="用户名或密码不正确，请重新输入！" />
			</jsp:forward>
		</c:otherwise>
	</c:choose>
</body>
</html>