package myPackage;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {
	private static Properties props =null;

    public static Connection getConnection() throws SQLException, IOException, ClassNotFoundException{
    	//加载配置文件
    	//加载驱动类
    	//调用DriverManager.getConnection()
    	//加载配置文件
    
    	//加载驱动类
    	
    	
	    	InputStream in =JdbcUtils.class.getClassLoader()
	                 .getResourceAsStream("dbconfig.properties");
	    	
	    	Properties props = new Properties();
	    	props.load(in);
	    	
		
		
		
			
			Class.forName(props.getProperty("driverClassName"));
			
		
    	return DriverManager.getConnection(props.getProperty("url"),
    			props.getProperty("username"),props.getProperty("password"));
    }
}
