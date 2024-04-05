package user.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import user.bean.UserDTO;
import user.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

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
                        HttpSession session) {
        UserDTO loginResult = userService.login(userDTO);
        if (loginResult != null) {
            session.setAttribute("userDTO", loginResult);
            return "redirect:/";
        } else {
            return "user/loginForm";
        }
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

}