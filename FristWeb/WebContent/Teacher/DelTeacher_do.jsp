<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="pojo.TeacherBean" %>
<jsp:useBean id="teacher" class="pojo.TeacherBean"/>
<jsp:setProperty name="teacher" property="tno"/>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String userID=(String)(session.getAttribute("userid")); 
	if(userID==null || userID.equals("")){
		response.sendRedirect("../index.jsp");
	}
	teacher.deleteByTno();
	response.sendRedirect("MagTeacher.jsp");
%>
