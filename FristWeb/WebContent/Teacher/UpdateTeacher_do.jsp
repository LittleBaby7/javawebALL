<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="../error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="pojo.TeacherBean"%>

<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="updateteacher" class="pojo.TeacherBean"/>
<jsp:setProperty name="updateteacher" property="*" />
<%
	String userID = (String) (session.getAttribute("userid"));
	if (userID == null || userID.equals("")) {
		response.sendRedirect("/index.jsp");
	}
	Map<String, String> errors = updateteacher.checkTeacher();
	if (errors.get("tname") == null||errors.get("tname").equals("")) {
		TeacherBean.update(updateteacher);
	} else {
		request.setAttribute("errors", errors);
		request.setAttribute("updateteacher",updateteacher);
		request.getRequestDispatcher("UpdateTeacher.jsp").forward(request, response);
	}
%>
<jsp:forward page="MagTeacher.jsp" />