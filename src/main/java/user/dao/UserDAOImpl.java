package user.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import user.bean.UserDTO;

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

}
