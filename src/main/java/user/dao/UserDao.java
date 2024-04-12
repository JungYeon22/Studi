package user.dao;

import user.bean.UserDTO;
import user.bean.UserIntro;

public interface UserDao {
    int save(UserDTO userDTO);
    UserDTO login(UserDTO userDTO);
    UserDTO findByUserId(String userId);
    UserIntro getIntro(String userId);

    public void writeIntroduce(UserIntro userIntro);

    public void delete(String id);
}
