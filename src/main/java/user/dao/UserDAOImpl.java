package user.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
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
    public UserIntro getIntro(String userId) {
        return sql.selectOne("USER.getIntro", userId);
    }

    @Override
    public void writeIntroduce(UserIntro userIntro) { sql.insert("userSQL.writeIntroduce", userIntro); }
    @Override
    public void delete(String userId) {
        sql.delete("userSQL.delete", userId);
    }


}
