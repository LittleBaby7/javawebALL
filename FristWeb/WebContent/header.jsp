<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="pojo.UserBean"%>
<%@ page import="jdbc.UserBpo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="pojo.UserBean" scope="session" />
<%-- <%
/* 	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String userid = (String) session.getAttribute("userid");
	UserBean user0 = UserBpo.getUser(userid); */
	//System.out.println(user0.getUserName());
	/*String username=user.getUserName();
	System.out.println(username); */ 
	/* int count = 0;
	HashSet sessions = (HashSet) application.getAttribute("sessions");
	if (sessions != null) {
		count = sessions.size();
	} */
	/* String contextpath = request.getContextPath(); */
%> --%>
<c:set var="path" value="LoginSuccess.jsp" />
<c:if test="${UserBpo.getUser(user.userid).getUsertype() eq '2' }">
	<c:set var="path" value="StudentSC/StudentMag.jsp" />
</c:if>
<div align="center">侯海旺选课系统</div>
<div align="left">
	当前用户：${user.userid }&nbsp;&nbsp;&nbsp;&nbsp;当前时间：<%=(new java.util.Date()).toString()%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
		href="${pageContext.request.contextPath}/${path}">返回首页</a>&nbsp;&nbsp;<a
		href="${pageContext.request.contextPath}/exit.jsp">退出</a>
</div>



