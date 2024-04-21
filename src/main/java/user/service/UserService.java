package user.service;

import org.springframework.ui.Model;
import user.bean.UserDTO;
import user.bean.UserIntro;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface UserService {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    boolean checkUserId(String userId);
    boolean loginAndSetSession(UserDTO userDTO, HttpSession session);
    UserIntro getIntro(String userId);
    void writeIntroduce(UserIntro userIntro);
    void delete(String userId);
    UserDTO findByEmail(String email);
    boolean isEmailDuplicate(String email);
    void update(UserIntro userIntro);

    public UserIntro showProfile(String userid);

    public String userIconChange(String userid, String fileName);

    public String userIconCheck(String userid);

    boolean checkUserId2(Model model);

    List<Map<String, Object>> scrap(String userId);

    List<Map<String, Object>> whrite(String userId);
}
