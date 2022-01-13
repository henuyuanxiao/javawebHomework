package jdbcweb;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.LinkedList;
import java.util.Properties;

public class JDBCVideo{
    Properties prop = new Properties();
    InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
	public int UpdateVideo(video video){


        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1="INSERT INTO video VALUES(?,?,?,?,?,?,?,?,?,?)";
            String sql2="update user set videoNum=videoNum+1 where uid="+String.valueOf(video.getOwner());
            Date date=new Date(System.currentTimeMillis());
            PreparedStatement preparedStatement= connection.prepareStatement(sql1);
            preparedStatement.setInt(1,video.getVid());
            preparedStatement.setString(2,video.getVname());
            preparedStatement.setString(3,video.getclass());
            preparedStatement.setInt(4,video.getOwner());
            preparedStatement.setString(5,video.getPath());
            preparedStatement.setInt(6,0);
            preparedStatement.setInt(7,0);
            preparedStatement.setDate(8,date);
            preparedStatement.setString(9,video.getMessage());
            preparedStatement.setString(10,video.getPicPath());
            preparedStatement.executeUpdate();
            PreparedStatement ptmt=connection.prepareStatement(sql2);
            ptmt.execute();
            return 0;
        } catch (IOException e) {
            e.printStackTrace();
            return 1;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return 1;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return 1;
        }

    }

    public int getIdMax() {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql="select MAX(vid)+1 from video";
            ResultSet rs=null;
            Statement statement = connection.createStatement();
            rs=statement.executeQuery(sql);
            int num=0;
            if (rs.next()){
                num=rs.getInt(1);
            }
//            int num=(int)rs.getInt(0);
            return num;
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

    public video idGetVideo(int id) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        video v = new video();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video where vid='" + id + "'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            while(rs.next())
            {
                v.setVid(rs.getInt("vid"));
                v.setVname(rs.getString("vname"));
                v.setClass(rs.getString("class"));
                v.setOwner(rs.getInt("owner"));
                v.setPath(rs.getString("path"));
                v.setWatchN(rs.getInt("watchN"));
                v.setGoodN(rs.getInt("goodN"));
                v.setMessage(rs.getString("message"));
                v.setPicPath(rs.getString("PicPath"));
            }
            return v;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public Timestamp idGetUdate(int vid) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        Timestamp date=new Timestamp(System.currentTimeMillis());
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select udate from video where vid='" + vid + "'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            if(rs.next())
            {
                date=rs.getTimestamp("udate");
            }
            return date;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }



    public LinkedList<video> uidGetVideo(int id) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        LinkedList<video> videos=new LinkedList<video>();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video where owner=" + id;
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            while(rs.next())
            {
                video v = new video();
                v.setVid(rs.getInt("vid"));
                v.setVname(rs.getString("vname"));
                v.setClass(rs.getString("class"));
                v.setOwner(rs.getInt("owner"));
                v.setPath(rs.getString("path"));
                v.setWatchN(rs.getInt("watchN"));
                v.setGoodN(rs.getInt("goodN"));
                v.setMessage(rs.getString("message"));
                v.setPicPath(rs.getString("PicPath"));
                videos.add(v);
            }
            return videos;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public LinkedList<video> uidGetColl(int id) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        LinkedList<video> videos=new LinkedList<video>();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video where vid in (select vid from user_collection where uid="+id+") ";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            while(rs.next())
            {
                video v = new video();
                v.setVid(rs.getInt("vid"));
                v.setVname(rs.getString("vname"));
                v.setClass(rs.getString("class"));
                v.setOwner(rs.getInt("owner"));
                v.setPath(rs.getString("path"));
                v.setWatchN(rs.getInt("watchN"));
                v.setGoodN(rs.getInt("goodN"));
                v.setMessage(rs.getString("message"));
                v.setPicPath(rs.getString("PicPath"));
                videos.add(v);
            }
            return videos;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public String idGetUName(int id) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        video v = new video();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select name from user where uid='" + id + "'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            String name=null;
            while(rs.next())
            {name=rs.getString(1);}
            return name;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }



    public int[] ClaGetId(String Cla) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        video v = new video();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select vid from video where class='" + Cla + "'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            int[] Arr=new int[1000];
            int i=1;
            while(rs.next())
            {
                Arr[i]=rs.getInt("vid");
                i++;
            }
            Arr[0]=i-1;
            return Arr;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public LinkedList<video> ClaGetVideo(String Cla) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        video v = new video();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video where class='" + Cla + "'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            LinkedList<video> videos=new LinkedList<video>();
            while(rs.next())
            {
                video video=new video();
                video.setVid((int)rs.getInt("vid"));
                video.setVname((String) rs.getString("vname"));
                video.setClass((String)rs.getString("class"));
                video.setOwner((int)rs.getInt("owner"));
                video.setPath((String)rs.getString("path"));
                video.setWatchN((int)rs.getInt("watchN"));
                video.setGoodN((int)rs.getInt("goodN"));
                video.setMessage((String)rs.getString("message"));
                video.setPicPath((String)rs.getString("PicPath"));
                videos.add(video);
            }
            return videos;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }


	public void DropVideo(String vname){
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql="Delete * from video where vname='"+vname+"'";
            String sql2="update user set videoNum=videoNum-1 where uid in (select owner from video where vname='"+vname+"') ";
            PreparedStatement ptmt= connection.prepareStatement(sql2);
            ptmt.executeUpdate();
            PreparedStatement preparedStatement= connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        } catch (IOException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
    }

    public void DropVideoByVID(int vid){
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql="Delete from video where vid='"+vid+"'";
            String sql2="update user set videoNum=videoNum-1 where uid in (select owner from video where vid='"+vid+"') ";
            String sql3="delete from user_likes where vid="+vid;
            String sql4="delete from user_collection where vid="+vid;
            String sql5="delete from user_comment where vid="+vid;

            PreparedStatement ptmt= connection.prepareStatement(sql2);
            ptmt.executeUpdate();
            PreparedStatement preparedStatement= connection.prepareStatement(sql);
            File file1=new File(idGetVideo(vid).getPath());
            System.out.println(file1.getPath());
            file1.delete();
            preparedStatement.executeUpdate();
            PreparedStatement ptmt3=connection.prepareStatement(sql3);
            ptmt3.execute();
            PreparedStatement ptmt4=connection.prepareStatement(sql4);
            ptmt4.execute();
            PreparedStatement ptmt5=connection.prepareStatement(sql5);
            ptmt5.execute();
        } catch (IOException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
    }

	public void WatchNAdd(String vname){
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql="update video set watchN=watchN+1 where vname='"+vname+"'";
            PreparedStatement preparedStatement= connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        } catch (IOException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
    }

    public void GoodNAdd(int vid){
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql="update video set goodN=goodN+1 where vid="+vid;
            PreparedStatement preparedStatement= connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        } catch (IOException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
    }

    public void GoodNReduce(int vid){
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql="update video set goodN=goodN-1 where vid='"+vid+"'";
            PreparedStatement preparedStatement= connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        } catch (IOException e) {
            e.printStackTrace();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
    }

    public int updatePaths(int vid,String vPath,String pPath){
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");

        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1="update video set path='"+vPath+"' where vid="+vid;
            String sql2="update video set PicPath='"+pPath+"' where vid="+vid;
            PreparedStatement preparedStatement1= connection.prepareStatement(sql1);
            PreparedStatement preparedStatement2=connection.prepareStatement(sql2);

            preparedStatement1.executeUpdate();
            preparedStatement2.executeUpdate();
            return 0;
        } catch (IOException e) {
            e.printStackTrace();
            return 1;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return 1;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return 1;
        }

    }




    public String setDisplay(video v){
        if(v.getVname()!=null)
            return "display: visible";
        else
            return "display: none";
    }

}

