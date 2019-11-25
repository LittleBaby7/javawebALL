<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="pojo.UserBean" %>
<%@ page import="jdbc.UserBpo" %>
<jsp:useBean id="user" class="pojo.UserBean"/>
<jsp:setProperty name="user" property="userid"/>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String userID=(String)(session.getAttribute("userid")); 
	if(userID==null || userID.equals("")){
		response.sendRedirect("../index.jsp");
	}
	
		UserBpo.delete(user.getUserid());
		response.sendRedirect("MagUser.jsp");
	
%>
