<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.TeacherBean"%>
<%@ page import="jdbc.TeacherBpo"%>

<%
	TeacherBean teacher = new TeacherBean();
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String tname = request.getParameter("tname");
	String tdept = request.getParameter("tdept");
	teacher.setTname(tname);
	teacher.setTdept(tdept);
	Map<String, String> errors = teacher.checkTeacher();
	System.out.println(tname);
	System.out.println(tdept);
	System.out.println(teacher.getTname());
	if (tname.equals("") && tdept.equals("")) {
		List<TeacherBean> teachers=TeacherBean.getAllTeacher();
		request.setAttribute("teachers", teachers);
		response.sendRedirect(request.getContextPath()+"/Teacher/MagTeacher.jsp");
	} 
	if(tname.equals("")&&!tdept.equals("")) {
		List<TeacherBean> teachers=TeacherBpo.getTeachersByDept(tdept);
		request.setAttribute("teachers", teachers);
		response.sendRedirect(request.getContextPath()+"/Teacher/MagTeacher.jsp");}
	if(!tname.equals("")&&tdept.equals("")){
		List<TeacherBean> teachers=TeacherBpo.getTeachersByName(tname);
		request.setAttribute("teachers", teachers);
		response.sendRedirect(request.getContextPath()+"/Teacher/MagTeacher.jsp");
	}
	if(!tname.equals("")&&!tdept.equals("")){
		List<TeacherBean> teachers = TeacherBpo.getTeachers(tname, tdept);
		request.setAttribute("teachers", teachers);
		response.sendRedirect(request.getContextPath()+"/Teacher/MagTeacher.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>根据姓名与教研室查询教师信息</title>
</head>
<body>

</body>
</html>