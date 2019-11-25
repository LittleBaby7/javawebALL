package JavaWebWork;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import util.DBConnection;

public class StudentCRUD {
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	PreparedStatement pss=null;
	PreparedStatement ps=null;
	//根据ID得到所有的信息
	public void get(String StuID) {
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from student where Stuid='"+StuID+"'";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
				String id=rs.getString("stuid");
				String name=rs.getString("sname");
				String Sex=rs.getString("sex");
				int age=rs.getInt("age");
				String ClassName=rs.getString("classname");
				Timestamp BirthDay=rs.getTimestamp("birthday");
				System.out.println("StuID="+id+"  Sname="+name+"  sex="+Sex+"  age="+age+"  ClassName="+ClassName+"  BirthDay="+BirthDay);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("查询失败");
		} finally {
			DBConnection.close(rs, st, conn);
			
		}
	}
	//更新数据
	public void update(String StuID,String Sname,String Sex, int age,String ClassName,Timestamp BirthDay) {
		try {
			conn = DBConnection.getConnection();
			String sql = "update  student set Sname=?,Sex=?,age=?,ClassName=?,Birthday=? where Stuid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, Sname);
			ps.setString(2, Sex);
			ps.setInt(3, age);
			ps.setString(4, ClassName);
			ps.setTimestamp(5, BirthDay);
			ps.setString(6, StuID);
			int number=ps.executeUpdate();
			if(number>0) 
				System.out.println("更新数据成功");
			else
				System.out.println("更新数据失败");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("更新信息失败");
		} finally {
			DBConnection.close(rs, st, conn);
			
		}
		
		
	}
	//根据id删除数据
	public void delete(String StuID) {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete  from student where Stuid='"+StuID+"'";
			st = conn.createStatement();
			int number=st.executeUpdate(sql);
			if(number>0)
				System.out.println("删除信息成功");
			else
				System.out.println("删除信息失败");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除信息失败");
		} finally {
			DBConnection.close(rs, st, conn);
			
		}
		
		
	}
	//插入新的数据
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
				System.out.println("插入数据失败");
			}finally {
				DBConnection.close(rs, ps, conn);
			}		
	}
	//在student表插入一个新的数据的同时给user1表中也插入一样的数据
	public void addwithtrans() throws SQLException {
		try{
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			
			String sql1 = "insert into user1 values(?,?,?,?,?)";
		    String sql2="insert into student values(?,?,?,?,?,?)";
			
		    ps = conn.prepareStatement(sql1);
		    ps.setString(1,"yh");
		    ps.setString(3, "男");
			ps.setInt(4, 20);
			ps.setString(2, "17");
			ps.setTimestamp(5, new Timestamp(99,07,01,11,11,11,0));
			ps.executeUpdate();
			
			pss = conn.prepareStatement(sql2);
			pss.setString(1, "007");
			pss.setString(2, "yh");
			pss.setString(3, "男");
			pss.setInt(4, 20);
			pss.setString(6, "17");
			pss.setTimestamp(5, new Timestamp(99,07,01,11,11,11,0));
			pss.executeUpdate();
			
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
			//操作出现异常，撤销事务  
			conn.rollback();
		}finally{
			conn.setAutoCommit(true);
			DBConnection.close(null, ps, null);
			DBConnection.close(rs, pss, conn);
		}
	}
}
