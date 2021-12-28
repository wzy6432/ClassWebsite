package com.yangyang.dao;

import com.yangyang.pojo.Student;

public interface UserDao {



    /**
     * 根据用户名查询用户信息
     * @param studentId 用户名
     * @return 如果返回null,说明没有这个用户。
     */
    public Student queryStudentByStudentId(String studentId);

    /**
     * 根据 用户名和密码查询用户信息
     * @param studentId
     * @param password
     * @return 如果返回null,说明用户名或密码错误
     */
    public Student queryUserByStudentIdAndPassword(String studentId,String password);

    /**
     * 保存用户信息
     * @param student
     * @return 返回-1表示操作失败，其他是sql语句影响的行数
     */
    public int saveStudent(Student student);



}
