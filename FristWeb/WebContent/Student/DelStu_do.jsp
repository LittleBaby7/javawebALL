<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="java.util.List" %>
<%@ page import="jdbc.StudentCRUD" %>
<%@ page import="pojo.Student" %>
<%@ page import="util.Date_String" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String userID=(String)(session.getAttribute("userid")); 
	if(userID==null || userID.equals("")){
		response.sendRedirect("../index.jsp");
	}
	String stuID=request.getParameter("stuid");
	StudentCRUD.delete(stuID);
	response.sendRedirect("MagStu.jsp");
%>
