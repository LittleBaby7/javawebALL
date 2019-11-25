package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pojo.TeacherBean;
import util.DBConnection;

public class TeacherBpo {
	static Connection conn = null;
	static Statement st = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	public static boolean  query(TeacherBean teacher) {
		boolean test=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tno='" + teacher.getTno() + "'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next())
				test=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return test;
	}
	//按条件返回多个teacher
	public static  List<TeacherBean> getTeachers(String tname, String tdept)throws SQLException{
		if(tname==null)tname="";
		if(tdept==null) tdept="";
		
		List<TeacherBean> teachers=new ArrayList<TeacherBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tname like '%"+tname+"%' and tdept like '%"+tdept+"%'";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()==true){
				TeacherBean teacher=new TeacherBean();
				teacher.setTno(rs.getString("tno"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setTdept(rs.getString("tdept"));
				teacher.setTpost(rs.getString("tpost"));
				teacher.setTdirect(rs.getString("tdirect"));
				teachers.add(teacher);
			}
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return teachers;
	}
	public static  List<TeacherBean> getTeachersByName(String tname)throws SQLException{
		if(tname==null)tname="";
		List<TeacherBean> teachers=new ArrayList<TeacherBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tname like '%"+tname+"%' ";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()==true){
				TeacherBean teacher=new TeacherBean();
				teacher.setTno(rs.getString("tno"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setTdept(rs.getString("tdept"));
				teacher.setTpost(rs.getString("tpost"));
				teacher.setTdirect(rs.getString("tdirect"));
				teachers.add(teacher);
			}
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return teachers;
	}
	public static  List<TeacherBean> getTeachersByDept( String tdept)throws SQLException{
		if(tdept==null) tdept="";
		
		List<TeacherBean> teachers=new ArrayList<TeacherBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where  tdept= '"+tdept+"'";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()==true){
				TeacherBean teacher=new TeacherBean();
				teacher.setTno(rs.getString("tno"));
				teacher.setTname(rs.getString("tname"));
				teacher.setSex(rs.getString("sex"));
				teacher.setTdept(rs.getString("tdept"));
				teacher.setTpost(rs.getString("tpost"));
				teacher.setTdirect(rs.getString("tdirect"));
				teachers.add(teacher);
			}
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return teachers;
	}
}
