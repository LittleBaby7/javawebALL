import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Test {
	private final String URL = "jdbc:sqlserver://localhost:1433;databasename=ʵ��һ" ;
	private final String UserName = "sa";
	private final String PWD = "123456";
	public void update() throws ClassNotFoundException, SQLException {
		//�������������ؾ����������
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//���ؾ����������
		//�����ݿ⽨������
		Connection con= DriverManager.getConnection(URL,UserName,PWD);
		//����sql��ִ����ɾ�Ĳ�
		Statement st= con.createStatement();
		String sql="select Jno,Jname from J";
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()) {
			String number=rs.getString("Jno");
			String name=rs.getString("Jname");
			System.out.println("Jno="+number+"  "+"Jname="+name);
			
		}
		rs.close();
		st.close();
		con.close();
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Test test=new Test();
		test.update();

	}

}
