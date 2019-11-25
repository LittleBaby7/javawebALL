package Servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.CourseBean;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userID = (String) (session.getAttribute("userid"));
		if (userID == null || userID.equals("")) {
			response.sendRedirect("../index.jsp");
		}
		String courseid=request.getParameter("courseid");
		String cname=request.getParameter("cname");
		String credit=request.getParameter("ccredit");
		Float ccredit=Float.valueOf(credit);
		String cpre=request.getParameter("cpre");
		CourseBean course=new CourseBean(courseid,cname,ccredit,cpre);
		Map<String, String> errors=course.checkCourse();
		if(errors.size()==0) {
			course.addCourse();
			response.sendRedirect("Course/MagCourse.jsp");
		}else {
			request.setAttribute("errors", errors);
			request.setAttribute("newcourse", course);
			request.getRequestDispatcher("Course/AddCourse.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
