package user.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import user.bean.UserDTO;
import user.bean.UserIntro;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDao {

    private final SqlSessionTemplate sql;

    public int save(UserDTO userDTO) {
        return sql.insert("USER.save", userDTO);
    }

    public UserDTO login(UserDTO userDTO) {
        return sql.selectOne("USER.login", userDTO);
    }

    public UserDTO findByUserId(String userId) {
        return sql.selectOne("USER.findByUserId", userId);
    }

    @Override
    public UserDTO findByEmail(String email) {
        return sql.selectOne("USER.findByEmail", email);
    }

    public UserIntro getIntro(String userId) {
        return sql.selectOne("USER.getIntro", userId);
    }

    public void writeIntroduce(UserIntro userIntro) {
        sql.insert("USER.writeIntroduce", userIntro);
    }

    public void delete(String userId) {
        sql.delete("USER.delete", userId);
    }

    public void update(UserIntro userIntro) {
        sql.update("USER.update", userIntro);
    }
    @Override
    public boolean isEmailExist(String email) {
        Integer count = sql.selectOne("USER.countByEmail", email);
        return count != null && count > 0;
    }

}
