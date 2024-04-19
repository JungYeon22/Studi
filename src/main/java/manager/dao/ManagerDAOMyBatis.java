package manager.dao;

import manager.bean.ManagerReport;
import manager.bean.NoticeDTO;
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

        return sqlSession.selectList("manager.getUserList2", map);
    }

    @Override
    public List<Map<String, Object>> pichart1() {
        return sqlSession.selectList("manager.pichart1");
    }

    @Override
    public List<Map<String, Object>> pichart2() {
        return sqlSession.selectList("manager.pichart2");
    }

    @Override
    public void registerNotice(Map<String, String> map) {

    }

    @Override
    public List<NoticeDTO> getNotice() {
        return null;
    }

    @Override
    public void notiDelete(int id) {

    }

    @Override
    public List<ManagerReport> getReport() {
        return sqlSession.selectList("manager.getReport");
    }

    @Override
    public List<ManagerReport> reportSelect(int reportNum) {
        return sqlSession.selectOne("manager.reportSelect",reportNum);
    }

    @Override
    public void reportStatus(Map<String,String> map) {

    }
    public void reportUser(Map<String,String> map) {
        if (Integer.parseInt(map.get("status")) >= 3 && Integer.parseInt(map.get("status")) < 7){
            sqlSession.update("manager.reportUser",map);
        }
        else if(Integer.parseInt(map.get("status")) == 7){
            sqlSession.delete("manager.reportUserDel",map);
        }
    }

    @Override
    public void userBan(Map<String, String> map) {

    }

    @Override
    public void userBanInsert(Map<String, String> map) {

    }
}