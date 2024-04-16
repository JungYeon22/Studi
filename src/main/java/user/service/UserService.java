package user.service;

import org.springframework.ui.Model;
import user.bean.UserDTO;
import user.bean.UserIntro;

import javax.servlet.http.HttpSession;

public interface UserService {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    boolean checkUserId(String userId);
    boolean loginAndSetSession(UserDTO userDTO, HttpSession session);
//    UserIntro getIntro(String userId);
    void writeIntroduce(UserIntro userIntro);
    void delete(String userId);

//    void update(Model model);
}
