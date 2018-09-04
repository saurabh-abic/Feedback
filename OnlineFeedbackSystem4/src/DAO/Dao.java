package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
public class Dao {

	private static Connection con;
	public static Connection getCon(){
	//public static void main(String a[])
	
		
	try{
			 // Class.forName("oracle.jdbc.driver.OracleDriver");
			   Class.forName("com.mysql.jdbc.Driver");
			//  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root","root");
			   con=DriverManager.getConnection("jdbc:mysql://aax00oy1rl3bp4.czh4e3yszobc.us-east-1.rds.amazonaws.com:3306/ebdb","root","saurabh123");
		//	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","saurabh123");
		}catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	}