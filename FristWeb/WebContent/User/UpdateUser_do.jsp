<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="java.util.List" %>
<%@ page import="jdbc.UserBpo" %>
<%@ page import="pojo.UserBean" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String userID=(String)(session.getAttribute("userid")); 
	if(userID==null || userID.equals("")){
		response.sendRedirect("/index.jsp");
	}
	String userid=request.getParameter("userid");
	String username=request.getParameter("username");
	String phonenumber=request.getParameter("phonenumber");
	String oldPassword=request.getParameter("oldpassword");
	String password1=request.getParameter("newpassword");
	String password2=request.getParameter("checkpassword");
	//if(UserBpo.getUser(userid).getSign()<1) throw new Exception("你的权限不足，无法修改");
	if(oldPassword.equals("")) throw new Exception("原密码不能为空");
	if(!(UserBpo.validlogin(userid,oldPassword))) throw new Exception("原密码输入不正确，请重新输入！");
	if(password1.equals("")||password2.equals("")) throw new Exception("新密码和确认密码不能为空");
	if(!(password1.equals(password2))) throw new Exception("两次密码输入不同，请重新输入");
	if(username==null) throw new Exception("用户名不能为空，请重新输入");
	UserBean user=new UserBean(userid,password1,username,phonenumber);
	UserBpo.updateInfo(user);
	session.invalidate();
	response.sendRedirect("/Servlet30Project/index.jsp");
%>
