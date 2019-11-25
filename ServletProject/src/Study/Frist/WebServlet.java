package Study.Frist;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebServlet extends HttpServlet{

	protected void doGet(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("doGet..");
	}
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("doPost..");
	}
	


}
