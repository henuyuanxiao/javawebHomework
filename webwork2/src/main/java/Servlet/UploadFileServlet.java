package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;

import com.jspsmart.upload.*;
import jdbcweb.*;
public class UploadFileServlet extends HttpServlet {
    ServletConfig servletConfig;
    public UploadFileServlet(){
        super();
    }
    public void init(ServletConfig config)throws ServletException{
        this.servletConfig=config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       //这部分是文件上传的代码
        SmartUpload su =new SmartUpload();
        try {
            su.initialize(servletConfig,request,response);
        }catch (ServletException e1){
            e1.printStackTrace();
        }

        su.setAllowedFilesList("mp4,png,jpg");
        su.setMaxFileSize(1024*1024*1024*1024);
        su.setTotalMaxFileSize(2*1024*1024*1024*1024);
        try{
            su.upload();
        } catch (SmartUploadException e2) {
            e2.printStackTrace();
        }catch (ServletException e2){
            e2.printStackTrace();
        }catch (IOException e2){
            e2.printStackTrace();
        }
        Date date=new Date();
        long d=date.getTime();
        Request req=su.getRequest();

        Files files=su.getFiles();
        File file1=files.getFile(0);
        File file2=files.getFile(1);
        String[] extFile=new String[2];
        extFile[0]=file1.getFileExt();
        extFile[1]=file2.getFileExt();
        String vPath = null;
        String vPath2=null;
        String mainfile=String.valueOf(d);
        String pPath =null;
        String pPath2=null;
        for(int i=0;i<2;i++){
            if(extFile[i].equals("mp4")){
                vPath="D:\\上课\\大三上\\java web\\webwork2\\src\\main\\webapp\\video\\"+mainfile+".mp4";
                vPath2="D:\\上课\\大三上\\java web\\webwork2\\target\\webwork2\\video\\"+mainfile+".mp4";
            }else{
                pPath="D:\\上课\\大三上\\java web\\webwork2\\src\\main\\webapp\\image\\videos\\"+mainfile+".png";
                pPath2="D:\\上课\\大三上\\java web\\webwork2\\target\\webwork2\\image\\videos\\"+mainfile+".png";
            }
        }
        //session将文件路径给VmessageServlet上传视频信息至数据库
        HttpSession session= request.getSession();
        int vid=(int)session.getAttribute("vid");
        JDBCVideo jdbcVideo=new JDBCVideo();
        String VPath="video/"+mainfile+".mp4";
        String PPath="image/videos/"+mainfile+".png";
        int result=jdbcVideo.updatePaths(vid,VPath,PPath);

        if(result==0) {
//       继续上传视频
            System.out.println(vPath);
            System.out.println(pPath);
            try {
                file1.saveAs(pPath);
                file1.saveAs(pPath2);
                file2.saveAs(vPath);
                file2.saveAs(vPath2);
            } catch (SmartUploadException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            User user=(User)session.getAttribute("user");
            user.setVideoNum(user.getVideoNum()+1);
            session.setAttribute("user",user);
            response.sendRedirect("PersonalPage2.0.jsp");
        }
        else {
            response.sendRedirect("UploadMPage.jsp");
        }
    }
}
