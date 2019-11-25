package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.CourseBpo;
import jdbc.TeacherBpo;
import pojo.CourseBean;
import pojo.TeacherBean;

@WebServlet("/GetCoursesServlet")
public class GetCoursesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TeacherBean teacher = new TeacherBean();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Map<String, String> errors = new HashMap<String, String>();
		String cname = request.getParameter("cname");
		String cid = request.getParameter("courseid");
		System.out.println(cname);
		System.out.println(cid);
		List<CourseBean> courses = null;
		if (cname.equals("") && cid.equals("")) {
			courses = CourseBean.getAllCourse();
			request.setAttribute("getcourses", courses);
			request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
		}
		if (cname.equals("") && !cid.equals("")) {
			if (CourseBean.getByCid(cid) == null) {
				errors.put("courseid", "此课程号不存在");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
			}
			courses = new ArrayList<CourseBean>();
			courses.add(CourseBean.getByCid(cid));
			request.setAttribute("getcourses", courses);
			request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
		}
		if (!cname.equals("") && cid.equals("")) {
			if (CourseBpo.getByCname(cname) == null) {
				errors.put("cname", "此课程名不存在");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
			}
			courses = new ArrayList<CourseBean>();
			courses.add(CourseBpo.getByCname(cname));
			request.setAttribute("getcourses", courses);
			request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
		}
		if (!cname.equals("") && !cid.equals("")) {
			if (CourseBean.getByCid(cid) == null&&CourseBpo.getByCname(cname) == null) {
				errors.put("courseid", "此课程号不存在");
				errors.put("cname", "此课程名不存在");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
			}
			if (CourseBean.getByCid(cid) == null&&CourseBpo.getByCname(cname) != null) {
				errors.put("courseid", "此课程号不存在");
				request.setAttribute("errors", errors);
				courses = new ArrayList<CourseBean>();
				courses.add(CourseBpo.getByCname(cname));
				request.setAttribute("getcourses", courses);
				request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
			} if (CourseBean.getByCid(cid) != null&&CourseBpo.getByCname(cname) == null) {
				errors.put("cname", "此课程名不存在");
				request.setAttribute("errors", errors);
				courses = new ArrayList<CourseBean>();
				courses.add(CourseBean.getByCid(cid));
				request.setAttribute("getcourses", courses);
				request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
			}

			try {
				courses = CourseBpo.getCoursesByInfo(cname, cid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("getcourses", courses);
			request.getRequestDispatcher("/Course/GetCourse.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
