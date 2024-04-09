package user.service;

import user.bean.UserDTO;

import javax.servlet.http.HttpSession;

public interface UserService {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    boolean checkUserId(String userId);

    boolean loginAndSetSession(UserDTO userDTO, HttpSession session);
}
