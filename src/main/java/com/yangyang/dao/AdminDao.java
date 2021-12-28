package com.yangyang.dao;

import com.yangyang.pojo.AdminDO;

public interface AdminDao {
    AdminDO validateLogin(String useName);
}
