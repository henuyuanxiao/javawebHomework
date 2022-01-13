package jdbcweb;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.LinkedList;
import java.util.Properties;

public class JDBClikesCollection extends JDBCVideo{
    Properties prop = new Properties();
    InputStream inputStream = JDBCVideo.class.getResourceAsStream("/Videos.properties");
    public int AddLikes(int uid, int vid) {
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1 = "INSERT INTO user_likes values (?,?)";
            String sql2 = "UPDATE video set goodN=goodN+1 where vid=" + vid;
            PreparedStatement ptmt1 = connection.prepareStatement(sql1);
            ptmt1.setInt(1, uid);
            ptmt1.setInt(2, vid);
            PreparedStatement ptmt2 = connection.prepareStatement(sql2);
            ptmt1.execute();
            ptmt2.executeUpdate();

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
        return 0;
    }

    public int ReduceLikes(int uid, int vid) {
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1 = "delete from user_likes where uid="+uid+" and vid="+vid;
            String sql2 = "UPDATE video set goodN=goodN-1 where vid=" + vid;
            PreparedStatement ptmt1 = connection.prepareStatement(sql1);
            PreparedStatement ptmt2 = connection.prepareStatement(sql2);
            ptmt1.execute();
            ptmt2.executeUpdate();

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
        return 0;
    }

    public int ConsoleLikes(int uid, int vid) {
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1 = "select vid from user_likes where uid="+uid;
            ResultSet rs=null;
            Statement statement = connection.createStatement();
            rs=statement.executeQuery(sql1);
            int num=0;
            while(rs.next()){
                num=rs.getInt("vid");
                if(vid==num)
                    return 0;
            }
            if(num==0)
                return -1;

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
        return -1;
    }

    public int AddCollection(int uid, int vid) {
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1 = "INSERT INTO user_collection values (?,?,?)";
            PreparedStatement ptmt1 = connection.prepareStatement(sql1);
            Date date=new Date(System.currentTimeMillis());
            ptmt1.setInt(1, uid);
            ptmt1.setInt(2, vid);
            ptmt1.setDate(3,date);
            ptmt1.execute();

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
        return 0;
    }

    public int ReduceCollection(int uid, int vid) {
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1 = "delete from user_collection where uid="+uid+" and vid="+vid;
            PreparedStatement ptmt1 = connection.prepareStatement(sql1);
            ptmt1.execute();

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
        return 0;
    }

    public int ConsoleCollection(int uid, int vid) {
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1 = "select vid from user_collection where uid=" + uid;
            ResultSet rs = null;
            Statement statement = connection.createStatement();
            rs = statement.executeQuery(sql1);
            int num = 0;
            while (rs.next()) {
                num = rs.getInt("vid");
                if (vid == num)
                    return 0;
            }
            if (num == 0)
                return -1;

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
        return -1;
    }


}
