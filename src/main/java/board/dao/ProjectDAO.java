package board.dao;

import org.apache.ibatis.annotations.Mapper;
import user.bean.UserDTO;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProjectDAO {

    void application(Map<String, String> map);

    void approve(Map<String, Object> map);

    void cancel(Map<String, Object> map);

    List<UserDTO> applicationList(String boardId);
}
