package com.yangyang.dao.impl;

import com.yangyang.dao.impl.ByteToFileUtil;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileSystemView;
public class testFileChooserSelectPath {

    String url ="jdbc:mysql://localhost:3306/design?useSSL=true";
    String driver="com.mysql.jdbc.Driver";
    String user = "root";
    String password = "2499069236";
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet resultSet=null;
    File selectedFile=null;
    String contextPath;
    byte[] buffer = null;
    String filename,str;

    public  void connectionDB(){

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Successfully connected");
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public void InsertIntoDB(int index){

        JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
        int returnValue = jfc.showSaveDialog(null);

        if (returnValue == JFileChooser.APPROVE_OPTION) {
            selectedFile = jfc.getSelectedFile();
            System.out.println(selectedFile.getAbsolutePath());
        }
        String path=selectedFile.getAbsolutePath();
        System.out.println(path);

        try {
            //连接数据库再操作
            conn = DriverManager.getConnection(url, user, password);
            String insertsql="insert into tb_Path(id,path,byteName) value(?,?,?)";
            ps=conn.prepareStatement(insertsql);
            ps.setInt(1,index);
            ps.setString(2, path);
            ps.setBytes(3,ByteToFileUtil.getBytes(path));
            ps.executeUpdate();
            System.out.println("文件路径成功插入数据库");
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void deletefromDB(int index){
        try {
            //连接数据库再操作
            conn = DriverManager.getConnection(url, user, password);
            String insertsql="delete from tb_Path where id = ?";
            ps=conn.prepareStatement(insertsql);
            ps.setInt(1,index);
            ps.executeUpdate();
            System.out.println("文件路径成功从数据库删除");
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public byte[] selectByte(int index){
        try {

            //连接数据库再操作
            conn = DriverManager.getConnection(url, user, password);
            String selectsql="select byteName from tb_Path where id = ?";
            ps=conn.prepareStatement(selectsql);
            ps.setInt(1,index);
            resultSet = ps.executeQuery();

            while(resultSet.next()){
                buffer = resultSet.getBytes("byteName");
            }
            conn.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return buffer;
    }

    public String getFileName(int index){


        try {

            //连接数据库再操作
            conn = DriverManager.getConnection(url, user, password);
            String selectsql="select path from tb_Path where id = ?";
            ps=conn.prepareStatement(selectsql);
            ps.setInt(1,index);
            resultSet = ps.executeQuery();

            while(resultSet.next()){
                str = resultSet.getString("path");
            }
            conn.close();
            index = str.lastIndexOf("\\");
            filename = str.substring(index+1);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return filename;
    }

    public void outputfile(int index,String outputpath){
        testFileChooserSelectPath  t=new  testFileChooserSelectPath ();
        byte[] target = t.selectByte(index);
        String filename = t.getFileName(index);
        ByteToFileUtil.getFile(target, ""+outputpath,""+filename);
    }


//    public static void main(String[] args) {
//        testFileChooserSelectPath  t=new  testFileChooserSelectPath ();
//
//        //t.InsertIntoDB(12);
//        //t.deletefromDB(4);
//        //设定文件导出的路径
//        String outputpath = "D:\\学习\\软件工程课程设计相关文件";
//        t.outputfile(1,outputpath);
//    }
}

