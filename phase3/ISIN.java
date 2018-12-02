import java.io.Serializable;

public class ISIN implements Serializable{
	private String c_id;
	private String i_ssn;
	
	public ISIN(String id,String ssn) {
		c_id=id;
		i_ssn =ssn;
	}
	
	public   String getInsertQuery() {
		return "INSERT INTO IS_IN VALUES("+ "\""+ i_ssn+ "\"" +","+ "\""+ c_id+"\""+")";
	}
	
	public String getSsn() {
		return i_ssn;
	}
	
	public String getDeleteQuery()
	{
		return "DELETE FROM IS_IN WHERE S_c_id="+"\""+c_id+"\""+" AND I_ssn="+"\""+i_ssn+"\"";
	}
	
	public static String getCheckISINQuery(String id,String ssn) {
		return "SELECT I_ssn FROM IS_IN WHERE S_c_id="+"\""+id+"\""+" AND I_ssn="+"\""+ssn+"\"";
	}
	
	
	public static String getInsertISINQuery(String id,String ssn) {
		return "INSERT INTO IS_IN VALUES("+ "\""+ ssn+ "\"" +","+ "\""+ id+"\""+")";
	}
}
