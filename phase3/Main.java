import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

enum MainFunction { CUSTOMER,ITEM,BUY,MANAGER,EXIT}
enum CustFunction {SIGNUP,EDITINFO,EDITPWD,LOGIN,LOGOUT}
enum ItemFunction {WATCH,SEARCH}
enum BuyFunction {BUY, ORDERED}
enum ManagerFunction{ADD,WATCHZERO,WATCHPROFIT}

public class Main {
	
	public static String url="jdbc:mysql://localhost:3306/mysql?serverTimezone=Asia/Seoul";
	public static String user= "root";
	public static String pwd="123!";
	public static String superuser ="super" ;
	public static String superuserpwd="super";
	
	
//	public static String getRecommandQuery( String age, String job,String sex) {
//		
//		if(age==null && job==null&&sex==null)
//			return null;
//		else if(age!=null && job!=null && sex!=null)
//			return
//					"select I.name , I.ssn , count(*) as nums"+
//					" from item I , orders O , customer C"+
//					" where O.C_id = C.id and C.Sex="+"\""+sex+ "\""+" AND "+"C.Age>="+Math.floor(Integer.valueOf(age))+" AND C.Age<"+Math.ceil(Integer.valueOf(age))+" AND C.Job="+"\""+job+"\""+
//					" and O.I_ssn = I.ssn"+
//					" group by I.name, I.ssn"+
//					" order by nums desc limit 1";
//		else if(job==null && sex==null)
//			return "select I.name , I.ssn , count(*) as nums"+
//				" from item I , orders O , customer C"+
//				" where O.C_id = C.id and C.age >=" + Math.floor(Integer.valueOf(age))+"+ and C.age <"+Math.ceil(Integer.valueOf(age))+
//				" and O.I_ssn = I.ssn"+
//				" group by I.name, I.ssn"+
//				" order by nums desc limit 1";
//		
//		else if(age==null && sex==null)
//			return "select I.name , I.ssn , count(*) as nums"+
//			" from item I , orders O , customer C"+
//			" where O.C_id = C.id and C.Job="+"\""+job+ "\""+
//			" and O.I_ssn = I.ssn"+
//			" group by I.name, I.ssn"+
//			" order by nums desc limit 1";
//		
//		else if(age==null && job==null)
//			return
//			"select I.name , I.ssn , count(*) as nums"+
//			" from item I , orders O , customer C"+
//			" where O.C_id = C.id and C.Sex="+"\""+sex+ "\""+
//			" and O.I_ssn = I.ssn"+
//			" group by I.name, I.ssn"+
//			" order by nums desc limit 1";
//
//		else if(age ==null)
//			return
//					"select I.name , I.ssn , count(*) as nums"+
//					" from item I , orders O , customer C"+
//					" where O.C_id = C.id and C.Sex="+"\""+sex+ "\""+" AND C.Job="+"\""+job+"\""+
//					" and O.I_ssn = I.ssn"+
//					" group by I.name, I.ssn"+
//					" order by nums desc limit 1";
//		else if(job==null)
//			return
//					"select I.name , I.ssn , count(*) as nums"+
//					" from item I , orders O , customer C"+
//					" where O.C_id = C.id and C.Sex="+"\""+sex+ "\""+" AND "+"C.Age>="+Math.floor(Integer.valueOf(age))+" AND C.Age<"+Math.ceil(Integer.valueOf(age))+
//					" and O.I_ssn = I.ssn"+
//					" group by I.name, I.ssn"+
//					" order by nums desc limit 1";
//		else if(sex ==null)
//			return
//					"select I.name , I.ssn , count(*) as nums"+
//					" from item I , orders O , customer C"+
//					" where O.C_id = C.id and C.Job="+"\""+job+ "\""+" AND "+"C.Age>="+Math.floor(Integer.valueOf(age))+" AND C.Age<"+Math.ceil(Integer.valueOf(age))+
//					" and O.I_ssn = I.ssn"+
//					" group by I.name, I.ssn"+
//					" order by nums desc limit 1";
//		
//		return null;
//	}
	
	public static String getRecommandQuery( String age, String sex) {
		
		if(age==null &&sex==null)
			return null;
		else if(age!=null && sex!=null)
			return
					"select I.name , I.ssn , count(*) as nums"+
					" from item I , orders O , customer C"+
					" where O.C_id = C.id and C.Sex="+"\""+sex+ "\""+" AND "+"C.Age>="+Math.floor(Integer.valueOf(age))+" AND C.Age<"+Math.ceil(Integer.valueOf(age))+
					" and O.I_ssn = I.ssn"+
					" group by I.name, I.ssn"+
					" order by nums desc limit 1";
		
		else if(age ==null)
			return
					"select I.name , I.ssn , count(*) as nums"+
					" from item I , orders O , customer C"+
					" where O.C_id = C.id and C.Sex="+"\""+sex+ "\""+
					" and O.I_ssn = I.ssn"+
					" group by I.name, I.ssn"+
					" order by nums desc limit 1";
		
		else if(sex ==null)
			return
					"select I.name , I.ssn , count(*) as nums"+
					" from item I , orders O , customer C"+
					" where O.C_id = C.id and "+ "C.Age>="+Math.floor(Integer.valueOf(age))+" AND C.Age<"+Math.ceil(Integer.valueOf(age))+
					" and O.I_ssn = I.ssn"+
					" group by I.name, I.ssn"+
					" order by nums desc limit 1";
		
		return null;
	}
	
