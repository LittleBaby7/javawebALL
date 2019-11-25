<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="jdbc.UserBpo"%>
<%@page import="pojo.UserBean"%>


<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="pojo.UserBean" />
<jsp:setProperty name="user" property="*" />
<%
	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("../index.jsp");
	}
	String checkPassword=request.getParameter("checkpassword");
	System.out.println(checkPassword);
	System.out.println(user.getPassword());
	if (UserBpo.getUser(user.getUserid()) != null)
		throw new Exception("已有此账号，账号不能重复，请重新输入账号");
	if (user.getUserName().equals(""))
		throw new Exception("用户名不允许为空，请重新输入！");
	if(!(user.getPassword().equals(checkPassword)))
		throw new Exception("两次密码输入不同，请重新输入");
	//if(teacher.getTname().equals("")) throw new Exception("姓名不允许为空，请重新输入！");
	//	if(!password.equals(confirmpassword)) throw new Exception("输入的密码和确认密码不一致，请重新输入！");
	UserBpo.addUser(user);
	response.sendRedirect("MagUser.jsp");
%>
