public class Sales {
	
	public static String getEntireSalesQuery()
	{
		return "SELECT SUM(Sales) FROM (SELECT I.price*O.orderAmount as Sales FROM ITEM I ,ORDERS O WHERE O.I_ssn=I.Ssn) S";
	}
	public static String getMonthSalesQuery(String month)
	{
		return "SELECT SUM(Sales) FROM (SELECT I.price*O.orderAmount as Sales FROM ITEM I,ORDERS O WHERE O.I_ssn=I.Ssn AND O.buyTime like "+"\""+month+"%"+"\""+") S";
	}
	public static String getDaySalesQuery(String day)
	{
		return "SELECT SUM(Sales) FROM (SELECT I.price*O.orderAmount as Sales FROM ITEM I,ORDERS O WHERE O.I_ssn=I.Ssn AND O.buyTime like "+"\""+day+"%"+"\""+") S";
	}
}
