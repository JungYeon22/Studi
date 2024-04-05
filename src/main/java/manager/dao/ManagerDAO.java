package manager.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerDAO {
    void getToTalMember(String hiredate);
    void getWeekMember(String hiredate);
    void getTodayMember(String hiredate);
}
