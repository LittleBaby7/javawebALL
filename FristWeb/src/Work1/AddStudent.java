package Work1;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaWebWork.StudentCRUD;

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String stuID=request.getParameter("StuID");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		int age1=Integer.parseInt(age);
		//int age1=Integer.parseInt(age);
		String classname=request.getParameter("classname");
		String sex=request.getParameter("sex");
		String birth=request.getParameter("BirthDay");
		Timestamp ts = null;
		try {
			ts = Date_String.toTimestamp(birth);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter p = response.getWriter(); 
		if(StudentCRUD.get(stuID)!=null) 
			p.println("已有此学号，学号不能重复，请重新输入学号");
		else {
			StudentCRUD.add(stuID, name, sex, age1, classname,ts);
			response.sendRedirect("AddStudent.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
