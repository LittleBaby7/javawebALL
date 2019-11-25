<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="../error.jsp"  %>
<%@ page import="java.util.List" %>
<%@ page import="jdbc.UserBpo" %>
<%@ page import="pojo.UserBean" %>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String userID=(String)(session.getAttribute("userid")); 
if(userID==null || userID.equals("")){
	response.sendRedirect("../index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
	</head>
	<body>
	  <div id="wrapper">
	 	<!-- header -->
	   <div class="header">
			<jsp:include page="../header.jsp" flush="true"/>
	    </div>
		<!-- menu -->
		<div class="menu">
			<jsp:include page="menu.jsp"/>
		</div>
		<!-- content -->
		<div class="content">
			<% 
			  List<UserBean> users=UserBpo.getAllUser();
			%>
			<table class="mtable2">
				<caption>用户信息</caption>
				<tr><th>账号</th><th>用户名</th><th>手机号码</th><th>操作</th>></tr>
				<%
					for(int i=0;i<users.size();i++){
						UserBean user=users.get(i);%>
						<tr>
							<td><%=user.getUserid()%></td>
							<td><%=user.getUserName()%></td>
							<td><%=user.getPhoneNumber()%></td>
							<td><a href="UpdateUser.jsp?userid=<%=user.getUserid()%> ">修改</a>
						   	 &nbsp;&nbsp;&nbsp;&nbsp;
						    	<a href="DelUser_do.jsp?userid=<%=user.getUserid()%>"  >删除</a></td>
						</tr>
					<%}
				%>
			</table>
		</div>
		<!-- footer -->
		<div class="footer">
			<jsp:include page="../footer.jsp" flush="true"/>
		</div>
	  </div>
		
	</body>
</html>