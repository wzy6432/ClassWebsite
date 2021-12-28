package com.yangyang.dao.impl;

import com.yangyang.dao.StudentInfoDao;
import com.yangyang.pojo.Student;
import com.yangyang.pojo.studentinfo;

public class StudentInfoDaoImpl extends BaseDao implements StudentInfoDao {
    /*** 
     * 实现StudentInfoDao接口，写sql语句
     * 
 * @param studentId 
     * @return com.yangyang.pojo.studentinfo 
     * @author: YangYang
     */
    @Override
    public studentinfo queryStudentInfoByStudentId(String studentId) {
        String sql="select * from studentinfo where studentId =?";
        return queryForOne(studentinfo.class,sql,studentId);
    }

    @Override
    public int saveStudentInfo(studentinfo studentinfo) {
        String sql="insert into studentinfo(`studentId` ,`studentName`,`classId`,`college`,`studentType`,`experience`,`hobby1`,`hobby2`,`hobby3`) values(?,?,?,?,?,?,?,?,?)";
        return update(sql,studentinfo.getStudentId(),studentinfo.getStudentName(),studentinfo.getClassId(),studentinfo.getCollege(),studentinfo.getStudentType(),studentinfo.getExperience(),studentinfo.getHobby1(),studentinfo.getHobby2(),studentinfo.getHobby3());
    }
}
