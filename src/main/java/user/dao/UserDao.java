package user.dao;

import user.bean.UserDTO;
import user.bean.UserIntro;

public interface UserDao {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    UserDTO findByUserId(String userId);

    UserDTO findByEmail(String email);

    UserIntro getIntro(String userId);
    void writeIntroduce(UserIntro userIntro);
    void delete(String userId);
}
