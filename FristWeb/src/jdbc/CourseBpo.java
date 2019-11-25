package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pojo.CourseBean;
import pojo.TeacherBean;
import util.DBConnection;

public class CourseBpo {
	static Connection conn = null;
	static ResultSet rs = null;
	static Statement st = null;
	static PreparedStatement ps = null;

	public static CourseBean getByCname(String name) {
		CourseBean course = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course where cname =" + name + "";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String courseid = rs.getString("courseid");
				String cname = rs.getString("cname");
				Float ccredit = rs.getFloat("ccredit");
				String cpre = rs.getString("cpre");
				course = new CourseBean(courseid, cname, ccredit, cpre);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}

		return course;
	}

	public static List<CourseBean> getCoursesByname(String name) throws SQLException {
		if (name == null)
			name = "";

		List<CourseBean> courses = new ArrayList<CourseBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course where  cname= '" + name + "'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next() == true) {
				CourseBean course = new CourseBean();
				course.setCourseid(rs.getString("courseid"));
				course.setCname(rs.getString("cname"));
				course.setCcredit(rs.getFloat("ccredit"));
				course.setCpre(rs.getString("cpre"));
				courses.add(course);

			}
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return courses;
	}

	public static List<CourseBean> getCoursesByInfo(String name, String cid) throws SQLException {
		List<CourseBean> courses = new ArrayList<CourseBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course where  cname= '" + name + "' or courseid='" + cid + "' ";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next() == true) {
				CourseBean course = new CourseBean();
				course.setCourseid(rs.getString("courseid"));
				course.setCname(rs.getString("cname"));
				course.setCcredit(rs.getFloat("ccredit"));
				course.setCpre(rs.getString("cpre"));
				courses.add(course);

			}
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return courses;
	}
//根据课程号，从sc表中查询此课程的选课人数
	public static int getNumber(String courseid) {
		int number = 0;
		try {
			conn = DBConnection.getConnection();
			String sql = "select count(stuid) sum from sc where courseid='" + courseid + "'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				number = rs.getInt("sum");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return number;
	}
//根据课程名返回课程集合（模糊查询）
	public static List<CourseBean> getBycname(String name) {
		List<CourseBean> courses=new ArrayList<CourseBean>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course where cname like '%" + name + "%' ";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String courseid = rs.getString("courseid");
				String cname = rs.getString("cname");
				Float ccredit = rs.getFloat("ccredit");
				String cpre = rs.getString("cpre");
				CourseBean course = new CourseBean(courseid, cname, ccredit, cpre);
				courses.add(course);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return courses;
	}

	// 根据学号和课程号，判断学生是否已经选过这门课，如果已经选过返回true，否则返回false
	public static boolean isPicked(String stuid, String courseid) {
		boolean picked = false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from sc where  stuid= '" + stuid + "' and courseid='" + courseid + "' ";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next())
				picked = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return picked;
	}
//选课操作，根据学号和课程号，在sc表中插入数据
	public static void chooseCourse(String stuid, String courseid) {
		int number = 0;
		try {
			conn = DBConnection.getConnection();
			String sql = "insert sc values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stuid);
			ps.setString(2, courseid);
			ps.setFloat(3, 0);
			number = ps.executeUpdate();
			System.out.println(number);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}

	}

}
