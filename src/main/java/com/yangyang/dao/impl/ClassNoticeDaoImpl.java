package com.yangyang.dao.impl;
import com.yangyang.pojo.ClassNoticeDo;
import com.yangyang.dao.ClassNoticeDao;
public class ClassNoticeDaoImpl extends BaseDao implements ClassNoticeDao{
    /*** 
     * 覆盖接口中的方法，即查询班级公告 
     *
     * @param classId
     * @return ClassNoticeDo
     * @author: YangYang
     */
    @Override
    public ClassNoticeDo queryClassNoticeByClassId(String classId) {
        String sql="select * from classnotice where classId=?";
        return queryForOne(ClassNoticeDo.class,sql,classId);
    }
    /*** 
     * 更新公告
     * 
 * @param ClassNoticeDo 
     * @return int 
     * @author: YangYang
     */
    @Override
    public int sendClassNotice(ClassNoticeDo ClassNoticeDo) {
        String sql="insert into classnotice(`classId`,`notice`) values(?,?)";
        return update(sql,ClassNoticeDo.getClassId(),ClassNoticeDo.getNotice());
    }

   
}








