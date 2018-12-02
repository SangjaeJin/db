

public class Order {
	private String c_id;
	private String i_ssn;
	private int orderAmount;
	private String buyTime;
	
	public Order(String id,String ssn,int amount,String time)
	{
		c_id=id;
		i_ssn=ssn;
		orderAmount=amount;
		buyTime=time;
	}
	public Order(String id)
	{
		c_id=id;
	}
	
	public String getInsertQuery()
	{
		return "INSERT INTO ORDERS VALUES("+"\""+c_id+"\""+","+"\""+i_ssn+"\""+","+orderAmount+","+"\""+buyTime+"\""+")";
	}
	public String getSelectQuery()
	{
		return "SELECT * FROM ORDERS WHERE C_id="+"\""+c_id+"\"";
	}
}
