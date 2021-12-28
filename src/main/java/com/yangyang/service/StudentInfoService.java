package com.yangyang.service;

import com.yangyang.pojo.studentinfo;
/*** 
 *  查询学生信息
 * 
 * @param
 * @return  
 * @author: YangYang
 */
public interface StudentInfoService {
    public studentinfo queryStudentInfoByStudentId(String studentId);
    public int updateStudentInfo(studentinfo studentinfo);
}

