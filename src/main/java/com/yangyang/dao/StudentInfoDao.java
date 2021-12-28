package com.yangyang.dao;

import com.yangyang.pojo.studentinfo;

public interface StudentInfoDao {
    /***
     * 根据studentId查询学生个人信息，用于显示在个人信息页面
     *
     * @param studentId
     * @return studentinfo 学生个人信息
     * @author: YangYang
     */
    public studentinfo queryStudentInfoByStudentId(String studentId);
    /***
     * 修改个人信息，更新个人信息数据库
     *
 * @param studentinfo 学生个人信息
     * @return  studentinfo
     * @author: YangYang
     */
    public int saveStudentInfo(studentinfo studentinfo);
}
