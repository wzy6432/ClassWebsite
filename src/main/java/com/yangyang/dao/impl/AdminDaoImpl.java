package com.yangyang.dao.impl;

import com.yangyang.dao.AdminDao;
import com.yangyang.pojo.AdminDO;
import com.yangyang.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {
    @Override
    public AdminDO validateLogin(String useName) {
        Connection conn = DBUtil.getConn();
        if(conn==null){
            return null;
        }
        PreparedStatement ps=null;
        ResultSet rs=null;
        StringBuilder sb=new StringBuilder();
        sb.append("select * from admin where userName=?");
        try {
            ps=conn.prepareStatement(sb.toString());
            ps.setObject(1,useName);
            System.out.println("validateLogin执行的sql："+ps.toString());
            rs=ps.executeQuery();
            if(rs.next()){
                long id = rs.getLong("id");
                String password = rs.getString("password");
                AdminDO adminDO=new AdminDO();
                adminDO.setId(id);
                adminDO.setPassword(password);
                adminDO.setUserName(useName);
                return adminDO;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePs(ps);
            DBUtil.closeConn(conn);
        }
        return null;
    }
}
