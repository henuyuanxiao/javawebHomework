package jdbcweb;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.LinkedList;
import java.util.Properties;

public class JDBCSearch extends JDBCVideo{
    public LinkedList<video> getResults(String keyword) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        LinkedList<video> videos= new LinkedList<video>();

        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video where vname like '%"+keyword+"%'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            int i=0;

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
            System.out.println(keyword);
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

    public int getNum(String keyword) {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video where vname like '%"+keyword+"%'";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            int i=0;
            while(rs.next())
            {
                i++;
            }
            return i;
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
