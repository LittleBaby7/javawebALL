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
	String StuID=request.getParameter("stuid");
	String Sname=request.getParameter("sname");
	String Sex=request.getParameter("sex");
	String Age=request.getParameter("age");
	String Classname=request.getParameter("classname");
	String Birthday=request.getParameter("birthday");
	if(StudentCRUD.get(StuID)!=null) throw new Exception("已有此学号，学号不能重复，请重新输入学号");
	if(StuID.equals("")) throw new Exception("学号不允许为空，请重新输入！");
	if(Sname.equals("")) throw new Exception("姓名不允许为空，请重新输入！");
//	if(!password.equals(confirmpassword)) throw new Exception("输入的密码和确认密码不一致，请重新输入！");
	Student stu=new Student(StuID,Sname,Sex,Integer.valueOf(Age),Classname,Birthday);
	StudentCRUD.addStudent(stu);
	response.sendRedirect("MagStu.jsp");
%>
