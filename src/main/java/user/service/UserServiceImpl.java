package user.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import user.bean.UserDTO;
import user.bean.UserIntro;
import user.dao.UserDAOImpl;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDAOImpl userDAO;

    public int save(UserDTO userDTO) {
        return userDAO.save(userDTO);

    }
    public UserDTO login(UserDTO userDTO) {

        return userDAO.login(userDTO);
    }

    public boolean checkUserId(String userId) {
        UserDTO user = userDAO.findByUserId(userId);
        return user != null;
    }

    @Override
    public boolean loginAndSetSession(UserDTO userDTO, HttpSession session) {
        UserDTO loginResult = userDAO.login(userDTO);
        if (loginResult != null) {
            session.setAttribute("userDTO", loginResult);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public UserIntro getIntro(String userId) {
        return userDAO.getIntro(userId);
    }

    @Override
    public void writeIntroduce(UserIntro userIntro) {
        userDAO.writeIntroduce(userIntro);
    }

    @Override
    public void delete(String userId) {
        userDAO.delete(userId);
    }


}
