package manager.service;


import manager.bean.NoticeDTO;
import org.springframework.ui.Model;

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

    Map<String, Object> report();

    Map<String, Object> reportSelect(String reportNum);

    void reportStatus(Map<String,String> map);

    void reportUser(Map<String, String> map);

    void userBan(Map<String, String> map);
}
