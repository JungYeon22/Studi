package manager.service;


import java.util.List;
import java.util.Map;

public interface ManagerService {
    public List<Map<String, Object>> getTodayMember();
    public List<Map<String, Object>> boardUpload();
    public Map<String, Object> getUserList(String pg);

    public Map<String, Object> getUserList2(Map<String, Object> map);

    List<Map<String, Object>> pichart1();

    List<Map<String, Object>> pichart2();

    void registerNotice(Map<String, String> map);

    List<NoticeDTO> getNotice();

    void notiDelete(int parseInt);
}
