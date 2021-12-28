package com.yangyang.service.impl;
import com.yangyang.dao.ClassNoticeDao;
import com.yangyang.dao.impl.ClassNoticeDaoImpl;
import com.yangyang.pojo.ClassNoticeDo;
import com.yangyang.service.ClasssNoticeService;

public class ClassNoticeServiceImpl implements ClasssNoticeService {
    ClassNoticeDao classNoticeDao=new ClassNoticeDaoImpl();
    @Override
    public ClassNoticeDo queryClassNoticeByClassId(String classId) {
        return classNoticeDao.queryClassNoticeByClassId(classId);
    }
    /***
     *
     *
     * @param ClassNoticeDo
     * @return int  返回的是影响的行数，用于后台验证是否插入记录成功
     * @author: YangYang
     */
    @Override
    public int sendClassNotice(ClassNoticeDo ClassNoticeDo) {
        return classNoticeDao.sendClassNotice(ClassNoticeDo);
    }
}







