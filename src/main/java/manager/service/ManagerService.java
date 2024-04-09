package manager.service;



import java.util.List;
import java.util.Map;

public interface ManagerService {
    public List<Map<String, Object>> getTodayMember();
    public List<Map<String, Object>> boardUpload();

    public Map<String, Object> getUserList(String pg);
}
