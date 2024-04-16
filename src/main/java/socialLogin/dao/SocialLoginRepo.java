package socialLogin.dao;

import org.apache.ibatis.annotations.Mapper;
import socialLogin.bean.NaverLoginDTO;
import user.bean.UserDTO;
@Mapper
public interface SocialLoginRepo {
    UserDTO isExistSocialLogin(NaverLoginDTO user);

    void saveSocialLogin(NaverLoginDTO user);
}
