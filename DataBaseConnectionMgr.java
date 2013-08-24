/* 
Apply Singleton pattern for handling the connection to the database
@author: Jesus Cuenca
*/

public class DataBaseConnectionMgr{

	private static String driver;
	private static String database;
	private static String user;
	private static String password;
	
	private static FCDriver fcdriver=null;

	protected DataBaseConnectionMgr(){
	}

	public static synchronized FCDriver getFCDriver() throws Exception{
		if(fcdriver == null){
			if ( (driver == null) || (database == null) || (user == null) || (password == null)){
				throw new Exception("No connection parameters");
			}

			if(driver.equals("org.postgresql.Driver")){
				PostgresqlDriverConnection c=new PostgresqlDriverConnection();
				c.connect(database,user,password);
				fcdriver=c;
			}
		}
		return fcdriver;
	}
	
	public static void setConnectionParameters(String driver,String database,String user, String password){
	
		DataBaseConnectionMgr.driver=driver;
		DataBaseConnectionMgr.database=database;
		DataBaseConnectionMgr.user=user;
		DataBaseConnectionMgr.password=password;

	}

}
