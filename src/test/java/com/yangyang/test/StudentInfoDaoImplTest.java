package com.yangyang.test;

import com.yangyang.dao.StudentInfoDao;
import com.yangyang.dao.impl.StudentInfoDaoImpl;
import com.yangyang.pojo.studentinfo;
import org.junit.Test;

import static org.junit.Assert.*;

public class StudentInfoDaoImplTest {
    StudentInfoDao studentInfoDao=new StudentInfoDaoImpl();
    @Test
    public void queryStudentInfoByStudentId() {
        if(studentInfoDao.queryStudentInfoByStudentId("20190412310044")==null){
            System.out.println("查询不到个人信息");
        }else{
            System.out.println("查询到用户信息");
        }
    }
    @Test
    public void savestudentInfo(){
        System.out.println(studentInfoDao.saveStudentInfo(new studentinfo("20190412310006","张三","19软工4班","计算机科学与技术学院","本科生","在测试UserImplDao时，发现除了更新用户，其他两个查询都出错，原因是Student类中没有写无参的构造函数\n" +
                "2.构造方法快捷键：alt+insert","C++","JAVA","Python")));
    }
}