package com.yangyang.service;

import com.yangyang.pojo.Student;

public interface UserService {
    /**
     * 注册用户
     * @param student
     * @return void
     * @author: YangYang
     */
    public void register(Student student);

    /**
     *
     * 登录
     * @param student
     * @return com.yangyang.pojo.Student
     * @author: YangYang
     */
    public Student login(Student student);

    /**
     *
     * 检查用户名是否可用
     * @param studentId
     * @return boolean 返回true表示用户名已存在，返回false表示用户名可用
     * @author: YangYang
     */
    public boolean existsstudentId(String studentId);


}