import java.io.Serializable;

public class Customer implements Serializable {
	private String id;
	private String password;
	private String address;
	private String phone;
	private String name;
	private String job;
	private String sex;
	private String age;
	private String orderedTimes;
	
	public Customer(String id,String password,String address,String phone) {
		this.id=id;
		this.password=password;
		this.address=address;
		this.phone=phone;

	}
	
	public Customer(String id,String password,String address,String phone,String name,String job,String sex,String age) {
		this.id=id;
		this.password=password;
		this.address=address;
		this.phone=phone;
		this.name=name;
		this.job=job;
		this.sex=sex;
		this.age=age;
	}
	
	
	public void setAddress(String newAddr) {
		this.address=newAddr;
	}
	public void setPhone(String newPhone) {
		this.phone=newPhone;
	}
	public void setName(String newName) {
		this.name=newName;
	}
	public void setJob(String newJob) {
		this.job=newJob;
	}
	public void setSex(String newSex) {
		this.sex=newSex;
	}
	public void setAge(String newAge) {
		if(Integer.valueOf(newAge)<=0) {
			System.out.println("나이 입력 오류\n");
			return;
		}
		this.age=newAge;
	}
	public void setPassword(String newPwd) {	
		this.password=newPwd;
	}
	
	
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress(){
		return address;
	}
	public String getName() {
		if(name!=null)
			return "\""+ name+"\"";
		else
			return null;
	}
	public String getJob() {
		if(job!=null)
			return "\""+ job+"\"";
		else
			return null;
	}
	public String getSex() {
		
//		if(sex!=null) {
//			char[] sexChar= sex.toCharArray();
//			return "\""+ sexChar[0]+"\"";
//		}
		if(sex!=null)
			return sex;
		else
			return null;
	}
	public String getAge() {
		if(age!=null)
			return "\""+ age+"\"";
			
		else
			return null;
	}

	public String getUpdateInfoString(String userId) {
		int ageNum=-1;
		String res;
		if(getAge()!=null)
			ageNum= Integer.valueOf(age);
		
		if(ageNum ==-1)
			res="UPDATE CUSTOMER SET " +"Address="+ "\""+address+"\"" +",Phone=" +"\""+phone+"\""+",Name="+getName()+",Job="+getJob()+",Sex="+getSex()+",Age=null"+" WHERE Id="+"\""+userId+"\"";
		
		else
			res="UPDATE CUSTOMER SET " +"Address="+ "\"" + address+"\"" +",Phone=" +"\""+phone+"\""+",Name="+getName()+",Job="+getJob()+",Sex="+getSex()+",Age="+ageNum+" WHERE Id="+"\""+userId+"\"";
				
		return res;
	}

	
	public static String getShortSignUpString(String id,String password,String address,String phone) {
		return "INSERT INTO CUSTOMER(Id,Password,Address,Phone) VALUES("+ "\"" +id +"\"" +"," +"\""+ password+"\""+ "," + "\""+address+"\"" +","+ "\""+phone+"\")";
	}
	
	public String getSignUpString() {
		int ageNum= -1;
		String res;
		if(getAge()!=null)
			ageNum=Integer.valueOf(age);
		
		if(ageNum ==-1)
			res="INSERT INTO CUSTOMER VALUES("+ "\"" +id +"\"" +"," +"\""+ password+"\""+ "," + "\""+address+"\"" +","+ "\""+phone+"\""+ "," +getName()+","+getJob()+","+getSex()+","+"null)";
		else
			res="INSERT INTO CUSTOMER VALUES("+ "\"" +id +"\"" +"," +"\""+ password+"\""+ "," + "\""+address+"\"" +","+ "\""+phone+"\""+ "," +getName()+","+getJob()+","+getSex()+","+ageNum+")";
				
		return res;
	}
	
//	public String getUpdatePwdString(String id) {
//		return "UPDATE CUSTOMER SET Password=" +password +" WHERE Id="+"\""+id+"\"";
//	}
	
	public static String getUpdatePwdString2(String id,String pwd) {
		return "UPDATE CUSTOMER SET Password=" +"\""+pwd+"\"" +" WHERE Id="+"\""+id+"\"";
	}
	
	public static String getLoginQuery(String id,String pwd) {
		return "SELECT Id FROM CUSTOMER WHERE Id="+"\""+id+"\""+" AND Password="+"\""+pwd+"\"";
	}
	
	public static String getCheckLoginQuery(String id) {
		return "SELECT Id FROM CUSTOMER WHERE Id="+"\""+id+"\"";
	}
	
//	public static String getUsersQuery() {
//		return "SELECT Id,Password,Name,Job,Address,Sex,
//	}
}