	public static void main(String[] args) {
		Connection conn=null;
		Statement stmt=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}
		catch (ClassNotFoundException e) {
			System.err.println(e.getMessage());
			System.out.println("class.forname() error");
			System.exit(1);
		}
		
		try {
			conn=DriverManager.getConnection(url, user, pwd);
		}
		catch (SQLException	 e) {
			e.printStackTrace();
			System.out.println("getConnection() error");
			System.exit(1);
		}
		
		try {
			conn.setAutoCommit(false);
			stmt=conn.createStatement();
		}
		
		catch(SQLException e){
			e.printStackTrace();
			System.out.println("setAutoCommit or createStatement 실패");
		}
		
		Scanner sc =new Scanner(System.in);
		boolean loginState=false;
		boolean superuserLoginState=false;
		//HashMap<String,String> idAndPwd = new HashMap<>();
		HashMap<String, Customer> idAndCust= new HashMap<>();
		String currentId=null;
		List<ISIN> isinList = new ArrayList<>(); 
		List<String> indexStrs=new ArrayList<>();
		
//		try (ObjectInputStream ois =new ObjectInputStream(new FileInputStream("idAndPwds.bin"))){
//			try {
//				idAndPwd =(HashMap)ois.readObject();
//			}
//			catch(EOFException e) {
//				e.printStackTrace();
//				System.exit(1);
//			}
//		}
//		catch(IOException |ClassNotFoundException e) {
//			
//		}
//		
//		try (ObjectInputStream ois =new ObjectInputStream(new FileInputStream("idAndCusts.bin"))){
//			try {
//				idAndCust =(HashMap)ois.readObject();
//			}
//			catch(EOFException e) {
//				e.printStackTrace();
//				System.exit(1);
//			}
//		}
//		catch(IOException |ClassNotFoundException e) {
//			
//		}
		indexStrs.add("CREATE INDEX customer_id_pwd_addr_phone ON CUSTOMER(Id,Password,Address,Phone)");
		indexStrs.add("CREATE INDEX customer_all ON CUSTOMER(Id,Password,Name,Job,Address,Sex,Age)");
		indexStrs.add("CREATE INDEX customer_editInfo ON CUSTOMER(Password,Name,Job,Address,Sex,Age");
		indexStrs.add("CREATE INDEX customer_editPwd ON CUSTOMER(Password)");
		indexStrs.add("CREATE INDEX customer_login ON CUSTOMER(Id,Password)");
		indexStrs.add("CREATE INDEX item_cat ON ITEM(Cat_ssb)");
		indexStrs.add("CREATE INDEX item_name ON ITEM(Name)");
		indexStrs.add("CREATE INDEX item_watch ON ITEM(Name,Price,MadePlace,Amount )");
		indexStrs.add("CREATE INDEX is_in_all ON IS_IN(I_ssn,S_c_id)");
		indexStrs.add("CREATE INDEX bag_id ON SHOPPINGBAG(C_id)");
		indexStrs.add("CREATE INDEX bag_id_amount ON SHOPPINGBAG(C_id,Amount)" );
		
		try {
			int res;
			for(int i=0;i<indexStrs.size();i++) 
				res=stmt.executeUpdate(indexStrs.get(i));
			conn.commit();
		}
		
		catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
			// TODO: handle exception
		}
		
		
		try {
			// Let's execute an SQL statement.
			String sql = "SELECT * from CUSTOMER";
			String bagSelectQuery,createBagQuery;
			ResultSet rs = stmt.executeQuery(sql);
			ResultSet rs2=null;
			while(rs.next()) {
				// no impedance mismatch in JDBC
				String 	id	= rs.getString(1);
				String pwd = rs.getString(2);
				String name = rs.getString(3);
				String job=rs.getString(4);
				String addr=rs.getString(5);
				String sex =rs.getString(6);
				String age =rs.getString(7);
				
				String phone =rs.getString(8);
				int orderedtimes= rs.getInt(9);
				//System.out.println(id+" "+pwd+" "+name+" "+job+" "+addr+" "+sex+" "+age+" "+phone);
				idAndCust.put(id,new Customer(id,pwd,addr,phone,name,job,sex,age));
				
				//기존 유저가 쇼핑백이 없을 경우 만드는 쿼
				bagSelectQuery = Shoppingbag.selectByID(id);
				rs2= stmt.executeQuery(bagSelectQuery);
				if(rs2.next()==false) {
					createBagQuery= Shoppingbag.getCreateBagQuery(id);
					stmt.executeUpdate(createBagQuery);
				}
			}
			conn.commit();			
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		
		while(true) {
			System.out.println("\n---- TEAM15 쇼핑몰 ----\n 원하는 기능을 선택하세요\n");
			System.out.println("1.회원관련");
			System.out.println("2.물품관련");
			System.out.println("3.구매관련");
			System.out.println("4.관리자기능");
			System.out.println("5.프로그램종료");
			
			int mainFuncChoice= sc.nextInt();
			sc.nextLine();
			if(mainFuncChoice-1 ==MainFunction.CUSTOMER.ordinal()) {
				
				System.out.println("1.회원가입 2.회원정보수정 3.비밀번호수정 4.로그인. 5.로그아웃. 원하는 기능을 선택하세요");
				int choice = sc.nextInt();
				sc.nextLine();
				if(choice-1 == CustFunction.SIGNUP.ordinal()) {
					String id;
					if(loginState ==true ||superuserLoginState ==true ) {
						System.out.println("로그아웃 먼저 하세요");
						continue;
					}
					
					while(true) {
						System.out.println("ID:");   id = sc.nextLine();
						String str;
						str= Customer.getCheckLoginQuery(id);
						
						try {
							ResultSet rs =stmt.executeQuery(str);
							if(rs.next()==true) {
								System.out.println("아이디가 중복됩니다. 다른 아이디를 입력하세요");
								continue;
							}
							else
								break;
						}
						catch(SQLException e){
							e.printStackTrace();
							System.exit(1);
							continue;
						}
					}
					
					System.out.println("비밀번호:");  String password= sc.nextLine();
					while(password.length() == 0) {
						System.out.println("비밀번호를 입력하세요");
						password=sc.nextLine();
					}
					
					System.out.println("주소:"); String address= sc.nextLine();
					while(address.length()==0) {
						System.out.println("주소를 입력하세요");
						address=sc.nextLine();
					}
					
					System.out.println("전화번호:"); String phone= sc.nextLine();
					while(phone.length()==0) {
						System.out.println("전화번호를 입력하세요");
						phone= sc.nextLine();
					}
	
					while(true) {
						System.out.println("추가 정보를 입력하시겠습니까?(y/n)");
						String yesOrNo = sc.nextLine();
						
						if(yesOrNo.equalsIgnoreCase("n")) {
							idAndCust.put(id, new Customer(id, password, address, phone));
//							idAndPwd.put(id,password);
							String signupQuery =  Customer.getShortSignUpString(id,password,address,phone);
							
							//query
							try {
								int res= stmt.executeUpdate(signupQuery);
								
								String bagQuery = Shoppingbag.getCreateBagQuery(id);
								res=stmt.executeUpdate(bagQuery);
								if(res ==1) {
									System.out.println("회원가입 되었습니다!\n");
									System.out.println("추가 정보를 입력하시면 상품을 추천해드려요");
									conn.commit();
									break;
								}
							}
							catch(SQLException e) {
								System.out.println("회원가입 오류");
								e.printStackTrace();
								System.exit(1);
							}
						}
						else if(yesOrNo.equalsIgnoreCase("y")) {
							System.out.println("추가 정보를 입력합니다 입력하고 싶지 않은 정보가 있다면 그냥 엔터를 누르세요");
							System.out.println("이름:"); String name = sc.nextLine();
							if( name.length() ==0)
								name = null;
							
						    System.out.println("직업:"); String job =sc.nextLine(); 
						    if(job.length()==0)
						    	job=null;
						    
						    String sex=null;
						    while(true) {
							    System.out.println("성별: (M or F)"); sex =sc.nextLine();
							    if(sex.length()==0)
							    	sex=null;
							    else if( ! (sex.equalsIgnoreCase("f")||sex.equalsIgnoreCase("m")) ) 
							    	System.out.println("m or f 만 입력하세요");
							    else
							    	break;
						    }
//						    char[] sexChar =sex.toCharArray();
						    
						    System.out.println("나이:");  String age= sc.nextLine();
						    if(age.length()==0)
						    	age=null;
						    else {
							    while(  Integer.valueOf(age) <=0) {
							    	System.out.println("나이 입력 오류. 재입력하세요");
							    	age=sc.nextLine();
							    }		
						    }
//						    int ageNum =Integer.valueOf(age);
//						    idAndPwd.put(id, password);
						    Customer cus= new Customer(id, password, address, phone, name, job, sex, age);
						    idAndCust.put(id, cus);
						    String signupQuery = cus.getSignUpString();
						    String bagQuery2= Shoppingbag.getCreateBagQuery(id);
						    //query
						    try {
								int res= stmt.executeUpdate(signupQuery);
								res=stmt.executeUpdate(bagQuery2);
								
								if(res ==1) {
									System.out.println("회원가입 되었습니다!\n");
									String recQuery= Main.getRecommandQuery(age, sex);
									
									ResultSet rs = stmt.executeQuery(recQuery);
									System.out.println("추천상품:\n");
									while(rs.next()) {
										// no impedance mismatch in JDBC
										String itemName 		= rs.getString(1);
										System.out.println(itemName+"\n");
									}
									conn.commit();			
									break;
								}
							}
							catch(SQLException e) {
								System.out.println("회원가입 오류");
								e.printStackTrace();
								System.exit(1);
							}   
						}
						else 
							System.out.println("y 아니면 n 만 입력하세요");			
					}
					
//					try(OutputStream os= new FileOutputStream(id+"_isin.bin")){
//						
//					}
//					catch(IOException e) {
//						e.printStackTrace();
//						System.exit(1);
//					}
//					
//					
//					File f =new File("idAndPwds.bin");
//					if(f.exists())
//						f.delete();
//					
//					try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndPwds.bin",false))){
//						try {
//							oos.writeObject(idAndPwd);
//						}
//						catch(EOFException e) {
//							e.printStackTrace();
//							System.exit(1);
//						}
//					}
//					catch(IOException  e) {
//						e.printStackTrace();
//						System.exit(1);
//					}
//					
//					f =new File("idAndCusts.bin");
//					if(f.exists())
//						f.delete();
//					
//					try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndCusts.bin",false))){
//						try {
//							oos.writeObject(idAndCust);
//						}
//						catch(EOFException e) {
//							e.printStackTrace();
//							System.exit(1);
//						}
//					}
//					catch(IOException  e) {
//						e.printStackTrace();
//						System.exit(1);
//					}
//					
//					String query= Shoppingbag.getCreateBagQuery(id);
//					try {
//						int res= stmt.executeUpdate(query);
//						conn.commit();
//					}
//					catch(SQLException e) {
//						System.out.println("장바구니 생성 오류");
//						e.printStackTrace();
//						System.exit(1);
//					}
					
					System.out.println("로그인 하세요");
				}
				
				else if(choice-1 ==CustFunction.EDITINFO.ordinal()) {
					if(loginState == false) 
						System.out.println("로그인 먼저 하세요\n");
					else if(superuserLoginState ==true)
						System.out.println("관리자 계정은 실행할 수 없습니다\n");
					else {
						System.out.println("회원정보를 수정합니다. 수정하고 싶지 않은 정보는 그냥 엔터를 누르세요 (ID수정은 불가능합니다)");
						
						System.out.println("현재주소: ");  System.out.println(idAndCust.get(currentId).getAddress()); 
						System.out.println("주소:"); String newAddr =sc.nextLine();
						if(newAddr.length()!=0)
							idAndCust.get(currentId).setAddress(newAddr);
						
						System.out.println("현재전화번호: ");  System.out.println(idAndCust.get(currentId).getPhone()); 
						System.out.println("전화번호:"); String newPhone =sc.nextLine();
						if(newPhone.length()!=0)
							idAndCust.get(currentId).setPhone(newPhone);
						
						System.out.println("현재이름: ");  System.out.println(idAndCust.get(currentId).getName()); 
						System.out.println("이름:" ); String newName= sc.nextLine();
						if(newName.length()!=0)
							idAndCust.get(currentId).setName(newName);
						
						System.out.println("현재직업: ");  System.out.println(idAndCust.get(currentId).getJob()); 
						System.out.println("직업:");String newJob =sc.nextLine();
						if(newJob.length()!=0)
							idAndCust.get(currentId).setJob(newJob);
						
						System.out.println("현재성별: ");  System.out.println(idAndCust.get(currentId).getSex()); 
						System.out.println("성별:"); String newSex =sc.nextLine();
						if(newSex.length()!=0)
							idAndCust.get(currentId).setSex(newSex);
						
						System.out.println("현재나이: ");  System.out.println(idAndCust.get(currentId).getAge()); 
						System.out.println("나이:"); String newAge= sc.nextLine();
					    if(newAge.length()!=0) {
					    	int ageNum= Integer.valueOf(newAge);
						    while(  Integer.valueOf(ageNum) <=0) {
						    	System.out.println("나이 입력 오류. 재입력하세요");
						    	newAge=sc.nextLine();
						    }		
						    ageNum = Integer.valueOf(newAge);
						    idAndCust.get(currentId).setAge(newAge);
					    }
						
						//idAndCust.put(currentId, idAndCust.get(currentId));

					    String updateQuery= idAndCust.get(currentId).getUpdateInfoString(currentId);
					    //query
					    try {
							int res= stmt.executeUpdate(updateQuery);
							if(res ==1) {
								System.out.println("정보가 변경되었습니다.\n");
								conn.commit();
							}
						}
						catch(SQLException e) {
							System.out.println("회원정보 변경 오류");
							e.printStackTrace();
							System.exit(1);
						}
					    
					  
					    try {
							// Let's execute an SQL statement.
							String recQuery = Main.getRecommandQuery(newAge, newSex);
							if(recQuery==null)
								System.out.println("추천상품을 보고 싶으시다면 추가정보를 입력하세요");
							ResultSet rs = stmt.executeQuery(recQuery);
							
							System.out.println("추천상품:");
							while(rs.next()) {
								// no impedance mismatch in JDBC
								String itemName =rs.getString(1);
								System.out.println(itemName+"\n");
							}
							conn.commit();			
						}catch(SQLException ex2) {
							System.err.println("sql error = " + ex2.getMessage());
							System.exit(1);
						}
					    
//					    File f =new File("idAndCusts.bin");
//						if(f.exists())
//							f.delete();
//						
//						try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndCusts.bin",false))){
//							try {
//								oos.writeObject(idAndCust);
//							}
//							catch(EOFException e) {
//								e.printStackTrace();
//								System.exit(1);
//							}
//						}
//						catch(IOException  e) {
//							e.printStackTrace();
//							System.exit(1);
//						}
					}
					
				}
				
				else if(choice-1 ==CustFunction.EDITPWD.ordinal()) {
					if(loginState == false) 
						System.out.println("로그인 먼저 하세요\n");
					else if(superuserLoginState ==true)
						System.out.println("관리자 계정은 실행할 수 없습니다.\n");
					else {
						System.out.println("비밀번호를 수정합니다. 수정하고 싶지 않으면 그냥 엔터를 누르세요 ");
						System.out.println("새로운 비밀번호:"); String newPwd= sc.nextLine();
						if(newPwd.length()!=0) {
							System.out.println("한번 더 입력:"); String checkPwd =sc.nextLine();
							while(checkPwd.equals(newPwd) ==false) {
								System.out.println("비밀번호가 일치하지 않습니다. 다시 입력하세요");
								checkPwd=sc.nextLine();
							}
						}
						
						//idAndPwd.put(currentId, newPwd);
						idAndCust.get(currentId).setPassword(newPwd);
						idAndCust.put(currentId, idAndCust.get(currentId));
						
						//String updatePwdQuery = idAndCust.get(currentId).getUpdatePwdString( currentId);
						String updatePwdQuery =Customer.getUpdatePwdString2(currentId, newPwd);
						//query
						try {
							int res= stmt.executeUpdate(updatePwdQuery);
							if(res ==1) {
								loginState=false;
								conn.commit();
								System.out.println("비밀번호가 변경되었습니다.\n");						
								System.out.println("다시 로그인 하세요");
							}
						}
						catch(SQLException e) {
							System.out.println("비밀번호 변경 오류");
							e.printStackTrace();
							System.exit(1);
						}	
						
//						File f =new File("idAndPwds.bin");
//						if(f.exists())
//							f.delete();
//						
//						try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndPwds.bin",false))){
//							try {
//								oos.writeObject(idAndPwd);
//							}
//							catch(EOFException e) {
//								e.printStackTrace();
//								System.exit(1);
//							}
//						}
//						catch(IOException  e) {
//							e.printStackTrace();
//							System.exit(1);
//						}
//						
//						f =new File("idAndCusts.bin");
//						if(f.exists())
//							f.delete();
//						
//						try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndCusts.bin",false))){
//							try {
//								oos.writeObject(idAndCust);
//							}
//							catch(EOFException e) {
//								e.printStackTrace();
//								System.exit(1);
//							}
//						}
//						catch(IOException  e) {
//							e.printStackTrace();
//							System.exit(1);
//						}
					}
				}
				else if(choice-1 == CustFunction.LOGIN.ordinal()) {
					
					if(loginState ==true || superuserLoginState==true) {
						System.out.println("이미 로그인 되어 있습니다");
						continue;
					}
					System.out.println("로그인 합니다.");
					System.out.println("id:"); String id =sc.nextLine();
					System.out.println("비밀번호:"); String password =sc.nextLine();
					
					if(id.equalsIgnoreCase(superuser) && password.equalsIgnoreCase(superuserpwd)) {
						System.out.println("관리자 계정으로 로그인 되었습니다");
						superuserLoginState=true;
					}
					
					else {
						String loginQuery= Customer.getLoginQuery(id,password);
						try {
							ResultSet rs =stmt.executeQuery(loginQuery);
							if(rs.next()==false) {
								System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.\n");
								continue;
							}
							else {
								id= rs.getString(1);
								System.out.println(id+"님 로그인 되었습니다.");
								loginState=true;
								currentId=id;
							}
							conn.commit();
						}
						catch(SQLException e){
							e.printStackTrace();
							System.exit(1);
							continue;
						}
					}
				}
				
				else if(choice-1 == CustFunction.LOGOUT.ordinal()) {
					if(loginState ==false && superuserLoginState==false) 
						System.out.println("로그인을 하지 않았습니다");
					else {
						isinList.clear();
						loginState=false;
						superuserLoginState=false;
						System.out.println("로그아웃 되었습니다");
					}
				}
			}
			
			else if(mainFuncChoice-1 ==MainFunction.ITEM.ordinal()) {
				System.out.println("1.카테고리 별로 구경 2.아이템 검색 or 장바구니에 담기. 원하는 기능을 선택하세요");
				int choice = sc.nextInt();
				sc.nextLine();
				if(choice-1 == ItemFunction.WATCH.ordinal()) {
					System.out.println("카테고리를 입력하세요");
					String category= sc.nextLine();
					String selectQuery =Item.showItemsQuery(category);
					
					//query
					try {
						ResultSet rs = stmt.executeQuery(selectQuery);
						while(rs.next()) {
							int amount =rs.getInt(1);
							int  price = rs.getInt(5);
							String madePlace =rs.getString(6);
							String name = rs.getString(8);
							System.out.println(" 이름:" + name + ",가격:" + price+", 원산지:"+madePlace+" ,수량:"+amount);
						}
						conn.commit();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("물품 구경 오류");
						e.printStackTrace();
						System.exit(1);
					}	
				}
				
				else if (choice-1 ==ItemFunction.SEARCH.ordinal()) {
					System.out.println("아이템 이름을 입력하세요:");
					String search = sc.nextLine();
					
					String ssn=null;
					String selectQuery=  Item.searchItemQuery(search);
					
					//query
					try {
						ResultSet rs = stmt.executeQuery(selectQuery);
						while(rs.next()) {
							int amount =rs.getInt(1);
							String importer=rs.getString(2);
							String madeDate =rs.getString(3);
							ssn=rs.getString(4);
							int  price = rs.getInt(5);
							String madePlace =rs.getString(6);
							String maker=rs.getString(7);
							String name = rs.getString(8);
							String cat_sub= rs.getString(9);
							String p_ssn =rs.getString(10);        
							System.out.println(" 이름:" + name + " ,가격:" + price+" ,원산지:"+madePlace+" ,수량:"+amount+" ,수입자:"+importer+" ,제조연원일:"+madeDate+" ,판매자:"+maker+" ,카테고리:"+cat_sub+",판매자등록번호:"+p_ssn );
						}
						conn.commit();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("물품 검색 오류");
						e.printStackTrace();
						System.exit(1);
					}	
					
					System.out.println("이 아이템을 장바구니에 담겠습니까? y/n");
					
					while(true) {
						String ans= sc.nextLine();
						if(ans.equalsIgnoreCase("n"))
							break;
						else if(superuserLoginState ==true){
							System.out.println("관리자 계정으로 실행할 수 없습니다");
							break;
						}
						else if(ans.equalsIgnoreCase("y")) {
							if( loginState ==false) {
								System.out.println("로그인 먼저 하세요");
								break;
							}
							
							String str= ISIN.getCheckISINQuery(currentId,ssn);
							
							try {
								ResultSet rs =stmt.executeQuery(str);
								if(rs.next()==true) {
									System.out.println("이미 상품이 장바구니에 있습니다");
									break;
								}
								else {
									String isinInsertQuery= ISIN.getInsertISINQuery(currentId, ssn);
									String bagSelectQuery= Shoppingbag.getSelectQuery(currentId);
									
									try {
										int res=stmt.executeUpdate(isinInsertQuery);
										ResultSet rs2=stmt.executeQuery(bagSelectQuery);
										int amount=0;
										while(rs2.next())
											amount =rs2.getInt(1);
										String bagUpdateQuery= Shoppingbag.getUpdateQuery(currentId, amount);
										res =stmt.executeUpdate(bagUpdateQuery);
										if(res==1)
											System.out.println("장바구니에 담았습니다\n");
										conn.commit();
									}
									catch(SQLException e) {
										e.printStackTrace();
										System.exit(1);
									}
								}
									
							}
							catch(SQLException e){
								e.printStackTrace();
								System.exit(1);
								continue;
							}
							
							break;
							
//							int i;
//							for (i =0; i< isinList.size();i++) {
//								if(isinList.get(i).getSsn().equals(ssn))
//									break;
//							}
//							if(i!=isinList.size()) {
//								System.out.println("이미 상품이 장바구니에 있습니다");
//								break;
//							}
							
//							ISIN isinObj= new ISIN(currentId, ssn);
//							isinList.add(isinObj);
//							
//							File f =new File(currentId+"_isin.bin");
//							if(f.exists())
//								f.delete();
//							
//							try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream(currentId+"_isin.bin",false))){
//								try {
//									oos.writeObject(isinList);
//								}
//								catch(EOFException e) {
//									e.printStackTrace();
//									System.exit(1);
//								}
//							}
//							catch(IOException  e) {
//								e.printStackTrace();
//								System.exit(1);
//							}
							
							
//							String isinInsertQuery =  isinObj.getInsertQuery();
//							String bagSelectQuery= Shoppingbag.getSelectQuery(currentId);
//							
//							//isin query
//							try {
//								int res=stmt.executeUpdate(isinInsertQuery);
//								ResultSet rs=stmt.executeQuery(bagSelectQuery);
//								int amount=0;
//								while(rs.next())
//									amount =rs.getInt(1);
//								String bagUpdateQuery= Shoppingbag.getUpdateQuery(currentId, amount);
//								res =stmt.executeUpdate(bagUpdateQuery);
//								if(res==1)
//									System.out.println("장바구니에 담았습니다\n");
//								conn.commit();
//							}
//							catch(SQLException e) {
//								System.out.println("장바구니 담기 오류");
//								e.printStackTrace();
//								System.exit(1);
//							}
						}
						
						else 
							System.out.println("y or n 중 하나만 입력하세요");
					}
				}
			}
			
			else if(mainFuncChoice-1 ==MainFunction.BUY.ordinal()) {
				if(loginState==false)
					System.out.println("로그인 먼저 하세요");
				else if(superuserLoginState ==true)
					System.out.println("관리자 계정으로 실행할 수 없습니다");
				else if(loginState==true)
				{
					System.out.println("1.구매 2.구매내역 확인. 원하는 기능을 선택하세요.");
					int choice = sc.nextInt();
					
					if(choice-1 == BuyFunction.BUY.ordinal())
					{
						if(isinList.size()==0)
						{
							System.out.println("장바구니에 상품이 존재하지 않습니다. 장바구니에 상품을 넣으신 후 이용해주세요.");
							continue;
						}
						System.out.println("장바구니에 들어있는 상품의 내역입니다.");
						int i;
						ResultSet rs;
						String showIsinItemQuery;
						for(i=0; i<isinList.size(); i++)
						{
							showIsinItemQuery = Item.showIsinItemsQuery(isinList.get(i).getSsn());
							try {
								rs = stmt.executeQuery(showIsinItemQuery);
								while(rs.next()) {
									int amount =rs.getInt(1);
									String importer=rs.getString(2);
									String madeDate =rs.getString(3);
									String ssn=rs.getString(4);
									int  price = rs.getInt(5);
									String madePlace =rs.getString(6);
									String maker=rs.getString(7);
									String name = rs.getString(8);
									String cat_sub= rs.getString(9);
									String p_ssn =rs.getString(11);
									System.out.println(" 이름:" + name + " ,가격:" + price+" ,원산지:"+madePlace+" ,수량:"+amount+" ,수입자:"+importer+" ,제조연원일:"+madeDate+" ,판매자:"+maker+" ,카테고리:"+cat_sub+",판매자등록번호:"+p_ssn );
								}
								conn.commit();
							}
							catch(SQLException e)
							{
								e.printStackTrace();
								System.exit(1);
							}
							
						}	
						sc.nextLine();
						System.out.println("구매할 상품의 이름을 입력하세요."); String i_name = sc.nextLine();
						System.out.println("구매할 수량을 입력하세요"); int order_num = sc.nextInt();
						String getAmountQuery = Item.showAmountofItemQuery(i_name);
						
						int totalAmount=0;
						try {
							rs=stmt.executeQuery(getAmountQuery);
							while(rs.next())
							{
								totalAmount=rs.getInt(1);
							}
							conn.commit();
						}
						catch(SQLException e)
						{
							e.printStackTrace();
							System.exit(1);
						}
						
						if(totalAmount<order_num)
						{
							System.out.println("수량이 부족하여 구매가 불가능합니다.");
							continue;
						}
						else
						{
							totalAmount=totalAmount-order_num;
						}
						
						String i_ssn = null;
						String getSsnQuery = Item.getSsnOfItemQuery(i_name);
						
						try {
							rs = stmt.executeQuery(getSsnQuery);
							while(rs.next())
								i_ssn = rs.getString(1);
							conn.commit();
						}
						catch(SQLException e)
						{
							e.printStackTrace();
							System.exit(1);
						}
						
						ISIN isinObj = new ISIN(currentId,i_ssn);
						for(i=0; i<isinList.size(); i++)
						{
							if(isinList.get(i).getSsn().equals(i_ssn))
							{
								isinList.remove(i);
								break;
							}
						}
						
						File f =new File(currentId+"_isin.bin");
						if(f.exists())
							f.delete();
						
						try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream(currentId+"_isin.bin",false))){
							try {
								oos.writeObject(isinList);
							}
							catch(EOFException e) {
								e.printStackTrace();
								System.exit(1);
							}
						}
						catch(IOException  e) {
							e.printStackTrace();
							System.exit(1);
						}
						
						String bagDeleteQuery = isinObj.getDeleteQuery();
						String bagSelectQuery = Shoppingbag.getSelectQuery(currentId);
						String itemUpdateQuery = Item.getUpdateAmountQuery(totalAmount, i_name);
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						Date dt = new Date();
						String today = sdf.format(dt);
						Order orderObj = new Order(currentId,i_ssn,order_num,today);
						String OrderInsertQuery = orderObj.getInsertQuery();
						
						try
						{
							stmt.executeUpdate(OrderInsertQuery);
							stmt.executeUpdate(itemUpdateQuery);
							rs = stmt.executeQuery(bagSelectQuery);
							int amount=0;
							while(rs.next())
								amount=rs.getInt(1);
							String bagUpdateQuery = Shoppingbag.getUpdateAmountQuery(currentId,amount);
							int res=stmt.executeUpdate(bagUpdateQuery);
							if(res==1)
								System.out.println("구매되었습니다.");

							stmt.executeUpdate(bagDeleteQuery);
							conn.commit();
						}
						catch(SQLException e) {
							e.printStackTrace();
							System.exit(1);
						}
						
					}
					else if(choice-1 == BuyFunction.ORDERED.ordinal())
					{
						Order orderObj = new Order(currentId);
						String getOrderSelectQuery = orderObj.getSelectQuery();
						ResultSet rs;
						
						try {
							rs=stmt.executeQuery(getOrderSelectQuery);
							
							if(rs.next()) {
								System.out.println("과거 구매내역입니다.");
								do{
									String i_ssn=rs.getString(2);
									int amount=rs.getInt(3);
									String buyTime=rs.getDate(4).toString();
									System.out.println("상품번호:"+i_ssn+" 총 수량:"+amount+" 주문 시간:"+buyTime);
								}while(rs.next());
							}
							else
							{
								System.out.println("과거 구매내역이 없습니다.");
								continue;
							}
							conn.commit();
						}
						catch(SQLException e)
						{
							e.printStackTrace();
							System.exit(1);
						}
						
						
					}
					
				}
			}
			
			else if(mainFuncChoice-1 ==MainFunction.MANAGER.ordinal()) {
				if(superuserLoginState==false || loginState==true) 
					System.out.println("관리자만 사용할 수 있는 기능입니다. 관리자 계정으로 로그인하세요");
				else
				{
					System.out.println("1.물품주문 2.재고가 부족한 상품조회 3.매출조회 원하는 기능을 선택하세요");
					int choice = sc.nextInt();
					sc.nextLine();
					
					if(choice-1 == ManagerFunction.ADD.ordinal())
					{
						System.out.println("주문할 물품의 이름을 입력해주세요");
						String orderItem = sc.nextLine();
						
						String selectQuery=  Item.searchItemQuery(orderItem);
						
						//query
						try {
							ResultSet rs = stmt.executeQuery(selectQuery);
							
							if(rs.next()) {
								do{
									int amount =rs.getInt(1);
									String importer=rs.getString(2);
									String madeDate =rs.getString(3);
									String ssn=rs.getString(4);
									int  price = rs.getInt(5);
									String madePlace =rs.getString(6);
									String maker=rs.getString(7);
									String name = rs.getString(8);
									String cat_sub= rs.getString(9);
									String p_ssn =rs.getString(11);
									System.out.println(" 이름:" + name + " ,가격:" + price+" ,원산지:"+madePlace+" ,수량:"+amount+" ,수입자:"+importer+" ,제조연원일:"+madeDate+" ,판매자:"+maker+" ,카테고리:"+cat_sub+",판매자등록번호:"+p_ssn );
								}while(rs.next());
							}
							else
							{
								System.out.println("존재하지 않는 상품입니다.");
								continue;
							}
							conn.commit();
							
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							System.out.println("물품 검색 오류");
							e.printStackTrace();
							System.exit(1);
						}
						
						System.out.println("주문할 수량을 입력해주세요");
						int orderNum = sc.nextInt();
						int amount=0;
						ResultSet rs;
						
						String showAmountQuery = Item.showAmountofItemQuery(orderItem);
						try
						{
							rs=stmt.executeQuery(showAmountQuery);
							while(rs.next())
								amount=rs.getInt(1);
							conn.commit();
						}
						catch(SQLException e)
						{
							e.printStackTrace();
							System.exit(1);
						}
						amount=amount+orderNum;
						String UpdateQuery = Item.getUpdateAmountQuery(amount, orderItem);
						
						try
						{
							int res=stmt.executeUpdate(UpdateQuery);
							if(res==1)
								System.out.println("주문 되었습니다.");
							conn.commit();
						}
						catch(SQLException e)
						{
							e.printStackTrace();
							System.exit(1);
						}
					}
					else if(choice-1 == ManagerFunction.WATCHZERO.ordinal())
					{
						String zeroAmountQuery = Item.showZeroAmountQuery();
						ResultSet rs;
						
						try {
							rs=stmt.executeQuery(zeroAmountQuery);
							if(rs.next())
							{
								System.out.println("재고가 모자란 상품입니다.");
								do {
									int amount =rs.getInt(1);
									String importer=rs.getString(2);
									String madeDate =rs.getString(3);
									String ssn=rs.getString(4);
									int  price = rs.getInt(5);
									String madePlace =rs.getString(6);
									String maker=rs.getString(7);
									String name = rs.getString(8);
									String cat_sub= rs.getString(9);
									String p_ssn =rs.getString(11);
									System.out.println(" 이름:" + name + " ,가격:" + price+" ,원산지:"+madePlace+" ,수량:"+amount+" ,수입자:"+importer+" ,제조연원일:"+madeDate+" ,판매자:"+maker+" ,카테고리:"+cat_sub+",판매자등록번호:"+p_ssn );
								}while(rs.next());
							}
							else
							{
								System.out.println("재고가 모자란 상품이 없습니다.");
								continue;
							}
							conn.commit();
						}
						catch(SQLException e)
						{
							e.printStackTrace();
							System.exit(1);
						}
					}
					else if(choice-1 == ManagerFunction.WATCHPROFIT.ordinal())
					{
						ResultSet rs;
						System.out.println("1.전체매출 2.월별매출 3.일별매출 보고싶은 매출을 고르세요");
						int select = sc.nextInt();
						sc.nextLine();
						int sales=0;
						
						if(select==1)
						{
							System.out.println("전체 매출을 조회합니다.");
							String getEntireSales = Sales.getEntireSalesQuery();
							try
							{
								rs=stmt.executeQuery(getEntireSales);
								while(rs.next())
									sales = rs.getInt(1);
								conn.commit();
							}
							catch(SQLException e)
							{
								e.printStackTrace();
								System.exit(1);
							}
							System.out.println("전체 매출:"+sales);
						}
						else if(select==2)
						{
							System.out.println("월별 매출을 조회합니다.");
							System.out.println("조회하고 싶은 년월을 입력해주세요 ---> ex) 2017-08 ");
							String date = sc.nextLine();
							
							String getMonthSales = Sales.getMonthSalesQuery(date);
							try {
								rs=stmt.executeQuery(getMonthSales);
								while(rs.next())
									sales=rs.getInt(1);
								conn.commit();
							}
							catch(SQLException e)
							{
								e.printStackTrace();
								System.exit(1);
							}
							System.out.println(date+"월의 매출:"+sales);
						}
						else if(select==3)
						{
							System.out.println("일별 매출을 조회합니다.");
							System.out.println("조회하고 싶은 년월일을 입력해주세요 ---> ex) 2018-08-14");
							String date =sc.nextLine();
							
							String getDaySales = Sales.getDaySalesQuery(date);
							try {
								rs=stmt.executeQuery(getDaySales);
								while(rs.next())
									sales=rs.getInt(1);
								conn.commit();
							}
							catch(SQLException e)
							{
								e.printStackTrace();
								System.exit(1);
							}
							System.out.println(date+"일의 매출:"+sales);
						}
					}
					
				}
			}
			
			else if(mainFuncChoice-1 ==MainFunction.EXIT.ordinal()) {
				isinList.clear();
				System.out.println("프로그램을 종료합니다\n");
				break;
			}
		}
	
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sc.close();
	}
}
