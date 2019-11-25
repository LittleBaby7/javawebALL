package pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.TeacherBpo;
import util.DBConnection;
import util.Date_String;

public class TeacherBean {
	static Connection conn = null;
	static Statement st = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	private String tno;
	private String tname;
	private String sex;
	private String tdept;
	private String tpost;
	private String tdirect;

	public TeacherBean() {
		super();
	}

	public TeacherBean(String tno, String tname, String sex, String tdept, String tpost, String tdirect) {
		super();
		this.tno = tno;
		this.tname = tname;
		this.sex = sex;
		this.tdept = tdept;
		this.tpost = tpost;
		this.tdirect = tdirect;
	}

	public String getTno() {
		if(tno==null) tno="";
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTname() {
		if(tname==null) tname="";
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getSex() {
		if(sex==null) sex="";
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTdept() {
		if(tdept==null) tdept="";
		return tdept;
	}

	public void setTdept(String tdept) {
		this.tdept = tdept;
	}

	public String getTpost() {
		if(tpost==null) tpost="";
		return tpost;
	}

	public void setTpost(String tpost) {
		this.tpost = tpost;
	}

	public String getTdirect() {
		if(tdirect==null) tdirect="";
		return tdirect;
	}

	public void setTdirect(String tdirect) {
		this.tdirect = tdirect;
	}

	public static List<TeacherBean> getAllTeacher() {
		List<TeacherBean> teachers = new ArrayList<TeacherBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next() == true) {
				String tno = rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String tdept = rs.getString("tdept");
				String tpost = rs.getString("tpost");
				String tdirect = rs.getString("tdirect");
				TeacherBean tmp = new TeacherBean(tno, tname, sex, tdept, tpost, tdirect);
				teachers.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return teachers;
	}

	public static TeacherBean getByTno(String t) {
		TeacherBean teacher = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tno='" + t + "'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String tno = rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String tdept = rs.getString("tdept");
				String tpost = rs.getString("tpost");
				String tdirect = rs.getString("tdirect");
				teacher = new TeacherBean(tno, tname, sex, tdept, tpost, tdirect);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return teacher;
	}

	public static void update(TeacherBean teacher) {
		try {
			conn = DBConnection.getConnection();
			String sql = "update  teacher set tname=?,sex=?,tdept=?,tpost=?,tdirect=? where tno=" + teacher.getTno();
			ps = conn.prepareStatement(sql);
			ps.setString(1, teacher.getTname());
			ps.setString(2, teacher.getSex());
			ps.setString(3, teacher.getTdept());
			ps.setString(4, teacher.getTpost());
			ps.setString(5, teacher.getTdirect());
			int number = ps.executeUpdate();
			System.out.println(number);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);

		}

	}

	public void deleteByTno() {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete  from teacher where tno='" + this.getTno() + "'";
			st = conn.createStatement();
			int number = st.executeUpdate(sql);
			if (number > 0)
				System.out.println("成功");
			else
				System.out.println("失败");
		} catch (SQLException e) {
			e.printStackTrace();
			// System.out.println("shanchushibai");
		} finally {
			DBConnection.close(rs, st, conn);
		}
	}

	public void addTeacher() {
		try {
			conn = DBConnection.getConnection();
			String sql = "insert teacher values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.getTno());
			ps.setString(2, this.getTname());
			ps.setString(3, this.getSex());
			ps.setString(4, this.getTdept());
			ps.setString(5, this.getTpost());
			ps.setString(6, this.getTdirect());
			int number = ps.executeUpdate();
			System.out.println(number);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}

	public Map<String, String> checkTeacher() {
		Map<String, String> errors = new HashMap<String, String>();
		if (tno==null||tno.equals("")) {
			errors.put("tno", "教师编号不能为空！");
		} else {
			TeacherBean teacher = getByTno(tno);
			if (teacher!=null)
				errors.put("tno", "教师编号已存在！");
		}
		if (tname==null||tname.equals(""))
			errors.put("tname", "职工名不能为空！");
		return errors;
	}
}
