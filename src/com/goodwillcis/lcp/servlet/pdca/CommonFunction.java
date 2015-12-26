package com.goodwillcis.lcp.servlet.pdca;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CommonFunction {
	
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:DCPLOCAL";
	public static final String DBUSER = "jhdcp";
	public static final String DBPASS = "jhdcp";
	private static final long serialVersionUID = 1L;
	private ConnectionPool connPool= null;
	public static  CommonFunction cf = null;
	public CommonFunction() throws Exception{
		
		 connPool = new ConnectionPool(
				"oracle.jdbc.driver.OracleDriver",
				"jdbc:oracle:thin:@127.0.0.1:1521:dcplocal", "jhdcp",
				"jhdcp");
		connPool.createPool();
	} 
	
	/**
	 * 知心数据库操作
	 * 2015-12-24
	 * 吴海龙 
	 */
	public static ResultSet ExecuteQuery(String p_strSQL) {
		try {
			Connection conn = null;
			Statement stmt = null;
			String sql = p_strSQL;
			System.out.println(sql);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 执行增删改操作 2015-12-24 吴海龙
	 * @throws SQLException 
	 */
	public static int ExecuteNonQuery(String p_strSQL) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		try {
			String sql = p_strSQL;
			System.out.println(sql);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			stmt = conn.createStatement();
			int _n = stmt.executeUpdate(sql);
			return _n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			if(conn!=null){
				conn.close();
			}
			if(stmt!=null){
				stmt.close();
			}
		}
	}
	
	/**
	 * 将为null 的字符串转为空字符串;
	 * 2015-12-25
	 * 吴海龙 
	 */
	public static String FixNull(String p_strValue){
		if(p_strValue==null||"null".equals(p_strValue)){
			return "";
		}
		return p_strValue;
	}
}
