package com.nft.DbConn;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class DbUtil {
	public static Connection getConnection () {
		String jdbcDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost/nftDB";
		//jdbc:mysql://localhost/nftDB
		String dbUser = "root";
		String dbPwd = "1234";
		Connection conn = null;
		
		try {
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPwd);
			if (conn == null) {System.out.println("연결 실패");}
			else {System.out.println("연결 성공");}
			}
		catch (ClassNotFoundException ce){
			ce.printStackTrace();
		}
		catch (SQLException se) {
			se.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}		
}

