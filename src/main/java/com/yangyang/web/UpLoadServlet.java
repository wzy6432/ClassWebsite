package com.yangyang.web;


import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
@WebServlet(name = "uploadServlet", value = "/upload-servlet")
public class UpLoadServlet extends HttpServlet{
   protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
       //1.判断请求是否为multipart请求
       if(!ServletFileUpload.isMultipartContent(request)){
           throw new RuntimeException("当前请求不支持文件上传");
       }
       try {
           //创建一个FileItem工厂
           DiskFileItemFactory factory=new DiskFileItemFactory();
           //设置使用临时文件的边界值，大于该值，上传文件会先保存到临时文件中，否则，上传文件将直接写入内存
           //单位：字节。本例设置边界值为1M
           factory.setSizeThreshold(1024*1024*1);
           //设置临时文件
           String tempPath=this.getServletContext().getRealPath("/static/temp");
           File temp=new File(tempPath);
           factory.setRepository(temp);
           //创建文件上传核心组件
           ServletFileUpload upload=new ServletFileUpload(factory);
           //设置每一个item的头部字符编码，其可以解决文件名的中文乱码问题
           upload.setHeaderEncoding("UTF-8");
           //设置单个上传文件的最大边界值为10M
           upload.setFileSizeMax(1024*1024*10);
           //设置一次上传所有文件的总和最大值为20M（对于上传多个文件时起临时作用）
           upload.setFileSizeMax(1024*1024*20);
           //解析请求
           List<FileItem> items=upload.parseRequest(request);
           //遍历items
           for(FileItem item:items){
               if(item.isFormField()){//若item为普通表单项
                   String fieldName=item.getFieldName();//获取表单名称
                   String fielsValue=item.getString("UTF-8");//获取表单项的值
                   System.out.println(fieldName+"="+fielsValue);
               }else{
                   String fileName=item.getName();//获取上传文件原始名称
                   fileName=System.currentTimeMillis()+fileName;
                   //获取输入流，其中有上传文件内容
                   InputStream is=item.getInputStream();
                   //获取文件保存再服务器的路径
                   String path=this.getServletContext().getRealPath("/static/resource");
                   //获取当前系统时间
                   Date date=new Date();
                   //格式化日期
                   SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
                   String now=sdf.format(date);
                   path=path+"/"+now;
                   //若该目录不在
                   File dirFile=new File(path);
                   if(!dirFile.exists()){
                       dirFile.mkdir();
                   }
                   //创建目标文件，将来用于保存上传的文件
                   File descFile=new File(path,fileName);
                   //创建文件输出流
                   OutputStream os=new FileOutputStream(descFile);
                   //将输入流中的数据写入到输出流中
                   int len=-1;
                   byte[] buf=new byte[1024];
                   while((len=is.read(buf))!=-1){
                       os.write(buf,0,len);

                   }
                   //关闭流
                   os.close();
                   is.close();
                   //删除临时文件
                   item.delete();
               }
           }       } catch (FileUploadException e) {
           e.printStackTrace();
       }
   }

}
