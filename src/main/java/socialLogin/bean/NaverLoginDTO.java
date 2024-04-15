package socialLogin.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class NaverLoginDTO {
	private String userId;

    private String email;

    private String nickname;

    private String profileImage;

    private String age;

    private String gender;

    private String name;

    private String resultCode;

    private String resultStr;

    private String accessToken;

    private String refreshToken;

    private String tokenType;

    private String expiresIn;

    private String loginType;
}
