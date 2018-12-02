
public class Item {
	
	public static String showItemsQuery(String category) {
		return "SELECT * FROM ITEM WHERE Cat_sub="+"\""+category+"\"";
	}
	
	public static String searchItemQuery(String name) {
		return "SELECT * FROM ITEM WHERE Name="+"\""+name+"\"";
	}
	
	public static String getSsnOfItemQuery(String name)
	{
		return "SELECT Ssn FROM ITEM WHERE Name="+"\""+name+"\"";
	}
	
	public static String showIsinItemsQuery(String ssn)
	{
		return "SELECT * FROM ITEM WHERE Ssn="+"\""+ssn+"\"";
	}
	
	public static String showAmountofItemQuery(String name)
	{
		return "SELECT Amount FROM ITEM WHERE Name="+"\""+name+"\"";
	}
	public static String getUpdateAmountQuery(int amount,String name)
	{
		return "UPDATE ITEM SET Amount="+amount+" WHERE Name="+"\""+name+"\"";
	}
	
	public static String showZeroAmountQuery()
	{
		return "SELECT * FROM ITEM WHERE Amount=0";
	}
}
