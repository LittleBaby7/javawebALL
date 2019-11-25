package Servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.CourseBpo;
import pojo.CourseBean;

@WebServlet("/PickCourseServlet")
public class PickCourseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Map<String, String> errors = new HashMap<String, String>();
		String courseid = request.getParameter("courseid");
		String stuid = request.getParameter("stuid");
		if (CourseBpo.isPicked(stuid, courseid)) {
			errors.put("picking", "你已选过"+CourseBean.getByCid(courseid).getCname()+"课程，不能重复选课");
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/StudentSC/PickingCourse.jsp").forward(request, response);
		} else {
			CourseBpo.chooseCourse(stuid, courseid);
			request.getRequestDispatcher("/StudentSC/PickingCourse.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
