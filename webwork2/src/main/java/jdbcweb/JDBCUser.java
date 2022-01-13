package jdbcweb;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCUser {
	protected static Connection conn=null;
	protected static PreparedStatement ps=null;
	protected static ResultSet rs=null;
	public static synchronized Connection getConnection(){
		/*
		 * 建立数据库连接
		 */
		Properties prop = new Properties();
		InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

		try {
			prop.load(inputStream);
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager.getConnection(prop.getProperty("url"),
					prop.getProperty("username"), prop.getProperty("password"));
			}catch(Exception e){
				e.printStackTrace();
			}
			return conn;
	}
	/*
	 * 查询
	 */
	public static synchronized boolean select(PreparedStatement ps){
		boolean b=false;
		try{
			rs=ps.executeQuery();
			if(rs.next()){
				b=true;
			}
			else
				b=false;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return b;
	}

	/*
	 * 插入
	 */
	public static synchronized int insert(PreparedStatement ps){
		
		int result=0;
		try{
			result=ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	public static void close(){
		try{
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	/*
	用户名查询用户id
	 */
	public int NameGetUid(String uname){
		Properties prop = new Properties();
		InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
		video v = new video();
		try {
			prop.load(inputStream);
			Class.forName(prop.getProperty("driver"));
			Connection connection = DriverManager.getConnection(prop.getProperty("url"),
					prop.getProperty("username"), prop.getProperty("password"));
			String sql = "select uid from user where name='" + uname + "'";
			Statement statement = connection.createStatement();
			ResultSet rs = null;
			rs = statement.executeQuery(sql);
			int uid=0;
			while(rs.next())
			{uid=rs.getInt(1);}
			return uid;
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return -1;
		} catch (SQLException throwables) {
			throwables.printStackTrace();
			return -1;
		}
	}
}
