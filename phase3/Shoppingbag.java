
public class Shoppingbag {
	public static String getSelectQuery(String id) {
		return "SELECT AMOUNT FROM SHOPPINGBAG WHERE C_id="+"\"" +id+"\"";
	}
	
	public static String getUpdateQuery(String id,int amt) {
		amt+=1;
		return "UPDATE SHOPPINGBAG SET AMOUNT="+amt+" WHERE C_id="+"\""+id+"\"";
	}
	
	public static String getCreateBagQuery(String id) {
		return "INSERT INTO SHOPPINGBAG VALUES(0,"  +"\""+id+"\""+")";
	}
	public static String getUpdateAmountQuery(String id,int amt)
	{
		amt-=1;
		return "UPDATE SHOPPINGBAG SET AMOUNT="+amt+" WHERE C_id="+"\""+id+"\"";
	}
}
