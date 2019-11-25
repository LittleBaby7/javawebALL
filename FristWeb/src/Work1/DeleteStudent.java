package Work1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaWebWork.StudentCRUD;

@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String stuid=request.getParameter("StuID");
		PrintWriter p = response.getWriter(); 
		if(StudentCRUD.get(stuid)==null) {
			p.println("此人不存在");
		}
		else {
			JavaWebWork.StudentCRUD.delete(stuid);
			response.sendRedirect("DeleteStudent.jsp");
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
