package com.yangyang.service.impl;


import com.yangyang.dao.AdminDao;
import com.yangyang.dao.impl.AdminDaoImpl;
import com.yangyang.pojo.AdminDO;
import com.yangyang.service.AdminService;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao=new AdminDaoImpl();

    @Override
    public AdminDO validateLogin(String useName) {
        return adminDao.validateLogin(useName);
    }
}
