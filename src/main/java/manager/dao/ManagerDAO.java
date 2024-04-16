package manager.dao;

import manager.bean.ManagerDTO;
import manager.bean.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ManagerDAO {
    public List<Map<String, Object>> getTodayMember();
    public List<Map<String, Object>> boardUpload();

    public List<ManagerDTO> getUserList(int startNum);
    public int getTotalA();

    public int getTotalA2(Map<String, Object> map);

    public List<ManagerDTO> getUserList2(Map<String, Object> map);

    void registerNotice(Map<String, String> map);

    List<NoticeDTO> getNotice();

    void notiDelete(int id);
}
