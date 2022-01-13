package jdbcweb;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class User {
	private String userName;
	private String password;
	private String Email;
	private int videoNum=0;
	private String date=null;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public User(){}
	public User(String userName,String password,String Email){
		this.userName=userName;
		this.password=password;
		this.Email=Email;
	}
	public User(String userName,String password){
		this.userName=userName;
		this.password=password;
	}
	/*
	 * 用户登录
	 */
	public boolean select(String sql){
		boolean b=false;
		try{
			PreparedStatement ps=JDBCUser.getConnection().prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			b=JDBCUser.select(ps);
			ps.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return b;
	}

	public int unameGetId(String uname){
		try{
			String sql="select uid from user where name='"+uname+"'";
			ResultSet rs=null;
			PreparedStatement ps=JDBCUser.getConnection().prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
			ps.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return -1;
	}
	/*
	 * 用户注册
	 */
	public int insert(String sql){
		int result=0;
		boolean b=false;
		Timestamp timestamp =new Timestamp(System.currentTimeMillis());
		this.date=sdf.format(timestamp);
		try{
			//先判断用户是否存在
			String sql1="select name from user where name = ?";
			PreparedStatement ps1=JDBCUser.getConnection().prepareStatement(sql1);
			ps1.setString(1, userName);
			b=JDBCUser.select(ps1);
			ps1.close();
			if(b){//用户名已存在
				result=-1;
			}
			else{//用户名不存在
				PreparedStatement ps2=JDBCUser.getConnection().prepareStatement(sql);
				ps2.setString(1, userName);
				ps2.setString(2, password);
				ps2.setString(3, Email);
				ps2.setTimestamp(4,timestamp);
				result=JDBCUser.insert(ps2);
				ps2.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}



	/*
	 *个人主页
	 */
	public User personal(String name){
		ResultSet rs;
		User user=new User();
		try{
			String sqldate="select * from user where name=?";
			PreparedStatement ps1=JDBCUser.getConnection().prepareStatement(sqldate);
			ps1.setString(1,name);
			rs = ps1.executeQuery();
			if(rs.next()) {
				user.setUserName(rs.getString("name"));
				user.setDate(rs.getTimestamp("cdate").toString());
				user.setEmail(rs.getString("Email"));
				user.setVideoNum(rs.getInt("videoNum"));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public String getEmail() {
		return Email;
	}

	public int getVideoNum() {
		return videoNum;
	}

	public String getDate() {
		return date;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
