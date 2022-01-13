package jdbcweb;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCRanking extends JDBCVideo{
    public video[] getRank() {
        Properties prop = new Properties();
        InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
        video[] v = new video[10];
        for(int i=0;i<10;i++){
            v[i]=new video();
        }
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from video order by watchN desc limit 10";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            int i=0;
            while(rs.next())
            {
                v[i].setVid(rs.getInt("vid"));
                v[i].setVname(rs.getString("vname"));
                v[i].setClass(rs.getString("class"));
                v[i].setOwner(rs.getInt("owner"));
                v[i].setPath(rs.getString("path"));
                v[i].setWatchN(rs.getInt("watchN"));
                v[i].setGoodN(rs.getInt("goodN"));
                v[i].setMessage(rs.getString("message"));
                v[i].setPicPath(rs.getString("PicPath"));
                i++;
                if(i>=10)break;
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
}
