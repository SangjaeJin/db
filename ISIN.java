import java.io.Serializable;

public class ISIN implements Serializable{
	private String c_id;
	private String i_ssn;
	
	public ISIN(String id,String ssn) {
		c_id=id;
		i_ssn =ssn;
	}
	
	public   String getInsertQuery() {
		return "INSERT INTO IS_IN VALUES("+ "\""+ c_id+ "\"" +","+ "\""+ i_ssn+"\""+")";
	}
	
	public String getSsn() {
		return i_ssn;
	}
}
