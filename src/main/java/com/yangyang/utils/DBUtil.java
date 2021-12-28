package com.yangyang.utils;

import java.sql.*;

public class DBUtil {
    private static final String URL="jdbc:mysql://localhost:3306/design?serverTimezone=GMT%2B8&useUnicode=true";
    private static final String DRIVER="com.mysql.jdbc.Driver";
    private static final String USER_NAME="root";
    private static final String PWD="2499069236";

    //加载驱动 jdbc4.0
    static{
        try {
            Class.forName(DRIVER);//加载数据库驱动
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConn(){
        Connection conn = null;
        try {
           return DriverManager.getConnection(URL,USER_NAME,PWD);//连接数据库
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return conn;
    }

    public static void closeResultSet(ResultSet resultSet){
        try {
            if (resultSet!=null){
                resultSet.close();
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static void closePs(PreparedStatement ps){
        try {
            if (ps!=null){
                ps.close();
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static void closeConn(Connection conn){
        try {
            if (conn!=null){
                conn.close();
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static void main(String args[]){
        System.out.println(DBUtil.getConn());
    }
}
