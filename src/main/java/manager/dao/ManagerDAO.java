package manager.dao;

import manager.bean.ManagerDTO;
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

    List<Map<String, Object>> pichart1();

    List<Map<String, Object>> pichart2();
}
