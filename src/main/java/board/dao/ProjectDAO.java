package board.dao;

import board.bean.BoardDTO;
import org.apache.ibatis.annotations.Mapper;
import user.bean.UserDTO;
import user.bean.UserIntro;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProjectDAO {

    void application(Map<String, String> map);

    void approve(Map<String, Object> map);

    void cancel(Map<String, Object> map);

    List<UserDTO> applicationList(String boardId);

    void applicationDelete(Map<String, Object> map);

    List<BoardDTO> getMyProjectList(String userId);

    List<UserIntro> getProjectMember(String boardId);
}
