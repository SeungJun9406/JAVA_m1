package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public Connection getConnection() throws Exception {
		String driver = "org.mariadb.jdbc.Driver";
		String dburl = "jdbc:mariadb://127.0.0.1:3306/m1";
		String dbuser = "root";
		String dbpw = "java1234";
		Class.forName(driver);
		Connection conn = null;
		conn = DriverManager.getConnection(dburl, dbuser, dbpw);
		return conn;
	}
}
