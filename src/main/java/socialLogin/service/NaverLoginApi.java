package socialLogin.service;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {

    protected NaverLoginApi() {
    }

    private static class NaverLoginApiInstance{
        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
    }
    public static NaverLoginApi instance(){
        return NaverLoginApiInstance.INSTANCE;
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize";
    }
}
