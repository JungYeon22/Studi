package user.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import user.bean.UserDTO;
import user.bean.UserIntro;
import user.service.UserServiceImpl;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class UserController {

//    @Autowired
    private final UserServiceImpl userService;
    @Autowired
    private final JavaMailSenderImpl mailSender;

    @GetMapping("/writeForm")
    public String writeForm(Model model) {
        List<String> skillList = Arrays.asList("JAVA", "C", "C++", "C#", "Python", "JavaScript", "Kotlin", "Go", "MySQL", "Oracle");
        model.addAttribute("skillList", skillList);

        return "user/writeForm";
    }

    @PostMapping("/writeForm")
    public String save(@ModelAttribute UserDTO userDTO, Model model,
                       @ModelAttribute UserIntro userIntro) {
        int saveResult = userService.save(userDTO);
//        userService.writeIntroduce(userIntro);
        if (saveResult > 0) {
            model.addAttribute("writeOk", "가입에 성공하였습니다!");
            return "redirect:/";
        } else {
            model.addAttribute("emailExistsError", "이미 존재하는 회원메일입니다.");
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

    //이메일 인증
    @ResponseBody
    @PostMapping("/EmailAuth")
    public String emailAuth(String email) {

//        log.info("전달 받은 이메일 주소 : " + email);
        System.out.println("전달 받은 이메일 주소 : " + email);

        //난수의 범위 111111 ~ 999999 (6자리 난수)
        Random random = new Random();
        int checkNum = random.nextInt(888888)+111111;

        //이메일 보낼 양식
        String setFrom = "chlrytns94@naver.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "인증 코드는 " + checkNum + " 입니다." +
                "<br>" +
                "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

        try {
            MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

            // 메일 내용을 채워줌
            helper.setFrom(setFrom); // 보내는 사람 세팅
            helper.setTo(toMail);  // 받는 사람 세팅
            helper.setSubject(title); // 제목 세팅
            helper.setText(content, true); // 내용 세팅
            // 메일 전송
            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }

//        log.info("랜덤숫자 : " + checkNum);
        System.out.println("랜덤숫자 : " + checkNum);
        return Integer.toString(checkNum);
    }

    @GetMapping(value = "/introduceForm")
    public String introduceForm() {
        return "user/introduceForm";
    }

    @PostMapping(value="/writeForm/introduce")
    public String writeIntroduce(@ModelAttribute UserIntro userIntro,
                                 @RequestParam HashMap<String, Object> skillMap,
                                 @RequestParam String skill) {
        String[] code_array = null;
//        String code = skillMap.get("skill").toString();
        code_array = skill.split(",");
        int[] results= new int[code_array.length];
        int result=1;
        for(int i=0; i < code_array.length; i++){
            if(i == 0) {
                userIntro.setSkill1(code_array[i]);
            } else if(i == 1) {
                userIntro.setSkill2(code_array[i]);
            } else if(i == 2) {
                userIntro.setSkill3(code_array[i]);
                break;
            }
        }
        userService.writeIntroduce(userIntro);
        return "user/introduceForm";
    }

    @GetMapping(value = "/myPage")
    public String myPage(@SessionAttribute("userDTO") UserDTO userDTO,Model model)
    {
        UserIntro userIntro = userService.getIntro(userDTO.getUserId());
        model.addAttribute("userIntro",userIntro);
//        model.addAttribute("userDTO", userDTO);
//        UserIntro userIntro = userService.getIntro(userDTO.getUserId());
//        model.addAttribute("userIntro",userIntro);
        return "user/myPage";
    }

    @GetMapping("/updateForm")
    public String updateForm(Model model) {
        List<String> skillList = Arrays.asList("JAVA", "C", "C++", "C#", "Python", "JavaScript", "Kotlin", "Go", "MySQL", "Oracle");
        model.addAttribute("skillList", skillList);
        return "user/updateForm";
    }
    @PostMapping(value = "/updateForm")
    public String update(@ModelAttribute UserIntro userIntro,
                         @RequestParam HashMap<String, Object> skillMap,
                         @SessionAttribute("userDTO") UserDTO userDTO)
    {
        String[] code_array = null;

        String code = skillMap.get("arrayParam").toString();
        code_array = code.split(",");
        int[] results= new int[code_array.length];
        int result=1;
        for(int i=0; i < code_array.length; i++){
            if(i == 0) {
                userIntro.setSkill1(code_array[i]);
            } else if(i == 1) {
                userIntro.setSkill2(code_array[i]);
            } else if(i == 2) {
                userIntro.setSkill3(code_array[i]);
                break;
            }
        }

        userIntro.setUserId(userDTO.getUserId());
        userService.update(userIntro);
        return "user/myPage";
    }

    @PostMapping(value="/delete")
    @ResponseBody
    public void delete(@RequestParam String userId) {
        userService.delete(userId);
    }
}