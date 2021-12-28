package com.yangyang.service;
import com.yangyang.dao.ClassNoticeDao;
import com.yangyang.pojo.ClassNoticeDo;
public interface ClasssNoticeService {
    public ClassNoticeDo queryClassNoticeByClassId(String classId);
    public int sendClassNotice(ClassNoticeDo ClassNoticeDo);
}
