package JavaWebWork;
import java.sql.SQLException;
import java.sql.Timestamp;
public class StudentTest {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws SQLException {
		StudentCRUD test=new StudentCRUD();
		test.get("000");
		//test.add("005","qq","��",21,"17",new Timestamp(98,03,12,12,12,12,0));
		//test.update("003", "LL", "��", 21, "17", new Timestamp(98,8,1,11,11,11,1));
		//test.addwithtrans();
	}

}
