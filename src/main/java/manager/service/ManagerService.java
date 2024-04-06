package manager.service;

import java.util.List;
import java.util.Map;
public interface ManagerService {

    public int getToTalMember(String hiredate);
    public int getWeekMember(String hiredate);
    public List<Map<String, Object>> getTodayMember(String hiredate);
}
