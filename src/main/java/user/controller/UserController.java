package user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @GetMapping(value = "/loginForm")
    public String loginForm(){
        return "user/loginForm";
    }

    @GetMapping(value = "/writeForm")
    public String writeForm(){
        return "user/writeForm";
    }


    @GetMapping(value = "/introduceForm")
    public String introduceForm() {
        return "user/introduceForm";
    }

    @GetMapping(value = "/myPage")
    public String myPage(){
        return "user/myPage";
    }

    @GetMapping(value = "/managerPage")
    public String managerPage(){
        return "user/managerPage";
    }
}
