package pojo;
import java.sql.Timestamp;
public class Student {
	private String StuID;
	private String Sname;
	private String Sex;
	private int age;
	private String ClassName;
	private String BirthDay;
	public Student() {}
	public Student( String StuID,String Sname,String Sex, int age,String ClassName,String BirthDay) {
		this.StuID=StuID;
		this.Sname=Sname;
		this.Sex=Sex;
		this.age=age;
		this.ClassName=ClassName;
		this.BirthDay=BirthDay;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getStuID() {
		return StuID;
	}
	public void setStuID(String stuID) {
		StuID = stuID;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public String getBirthDay() {
		return BirthDay;
	}
	public void setBirthDay(String birthDay) {
		BirthDay = birthDay;
	}
}
