package user.dao;

import manager.bean.ManagerUserBan;
import org.springframework.ui.Model;
import user.bean.UserDTO;
import user.bean.UserIntro;

import java.util.List;
import java.util.Map;

public interface UserDao {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    UserDTO findByUserId(String userId);

    UserDTO findByEmail(String email);

    UserIntro getIntro(String userId);
    void writeIntroduce(UserIntro userIntro);
    void delete(String userId);
    void update(UserIntro userIntro);
    boolean isEmailExist(String email);

    public UserIntro showProfile(String userid);

    public String userIconChange(Map<String, String> map);

    public String userIconCheck(String userid);

    ManagerUserBan findByUserId2(Model model);

    List<Map<String, Object>> scrap(String userId);

    List<Map<String, Object>> whrite(String userId);
}
