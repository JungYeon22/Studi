package socialLogin.controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonParser;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import socialLogin.bean.NaverLoginDTO;
import socialLogin.service.NaverLoginService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
@RequestMapping(value = "/user")
public class NaverLoginController {
    @Autowired
    private NaverLoginService naverLoginService;

    @GetMapping("naverLogin")
    @ResponseBody
    public String naverLogin(HttpSession session){
        String url = naverLoginService.getAuthorizationUrl(session);
        System.out.println(url);
        return url;
    }
    @GetMapping("/oauth2/login")
    public String Oauth2Login(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws IOException, JsonParseException {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginService.getAccessToken(session, code, state);
        System.out.println(oauthToken);
//        String[] imsi = oauthToken.toString().substring(31).split(",");
//        String accessToken = imsi[0];

        /*네이버 프로필 정보 가져오기*/
        /* 응답 받은 response body의 json정보 추출*/
        /* 해당 유저의 고유 id, 이름이 암호화 되서 나옴*/
        String result = naverLoginService.getUserProfile(oauthToken);
        System.out.println(result);
        Object obj = null;
        JsonParser parser = new JsonParser();

        try {
            obj = parser.parse(result);
        } catch (JsonParseException e) {
            e.printStackTrace();
        }

        JsonObject jobj = (JsonObject) obj;
        JsonObject res_obj = (JsonObject) jobj.get("response");
        System.out.println(res_obj);

        NaverLoginDTO user = new NaverLoginDTO();
        String userId = res_obj.get("email").toString().split("@")[0];

        user.setUserId(userId.replaceAll("\"", ""));
        user.setEmail( res_obj.get("email").toString().replaceAll("\"", ""));
        user.setName(res_obj.get("name").toString().replaceAll("\"", ""));
        user.setAge(res_obj.get("age").toString().replaceAll("\"", ""));
        user.setMobile(res_obj.get("mobile").toString().replaceAll("\"", ""));
        user.setLoginType("naver");

        naverLoginService.checkUserAndSave(user);

        String access_token = oauthToken.getAccessToken();
        String str_result = access_token.replaceAll("\\\"","");
        user.setAccessToken(str_result);

        session.setAttribute("userDTO", user);

        return "redirect:/";
    }

    @GetMapping("/remove") //token = access_token임
    public String remove(@RequestParam String token, HttpSession session, HttpServletRequest request, Model model ) {
        String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+naverLoginService.CLIENT_ID+
                "&client_secret="+naverLoginService.CLIENT_SECRET+"&access_token="+token+"&service_provider=NAVER";

        try {
            String res = requestToServer(apiUrl, null);
            model.addAttribute("res", res); //결과값 확인해 보는 용도
            session.invalidate();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/";
    }
    private String requestToServer(String apiURL, String headerStr) throws IOException {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        System.out.println("header Str: " + headerStr);
        if(headerStr != null && !headerStr.equals("") ) {
            con.setRequestProperty("Authorization", headerStr);
        }
        int responseCode = con.getResponseCode();
        BufferedReader br;
        System.out.println("responseCode="+responseCode);
        if(responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer res = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            res.append(inputLine);
        }
        br.close();
        if(responseCode==200) {
            String new_res=res.toString().replaceAll("&#39;", "");
            return new_res;
        } else {
            return null;
        }
    }


}
