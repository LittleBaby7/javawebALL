package Work1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaWebWork.Student;
import JavaWebWork.StudentCRUD;

@WebServlet("/GetStudent")
public class GetStudent extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter p = response.getWriter(); 
		String Stuid=request.getParameter("StuID");
		if(JavaWebWork.StudentCRUD.get(Stuid)==null)
			p.println("此人不存在，");
		else {
			Student stu=JavaWebWork.StudentCRUD.get(Stuid);
		
			//response.sendRedirect("GetStudent.jsp"); 
			p.println("<html>");
			p.println("<head><title>学生列表</title></head>");
			p.println("<table class=\"mtable2\">");  
			p.println("<caption>学生列表</caption>");
			p.println("<tr><th>学号</th><th>姓名</th><th>性别</th><th>年龄</th><th>班级</th><th>出生日期</th></tr>");
			p.println("<tr>\r\n" + 
					"							<td>"+stu.getStuID()+"</td>\r\n" + 
					"						    <td>"+stu.getSname()+"</td>\r\n" + 
					"						    <td>"+stu.getSex()+"</td>\r\n" + 
					"						    <td>"+stu.getAge()+"</td>\r\n" + 
					"						    <td>"+stu.getClassName()+"</td>\r\n" + 
					"						    <td>"+stu.getBirthDay()+"</td>\r\n" + 
					"						</tr>");  
			p.println("</table>"); 
			p.println("</html>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
