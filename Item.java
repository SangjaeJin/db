
public class Item {
	
	public static String showItemsQuery(String category) {
		return "SELECT * FROM ITEM WHERE Cat_sub="+"\""+category+"\"";
	}
	
	public static String searchItemQuery(String name) {
		return "SELECT * FROM ITEM WHERE Name="+"\""+name+"\"";
	}
}
