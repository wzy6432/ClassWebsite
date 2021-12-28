package com.yangyang.dao.impl;

import com.yangyang.pojo.StudentDO;
import com.yangyang.pojo.StudentRequest;
import com.yangyang.pojo.TableResult;
import com.yangyang.pojo.StudentVO;
import com.yangyang.dao.StudentDao;
import com.yangyang.utils.DBUtil;
import com.yangyang.utils.StringUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDaoImpl implements StudentDao {

    @Override
    public int addStudent(StudentDO studentDO) {
        Connection conn = DBUtil.getConn();
        if(conn==null){
            return 0;
        }
        PreparedStatement ps=null;
        StringBuilder sb=new StringBuilder();
        sb.append("insert into student1(id,name,chinese,math,english,score)");
        sb.append(" values(?,?,?,?,?,?)");
        try {
            ps=conn.prepareStatement(sb.toString());
            ps.setObject(1,studentDO.getId());
            ps.setObject(2,studentDO.getName());
            ps.setObject(3,studentDO.getChinese());
            ps.setObject(4,studentDO.getMath());
            ps.setObject(5,studentDO.getEnglish());
            ps.setObject(6,studentDO.getScore());
            System.out.println("addStudent执行的sql："+ps.toString());
            return ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.closePs(ps);
            DBUtil.closeConn(conn);
        }
        return 0;
    }

    @Override
    public TableResult<StudentVO> queryStudentByPage(StudentRequest studentRequest) {
        TableResult<StudentVO> tableResult=new TableResult<>();
            Connection conn = DBUtil.getConn();
            if(conn==null){
                return null;
            }
            PreparedStatement ps=null;
            ResultSet rs=null;
            //查询学生列表
            StringBuilder sb=new StringBuilder();
            sb.append("select * from student1 ");
            appendWhere(studentRequest,sb);
            sb.append(" order by id desc limit ").append(studentRequest.getStart())
                    .append(",").append(studentRequest.getPageSize());
            try {
                ps=conn.prepareStatement(sb.toString());
                if(StringUtil.isNotBlank(studentRequest.getName())){
                    ps.setObject(1,studentRequest.getName());
                }

                System.out.println("queryStudentByPage查询学生信息执行的sql："+ps.toString());
                rs=ps.executeQuery();
                List<StudentVO> list=new ArrayList<>();
                while (rs.next()){
                    StudentVO studentVO=buildStudent(rs);
                    list.add(studentVO);
                }
                tableResult.setData(list);//设置数据
                //查询总条数
                sb.setLength(0);
                sb.append("select count(*) from student1");
                appendWhere(studentRequest,sb);
                ps=conn.prepareStatement(sb.toString());
                if(StringUtil.isNotBlank(studentRequest.getName())){
                    ps.setObject(1,studentRequest.getName());
                }
                System.out.println("queryStudentByPage查询学生总条数的sql："+ps.toString());
                rs=ps.executeQuery();
                if(rs.next()){
                    int totalCount=rs.getInt(1);
                    tableResult.setTotalCount(totalCount);
                }
                return tableResult;

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                DBUtil.closeResultSet(rs);
                DBUtil.closePs(ps);
                DBUtil.closeConn(conn);
            }
            return null;
        }

    @Override
    public StudentVO getStudentById(String studentId) {
        Connection conn = DBUtil.getConn();
        if(conn==null){
            return null;
        }
        PreparedStatement ps=null;
        ResultSet rs=null;
        StringBuilder sb=new StringBuilder();
        sb.append("select * from student1 where id=?");
        try {
            ps=conn.prepareStatement(sb.toString());
            ps.setObject(1,studentId);
            System.out.println("getStudentById："+ps.toString());
            rs=ps.executeQuery();
            if(rs.next()){
                return buildStudent(rs);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePs(ps);
            DBUtil.closeConn(conn);
        }
        return null;
    }

    @Override
    public int updateStudent(StudentDO studentDO) {
            Connection conn = DBUtil.getConn();
            if(conn==null){
                return 0;
            }
            PreparedStatement ps=null;
            StringBuilder sb=new StringBuilder();
            sb.append("update student1 set id=?,name=?,chinese=?,math=?,english=?,score=?");
            sb.append(" where id=? ");
            try {
                ps=conn.prepareStatement(sb.toString());
                ps.setObject(1,studentDO.getId());
                ps.setObject(2,studentDO.getName());
                ps.setObject(3,studentDO.getChinese());
                ps.setObject(4,studentDO.getMath());
                ps.setObject(5,studentDO.getEnglish());
                ps.setObject(6,studentDO.getScore());
                ps.setObject(7,studentDO.getId());
                System.out.println("updateStudent执行的sql："+ps.toString());
                return ps.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                DBUtil.closePs(ps);
                DBUtil.closeConn(conn);
            }
            return 0;
        }

    @Override
    public int deleteStudentById(String studentId) {
        Connection conn = DBUtil.getConn();
        if(conn==null){
            return 0;
        }
        PreparedStatement ps=null;
        StringBuilder sb=new StringBuilder();
        sb.append("delete from student1  where id=? ");
        try {
            ps=conn.prepareStatement(sb.toString());
            ps.setObject(1,studentId);
            System.out.println("deleteStudentById："+ps.toString());
            return ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.closePs(ps);
            DBUtil.closeConn(conn);
        }
        return 0;
    }

    private StudentVO buildStudent(ResultSet rs) throws SQLException{
        String id=rs.getString("id");
        String name = rs.getString("name");
        String chinese = rs.getString("chinese");
        String math = rs.getString("math");
        String english = rs.getString("english");
        String score = rs.getString("score");
        StudentVO studentVO= new StudentVO();
        studentVO.setId(id);
        studentVO.setName(name);
        studentVO.setChinese(chinese);
        studentVO.setMath(math);
        studentVO.setEnglish(english);
        studentVO.setScore(score);
        return studentVO;
    }



    private void appendWhere(StudentRequest studentRequest, StringBuilder sb) {
        String name =studentRequest.getName();
        System.out.println(name);
        if(StringUtil.isNotBlank(name)){

            sb.append(" where name = ? ");
        }
    }
}

