package socialLogin.service;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import socialLogin.bean.NaverLoginDTO;
import socialLogin.dao.SocialLoginRepo;
import user.bean.UserDTO;
import user.bean.UserIntro;
import user.dao.UserDao;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

@Service
public class NaverLoginService {
    @Autowired
    private SocialLoginRepo socialLoginDAO;
    @Autowired
    private UserDao userDao;
    public final static String CLIENT_ID = "VBE7cII0y9YD9bpkACFu";
    public final static String CLIENT_SECRET = "i_i_9KVyxJ";
    public final static String SESSION_STATE = "state";
    public final static String REDIRECT_URI = "http://studi-6th.duckdns.org:8090/user/oauth2/login";
    public final static String REDIRECT_LOGOUT_URI = "http://studi-6th.duckdns.org:8090/user/oauth2/logout";
    public final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";


    public String getAuthorizationUrl(HttpSession session) {
        // 보안때문에 난수를 생성
        String state = generateRandomString();
        session.setAttribute(SESSION_STATE, state);

        String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code" +
                "&client_id=" + CLIENT_ID +
                "&redirect_uri=" + REDIRECT_URI +
                "&state=" + state;

        return url;
    }

    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        String sessionState = (String) session.getAttribute(SESSION_STATE);

        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oAuthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            OAuth2AccessToken accessToken = oAuthService.getAccessToken(code);

            return accessToken;
        }

        return null;
    }

    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .build(NaverLoginApi.instance());

        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();

        return response.getBody();  //응답 : 사용자의 정보들
    }

    public String checkUserAndSave(NaverLoginDTO user) {
        UserDTO userDTO = socialLoginDAO.isExistSocialLogin(user);
        if(userDTO == null){
            socialLoginDAO.saveSocialLogin(user);
            UserIntro userIntro = new UserIntro();
            userIntro.setUserId(user.getUserId());
            userDao.writeIntroduce(userIntro);
            return "save";
        }
        else {
            return "login";
        }
    }
}
