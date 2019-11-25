package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pojo.Student;
import pojo.UserBean;
import util.DBConnection;
import util.Date_String;

public class UserBpo {
	private static Connection conn = null;
	private static Statement st = null;
	private static ResultSet rs = null;
	static PreparedStatement pss=null;
	static PreparedStatement ps=null;
	public static boolean validlogin(String userid, String password)throws SQLException{
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user_stu where userid='"+userid+"' and password='"+password+"'";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()==true) successflag=true;
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return successflag;
	}
	public static List<UserBean> getAllUser(){
		List<UserBean> users=new ArrayList<UserBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user_stu";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()==true){
				String userid=rs.getString("userid");
				//String password=rs.getString("password");
				String username=rs.getString("username");
				String phonenumber=rs.getString("phonenumber");
				UserBean user=new UserBean(userid,null,username,phonenumber);
				users.add(user);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			DBConnection.close(rs, st, conn);
		}
		return users;
	}
	public static void updateInfo(UserBean user) {
		try {
			conn = DBConnection.getConnection();
			String sql = "update  user_stu set password=?,username=?,phonenumber=? where userid="+user.getUserid();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getPhoneNumber());
			int number=ps.executeUpdate();
			if(number>0) 
				System.out.println("成功");
			else
				System.out.println("失败");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);	
		}
	}	
	public static UserBean getUser(String userid) {
		UserBean user = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user_stu where userid='"+userid+"'";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				String id=rs.getString("userid");
				String name=rs.getString("username");
				String phonenumber=rs.getString("phonenumber");
				//String ClassName=rs.getString("classname");
				String usertype=rs.getString("usertype");
				user=new UserBean(id,null,name,phonenumber,usertype);
				//System.out.println("StuID="+id+"  Sname="+name+"  sex="+Sex+"  age="+age+"  ClassName="+ClassName+"  BirthDay="+BirthDay);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);	
		}
		return user;
	}
	public static void delete(String userid) {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete  from user_stu where userid='"+userid+"'";
			st = conn.createStatement();
			int number=st.executeUpdate(sql);
			if(number>0)
				System.out.println("删除成功");
			else
				System.out.println("删除失败");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);	
		}	
	}
	public static void addUser(UserBean user) {
		try {
			conn=DBConnection.getConnection();
			String sql="insert user_stu values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getUserName());
			ps.setString(4, user.getPhoneNumber());
			ps.setString(5,"2");
			int number=ps.executeUpdate();	
			if(number>0)
				System.out.println("成功");
			else
				System.out.println("失败");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, ps, conn);
		}		
	}
}
