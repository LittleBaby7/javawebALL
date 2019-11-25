package Servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.CourseBean;

@WebServlet("/UpdateCourseServlet")
public class UpdateCourseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String courseid = request.getParameter("courseid");
		String cname = request.getParameter("cname");
		String credit = request.getParameter("ccredit");
		Float ccredit = Float.valueOf(credit);
		String cpre = request.getParameter("cpre");
		CourseBean course = new CourseBean(courseid, cname, ccredit, cpre);
		CourseBean.deleteByCid(courseid);
		Map<String, String> errors = course.checkCourse();
		if (errors.get("cname") == null || errors.get("cname").equals("")) {
			// CourseBean.update(course);
			course.addCourse();
			response.sendRedirect("Course/MagCourse.jsp");
		} else {
			request.setAttribute("errors", errors);
			request.setAttribute("updatecourse", course);
			request.getRequestDispatcher("Course/UpdateCourse.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
