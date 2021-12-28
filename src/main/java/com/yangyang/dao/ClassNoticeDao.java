package com.yangyang.dao;
import com.yangyang.pojo.ClassNoticeDo;
public interface ClassNoticeDao {
    /*** 
     * 根据班级名称查询相应班级的公告
     * 
 * @param classId
     * @return ClassNoticeDo
     * @author: YangYang
     */
    public ClassNoticeDo queryClassNoticeByClassId(String classId);
    /***
     * 发布公告
     *
 * @param ClassNoticeDo
     * @return
     * @author: YangYang
     */
    public int sendClassNotice(ClassNoticeDo ClassNoticeDo);
}












