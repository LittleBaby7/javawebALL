<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.TeacherBean"%>
<%@ page import="jdbc.TeacherBpo"%>

<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="teacher" class="pojo.TeacherBean"/>
<jsp:setProperty name="teacher" property="*" />
<%
	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("../index.jsp");
	}
    Map<String, String> errors=teacher.checkTeacher();
    if(errors.size()==0){
    	teacher.addTeacher();
    }else{
    	request.setAttribute("errors", errors);
    	request.getRequestDispatcher("AddTeacher.jsp").forward(request, response);
    }

	/* if (TeacherBean.getByTno(teacher.getTno()) != null)
		throw new Exception("已有此职工号，职工号不能重复，请重新输入职工号");
	if (teacher.getTno().equals(""))
		throw new Exception("职工号不允许为空，请重新输入！");
	if(teacher.getTname().equals("")) throw new Exception("姓名不允许为空，请重新输入！");
	//	if(!password.equals(confirmpassword)) throw new Exception("输入的密码和确认密码不一致，请重新输入！");
	teacher.addTeacher();
	response.sendRedirect("MagTeacher.jsp"); */
%>
<jsp:forward page="MagTeacher.jsp"/>