package manager.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import manager.bean.ManagerDTO;

@Repository
@Transactional
public class ManagerDAOMyBatis implements ManagerDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public void getToTalMember(String hiredate) {
        sqlSession.insert("managerSQL.getToTalMember", hiredate);
    }

    @Override
    public void getWeekMember(String hiredate) {
        sqlSession.insert("managerSQL.getWeekMember", hiredate);
    }

    @Override
    public void getTodayMember(String hiredate) {
        sqlSession.insert("managerSQL.getTodayMember", hiredate);
    }
}
