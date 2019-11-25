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

import jdbc.CourseBpo;
import util.DBConnection;

public class CourseBean {
	static Connection conn = null;
	static Statement st = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	private String courseid;
	private String cname;
	private float ccredit;
	private String cpre;

	public CourseBean() {
		super();
	}

	public CourseBean(String courseid, String cname, float ccredit, String cpre) {
		super();
		this.courseid = courseid;
		this.cname = cname;
		this.ccredit = ccredit;
		this.cpre = cpre;
	}

	public String getCourseid() {
		if(courseid==null) courseid="";
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public String getCname() {
		if(cname==null) cname="";
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public float getCcredit() {
		return ccredit;
	}

	public void setCcredit(float ccredit) {
		this.ccredit = ccredit;
	}

	public String getCpre() {
		if(cpre==null) cpre="";
		return cpre;
	}

	public void setCpre(String cpre) {
		this.cpre = cpre;
	}

	public static List<CourseBean> getAllCourse() {
		List<CourseBean> courses = new ArrayList<CourseBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next() == true) {
				String cid = rs.getString("courseid");
				String cname = rs.getString("cname");
				float credit = rs.getFloat("ccredit");
				String pre = rs.getString("cpre");
				CourseBean course = new CourseBean(cid, cname, credit, pre);
				courses.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return courses;
	}

	public static CourseBean getByCid(String courseid) {
		CourseBean course = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course where courseid='" + courseid + "'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String cid = rs.getString("courseid");
				String cname = rs.getString("cname");
				float credit = rs.getFloat("ccredit");
				String pre = rs.getString("cpre");
				course = new CourseBean(cid, cname, credit, pre);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return course;
	}

	public static void update(CourseBean course) {
		try {
			conn = DBConnection.getConnection();
			String sql = "update  course set cname=?,ccredit=?,cpre=? where courseid=" + course.getCourseid();
			ps = conn.prepareStatement(sql);
			ps.setString(1, course.getCname());
			ps.setFloat(2, course.getCcredit());
			ps.setString(3, course.getCpre());
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

	public static void deleteByCid(String courseid) {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete  from course where courseid='" + courseid + "'";
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

	public void addCourse() {
		try {
			conn = DBConnection.getConnection();
			String sql = "insert course values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.getCourseid());
			ps.setString(2, this.getCname());
			ps.setFloat(3, this.getCcredit());
			ps.setString(4, this.getCpre());
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

	public Map<String, String> checkCourse() {
		Map<String, String> errors = new HashMap<String, String>();
		if (courseid == null || courseid.equals("")) {
			errors.put("courseid", "课程号不能为空！");
		} else {
			CourseBean course = getByCid(courseid);
			if (course != null)
				errors.put("courseid", "课程编号已存在！");
		}
		if (cname == null || cname.equals(""))
			errors.put("cname", "课程名不能为空！");
		else {
			CourseBean course=CourseBpo.getByCname(cname);
			if(course!=null)
				errors.put("cname", "该课程名已存在！");
		}
		return errors;
	}
}
