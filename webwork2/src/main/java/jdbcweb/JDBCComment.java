package jdbcweb;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;

public class JDBCComment extends JDBCVideo{
    public int UploadCommend(int uid,int vid,String msg){
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql1="INSERT INTO user_comment values (?,?,?,?)";
            PreparedStatement ptmt1 = connection.prepareStatement(sql1);
            ptmt1.setInt(1, uid);
            ptmt1.setInt(2, vid);
            ptmt1.setString(3,msg);
            ptmt1.setTimestamp(4,new Timestamp(System.currentTimeMillis()));
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
    public LinkedList<Comment> GetComments(int vid){
        Comment comment = new Comment();
        try {
            prop.load(inputStream);
            Class.forName(prop.getProperty("driver"));
            Connection connection = DriverManager.getConnection(prop.getProperty("url"),
                    prop.getProperty("username"), prop.getProperty("password"));
            String sql = "select * from user_comment where vid="+vid+" order by(date) desc ";
            Statement statement = connection.createStatement();
            ResultSet rs = null;
            rs = statement.executeQuery(sql);
            LinkedList<Comment> comments=new LinkedList<Comment>();
            while(rs.next())
            {
                comment=new Comment();
                comment.setUid(rs.getInt("uid"));
                comment.setVid(rs.getInt("vid"));
                comment.setMsg(rs.getString("comment"));
                comment.setDate(rs.getTimestamp("date"));
                comment.setUname(idGetUName(comment.getUid()));
                comments.add(comment);
            }
            return comments;
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
