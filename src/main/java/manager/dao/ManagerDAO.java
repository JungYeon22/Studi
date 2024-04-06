package manager.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ManagerDAO {
    public int getToTalMember(String hiredate);
    public int getWeekMember(String hiredate);
    public List<Map<String, Object>> getTodayMember(String hiredate);
}
