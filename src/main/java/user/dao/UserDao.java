package user.dao;

import user.bean.UserDTO;

public interface UserDao {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    UserDTO findByUserId(String userId);
}
