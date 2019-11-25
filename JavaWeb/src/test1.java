import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class test1 {
	private  static final String url = "jdbc:sqlserver://localhost:1433;databasename=实验一";
	private static final String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	private static final String UserName = "sa";
	private static final String PWD = "123456";
	public void update() throws ClassNotFoundException, SQLException {
		Class.forName(driverName);
		Connection con=DriverManager.getConnection(url, UserName, PWD);
		String sql = "insert j values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "J8");
		ps.setString(2, "山东建筑大学");
		ps.setString(3, "济南");
		int number = ps.executeUpdate();
		System.out.println(number);	
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		test1 t=new test1();
		t.update();
	}

}
