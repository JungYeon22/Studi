package manager.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import manager.bean.ManagerDTO;

@Repository
@Transactional
public class ManagerDAOMyBatis implements ManagerDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public int getToTalMember(String hiredate) {

        return sqlSession.selectOne("managerSQL.getToTalMember", hiredate);
    }

    @Override
    public int getWeekMember(String hiredate) {

        return sqlSession.selectOne("managerSQL.getWeekMember", hiredate);
    }

    @Override
    public List<Map<String, Object>> getTodayMember(String hiredate) {
        return sqlSession.selectList("managerSQL.getTodayMember", hiredate);
    }

}
