package project.service;

import board.bean.BoardDTO;
import user.bean.UserDTO;
import user.bean.UserIntro;

import java.util.List;
import java.util.Map;

public interface ProjectService {
    void application(Map<String, String> map);

    void approve(Map<String, Object> map);

    List<UserDTO> applicationList(String boardId);

    List<BoardDTO> getMyProjectList(String userId);

    List<UserIntro> getProjectMember(String boardId);

}
