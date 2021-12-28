package com.yangyang.service.impl;

import com.yangyang.dao.StudentInfoDao;
import com.yangyang.dao.impl.StudentInfoDaoImpl;
import com.yangyang.pojo.studentinfo;
import com.yangyang.service.StudentInfoService;

public class StudentInfoServiceImpl implements StudentInfoService {
    StudentInfoDao studentInfoDao=new StudentInfoDaoImpl();
    /***
     * 根据学生id来查找相应的学生信息
     *
 * @param studentId
     * @return com.yangyang.pojo.studentinfo
     * @author: YangYang
     */
    @Override
    public studentinfo queryStudentInfoByStudentId(String studentId) {
        return studentInfoDao.queryStudentInfoByStudentId(studentId);
    }
    /***
     * 保存新的个人信息，
     *
 * @param studentinfo
     * @return int 返回的是影响的行数，如果成功保存，返回值应为1
     * @author: YangYang
     */
    @Override
    public int updateStudentInfo(studentinfo studentinfo) {
        return studentInfoDao.saveStudentInfo(studentinfo);
    }


}
