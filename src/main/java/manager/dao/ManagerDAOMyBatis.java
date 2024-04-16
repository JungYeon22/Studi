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
    public List<Map<String, Object>> getTodayMember() {
        return sqlSession.selectList("manager.getTodayMember");
    }

    @Override
    public List<Map<String, Object>> boardUpload() {
        return sqlSession.selectList("manager.boardUpload");
    }

    @Override
    public List<ManagerDTO> getUserList(int startNum) {
        return sqlSession.selectList("manager.getUserList", startNum);
    }

    @Override
    public int getTotalA() {
        int totalA = sqlSession.selectOne("manager.getTotalA");
        return totalA;
    }

    @Override
    public int getTotalA2(Map<String, Object> map) {
        int totalA = sqlSession.selectOne("manager.getTotalA2");
        return totalA;
    }
    @Override
    public List<ManagerDTO> getUserList2(Map<String, Object> map) {
        System.out.println("ㅅㅂ");

        return sqlSession.selectList("manager.getUserList2", map);
    }

}
