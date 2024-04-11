package user.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import user.bean.UserDTO;
import user.service.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class UserController {

    private final UserServiceImpl userService;

    @GetMapping("/writeForm")
    public String writeForm() {
        return "user/writeForm";
    }

    @PostMapping("/writeForm")
    public String save(@ModelAttribute UserDTO userDTO) {
        int saveResult = userService.save(userDTO);
        if (saveResult > 0) {
            return "user/loginForm";
        } else {
            return "user/writeForm";
        }
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    @PostMapping("/loginForm")
    public String login(@ModelAttribute UserDTO userDTO,
                        HttpSession session,
                        Model model) {
        boolean loginResult = userService.loginAndSetSession(userDTO, session);
        if (loginResult) {
            return "redirect:/";
        } else {
            model.addAttribute("loginError", "계정 이름 또는 암호가 잘못되었습니다.");
            return "user/loginForm";
        }
    }

    @GetMapping(value = "/logout")
    public String logoutMainGET(HttpServletRequest request) {
        HttpSession session = request.getSession();

        session.invalidate();

        return "redirect:/";
    }

    @PostMapping("/checkUserId")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkUserId(@RequestBody Map<String, String> json) {
        boolean isDuplicate;
        String userId = json.get("userId");
        if (userId.isEmpty()) {
            isDuplicate = true;
        } else {
            isDuplicate = userService.checkUserId(userId);
        }
        return ResponseEntity.ok(Collections.singletonMap("isDuplicate", isDuplicate));
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