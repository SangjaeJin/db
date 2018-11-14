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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

enum MainFunction { CUSTOMER,ITEM,BUY,MANAGER,EXIT}
enum CustFunction {SIGNUP,EDITINFO,EDITPWD,LOGIN,LOGOUT}
enum ItemFunction {WATCH,SEARCH}
enum BuyFunction {BUY, ORDERED}
enum ManagerFunction{ADD,WATCHZERO,WATCHPROFIT}

public class ShoppingMallMain {

	public static String url="jdbc:mysql://localhost:3306/mysql?serverTimezone=Asia/Seoul";
	public static String user= "root";
	public static String pwd="123!";
	public static String superuser ="super" ;
	public static String superuserpwd="super";
	
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
		HashMap<String,String> idAndPwd = new HashMap<>();
		HashMap<String, Customer> idAndCust= new HashMap<>();
		String currentId=null;
		List<ISIN> isinList = new ArrayList<>(); 
		
		
		try (ObjectInputStream ois =new ObjectInputStream(new FileInputStream("idAndPwds.bin"))){
			try {
				idAndPwd =(HashMap)ois.readObject();
			}
			catch(EOFException e) {
				e.printStackTrace();
				System.exit(1);
			}
		}
		catch(IOException |ClassNotFoundException e) {
			//e.printStackTrace();
			//System.exit(1);
		}
		
		
		// TODO Auto-generated method stub
		while(true) {
			System.out.println("---- TEAM15 쇼핑몰 ----\n 원하는 기능을 선택하세요\n");
			System.out.println("1.회원관련");
			System.out.println("2.물품관련");
			System.out.println("3.구매관련");
			System.out.println("4.관리자기능");
			System.out.println("5.프로그램종료");
			
			int mainFuncChoice= sc.nextInt();
			
			if(mainFuncChoice-1 ==MainFunction.CUSTOMER.ordinal()) {
				
				System.out.println("1.회원가입 2.회원정보수정 3.비밀번호수정 4.로그인. 5.로그아웃. 원하는 기능을 선택하세요");
				int choice = sc.nextInt();
				
				if(choice-1 == CustFunction.SIGNUP.ordinal()) {
					String id;
					if(loginState ==true ||superuserLoginState ==true ) {
						System.out.println("로그아웃 먼저 하세요");
						continue;
					}
					
					while(true) {
						System.out.println("ID:");   id = sc.nextLine();
						if(idAndPwd.get(id)!=null) 
							System.out.println("아이디가 중복됩니다. 다른 아이디를 입력하세요");
						else
							break;
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
							idAndPwd.put(id,password);
							String signupQuery =  idAndCust.get(id).getShortSighUpString();
							
							//query
							try {
								int res= stmt.executeUpdate(signupQuery);
								if(res ==1) {
									System.out.println("회원가입 되었습니다!\n");
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
						    
						    System.out.println("성별: (M or F)"); String  sex =sc.nextLine();
						    if(sex.length()==0)
						    	sex=null;
						    char[] sexChar =sex.toCharArray();
						    
						    System.out.println("나이:");  String age= sc.nextLine();
						    if(age.length()==0)
						    	age=null;
						    else {
							    while(  Integer.valueOf(age) <=0) {
							    	System.out.println("나이 입력 오류. 재입력하세요");
							    	age=sc.nextLine();
							    }		
						    }
						    int ageNum =Integer.valueOf(age);
						    idAndPwd.put(id, password);
						    idAndCust.put(id, new Customer(id, password, address, phone, name, job, sex, age));
						    String signupQuery = idAndCust.get(id).getSignUpString();
						    
						    //query
						    try {
								int res= stmt.executeUpdate(signupQuery);
								if(res ==1) {
									System.out.println("회원가입 되었습니다!\n");
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
					
					try(OutputStream os= new FileOutputStream(id+"_isin.bin")){
						
					}
					catch(IOException e) {
						e.printStackTrace();
						System.exit(1);
					}
					
					
					File f =new File("idAndPwds.bin");
					if(f.exists())
						f.delete();
					
					try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndPwds.bin",false))){
						try {
							oos.writeObject(idAndPwd);
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
					
					System.out.println("로그인 하세요");
				}
				
				else if(choice-1 ==CustFunction.EDITINFO.ordinal()) {
					if(loginState == false) 
						System.out.println("로그인 먼저 하세요\n");
					else if(superuserLoginState ==true)
						System.out.println("관리자 계정은 실행할 수 없습니다\n");
					else {
						System.out.println("회원정보를 수정합니다. 수정하고 싶지 않은 정보는 그냥 엔터를 누르세요 (ID수정은 불가능합니다)");
						System.out.println("비밀번호:"); String newPwd= sc.nextLine();
						if(newPwd.length()!=0)
						    idAndCust.get(currentId).setPassword(newPwd);
						
						System.out.println("주소:"); String newAddr =sc.nextLine();
						if(newAddr.length()!=0)
							idAndCust.get(currentId).setAddress(newAddr);
						
						System.out.println("전화번호:"); String newPhone =sc.nextLine();
						if(newPhone.length()!=0)
							idAndCust.get(currentId).setPhone(newPhone);
						
						System.out.println("이름:" ); String newName= sc.nextLine();
						if(newName.length()!=0)
							idAndCust.get(currentId).setName(newName);
						
						System.out.println("직업:");String newJob =sc.nextLine();
						if(newJob.length()!=0)
							idAndCust.get(currentId).setJob(newJob);
						
						System.out.println("성별:"); String newSex =sc.nextLine();
						if(newSex.length()!=0)
							idAndCust.get(currentId).setSex(newSex);
						
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
					    
					    
					    String updateQuery= idAndCust.get(currentId).getUpdateInfoString();
					    
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
						idAndPwd.put(currentId, newPwd);
						idAndCust.get(currentId).setPassword(newPwd);
						String updatePwdQuery = idAndCust.get(currentId).getUpdatePwdString();
						
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
							System.out.println("회원정보 변경 오류");
							e.printStackTrace();
							System.exit(1);
						}	
						
						File f =new File("idAndPwds.bin");
						if(f.exists())
							f.delete();
						
						try (ObjectOutputStream oos =new ObjectOutputStream(new FileOutputStream("idAndPwds.bin",false))){
							try {
								oos.writeObject(idAndPwd);
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
					
					else if( idAndPwd.get(id).equals(password)) {
						loginState= true;
						currentId=id;
						try (ObjectInputStream ois =new ObjectInputStream(new FileInputStream(currentId+"_isin.bin"))){
							while(true) {
								try {
									isinList.add((ISIN)ois.readObject());
								}
								catch(EOFException e) {
									
									System.out.println("로그인 되었습니다\n");
								}
							}
						}
						catch(IOException |ClassNotFoundException e) {
							e.printStackTrace();
							System.out.println("isin 불러오기 실패");
							System.exit(1);
						}
					}
					else 
						System.out.println("아이디 혹은 비밀번호가 잘못되었습니다.\n");
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
							System.out.println(" 이름= " + name + ",가격 = " + price+",원산지 = "+madePlace+",수량 = "+amount);
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
							
							int i;
							for (i =0; i< isinList.size();i++) {
								if(isinList.get(i).getSsn().equals(ssn))
									break;
							}
							if(i!=isinList.size()) {
								System.out.println("이미 상품이 장바구니에 있습니다");
								break;
							}
							
							ISIN isinObj= new ISIN(currentId, ssn);
							isinList.add(isinObj);
							try(ObjectOutputStream  oos = new ObjectOutputStream(new FileOutputStream(currentId+"_isin.bin"))){
								oos.writeObject(isinObj);
								
							}
							
							catch(IOException e) {
								System.out.println("장바구니에 담기 파일 오류");
								e.printStackTrace();
								System.exit(1);
							}
							
							
							String isinInsertQuery =  isinObj.getInsertQuery();
							String bagSelectQuery= Shoppingbag.getSelectQuery(currentId);
							
							//isin query
							try {
								int res=stmt.executeUpdate(isinInsertQuery);
								ResultSet rs=stmt.executeQuery(bagSelectQuery);
								int amount =rs.getInt(1);
								String bagUpdateQuery= Shoppingbag.getUpdateQuery(currentId, amount);
								res =stmt.executeUpdate(bagUpdateQuery);
								if(res==1)
									System.out.println("장바구니에 담았습니다\n");
								conn.commit();
							}
							catch(SQLException e) {
								System.out.println("장바구니 담기 오류");
								e.printStackTrace();
								System.exit(1);
							}
		
							break;
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
				else {
					
				}
			}
			
			
			else if(mainFuncChoice-1 ==MainFunction.MANAGER.ordinal()) {
				if(superuserLoginState==false || loginState==true) 
					System.out.println("관리자만 사용할 수 있는 기능입니다. 관리자 계정으로 로그인하세요");
				
				else {
					
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
