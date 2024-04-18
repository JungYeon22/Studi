package board.service;

import user.bean.UserDTO;

import java.util.List;
import java.util.Map;

public interface ProjectService {
    void application(Map<String, String> map);

    void approve(Map<String, Object> map);

    List<UserDTO> applicationList(String boardId);
}
