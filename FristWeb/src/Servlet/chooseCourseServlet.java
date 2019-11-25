package Servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.CourseBpo;
import pojo.CourseBean;

@WebServlet("/chooseCourseServlet")
public class chooseCourseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<CourseBean> courses=null;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//Map<String, String> errors = new HashMap<String, String>();
		String cname = request.getParameter("cname");
		courses=CourseBpo.getBycname(cname);
		request.setAttribute("courses", courses);
		request.getRequestDispatcher("/StudentSC/PickingCourse.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
