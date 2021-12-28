package com.yangyang.test;

import com.yangyang.dao.ClassNoticeDao;
import com.yangyang.dao.impl.ClassNoticeDaoImpl;
import com.yangyang.pojo.ClassNoticeDo;
import org.junit.Test;

import static org.junit.Assert.*;

public class ClassNoticeServiceImplTest {
    ClassNoticeDao classNoticeDao=new ClassNoticeDaoImpl();

    @Test
    public void queryClassNoticeByClassId() {
        if(classNoticeDao.queryClassNoticeByClassId("19计科4班")==null){
            System.out.println("查询不到班级公告");

        }  else {
            System.out.println("查询到班级公告");
        }
    }

    @Test
    public void sendClassNotice() {
        ClassNoticeDo csClass4=new ClassNoticeDo();
        csClass4.setClassId("提交班费");
        csClass4.setNotice("请大家在本周五之前提交班费给班长");
        if(classNoticeDao.sendClassNotice(csClass4)==0){
            System.out.println("公告发布失败");
        }else{
            System.out.println("公告发布成功");
        }
    }
}