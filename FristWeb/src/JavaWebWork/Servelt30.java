package JavaWebWork;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;

/**
 * Servlet implementation class Servelt30
 */
@WebServlet("/Servelt30")
public class Servelt30 extends HttpServlet {
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
	public void add(String StuID,String Sname,String Sex, int age,String ClassName,Timestamp BirthDay) {
		
		try {
			conn=DBConnection.getConnection();
			String sql="insert student values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, StuID);
			ps.setString(2, Sname);
			ps.setString(3, Sex);
			ps.setInt(4, age);
			ps.setString(6, ClassName);
			ps.setTimestamp(5, BirthDay);
			int number=ps.executeUpdate();	
			if(number>0)
				System.out.println("插入数据成功");
			else
				System.out.println("插入数据失败");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, ps, conn);
		}
	
	
	
}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servelt30() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
