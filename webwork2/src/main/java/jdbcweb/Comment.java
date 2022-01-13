package jdbcweb;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Comment {
    private int uid;
    private String uname;
    private int vid;
    private String msg;
    private String date;
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public Comment(){
        this.uname=null;
        this.uid=0;
        this.vid=0;
        this.msg=null;
        this.date=null;
    }
    public Comment(int uid, int vid, String msg, Timestamp timestamp) {
//        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        this.uid = uid;
        this.vid=vid;
        this.msg=msg;
        this.date=sdf.format(timestamp);
        this.uname=null;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
        this.vid = vid;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getDate() {
        return date;
    }

    public void setDate(Timestamp timestamp) {
//        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        this.date = sdf.format(timestamp);
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }
}
