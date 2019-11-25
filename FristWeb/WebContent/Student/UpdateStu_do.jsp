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
		response.sendRedirect("/index.jsp");
	}
	String StuID=request.getParameter("stuid");
	String Sname=request.getParameter("sname");
	String Sex=request.getParameter("sex");
	String Age=request.getParameter("age");
	String Classname=request.getParameter("classname");
	String Birthday=request.getParameter("birthday");
	Student stu=new Student(StuID,Sname,Sex,Integer.valueOf(Age),Classname,Birthday);
	StudentCRUD.update(stu);
	response.sendRedirect("MagStu.jsp");
%>
