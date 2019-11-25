package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.TeacherBpo;
import pojo.TeacherBean;

@WebServlet("/GetTeachersServlet")
public class GetTeachersServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		List<TeacherBean> teachers = null;
		if (tname.equals("") && tdept.equals("")) {
			teachers = TeacherBean.getAllTeacher();
			request.setAttribute("teachers", teachers);
			request.getRequestDispatcher("/Teacher/MagTeacher.jsp").forward(request, response);
			// response.sendRedirect(request.getContextPath()+"/Teacher/MagTeacher.jsp");
		}
		if (tname.equals("") && !tdept.equals("")) {
			try {
				teachers = TeacherBpo.getTeachersByDept(tdept);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("teachers", teachers);
			request.getRequestDispatcher("/Teacher/MagTeacher.jsp").forward(request, response);
		}
		if (!tname.equals("") && tdept.equals("")) {
			try {
				teachers = TeacherBpo.getTeachersByName(tname);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("teachers", teachers);
			request.getRequestDispatcher("/Teacher/MagTeacher.jsp").forward(request, response);
		}
		if (!tname.equals("") && !tdept.equals("")) {
			try {
				teachers = TeacherBpo.getTeachers(tname, tdept);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("teachers", teachers);
			request.getRequestDispatcher("/Teacher/MagTeacher.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
