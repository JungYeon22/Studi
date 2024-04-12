package user.service;

import user.bean.UserDTO;
import user.bean.UserIntro;

import javax.servlet.http.HttpSession;

public interface UserService {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    boolean checkUserId(String userId);

    boolean loginAndSetSession(UserDTO userDTO, HttpSession session);

    UserIntro getIntro(String userId);
    public void writeIntroduce(UserIntro userIntro);
    void delete(String userId);
}
