package user.controller;

import board.service.ObjectStorage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
    @Autowired
    private ObjectStorage objectStorage;
    private String bucketName="bitcamp-6th-bucket-102";

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
    public ResponseEntity<Map<String, Boolean>> checkUserId(@RequestBody Map<String, String> json,Model model) {
        boolean isDuplicate;
        boolean isDuplicate2;
        String userId = json.get("userId");
        model.addAttribute("name",json.get("name"));
        model.addAttribute("phone",json.get("phone"));
        model.addAttribute("email",json.get("email"));
        Map<String, Boolean> response = new HashMap<>();
        if (userId.isEmpty()) {
            isDuplicate = true;
        } else {
            isDuplicate = userService.checkUserId(userId);
            isDuplicate2 = userService.checkUserId2(model);
            response.put("isDuplicate", isDuplicate);
            response.put("isBan", isDuplicate2);
        }
        return ResponseEntity.ok(response);
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
        String setFrom = "rytns24@naver.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
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

    //이메일 인증
    @ResponseBody
    @PostMapping("/EmailAuthPwd")
    public String emailAuthPwd(String email) {

//        log.info("전달 받은 이메일 주소 : " + email);
        System.out.println("전달 받은 이메일 주소 : " + email);

        //난수의 범위 111111 ~ 999999 (6자리 난수)
        Random random = new Random();
        int checkNum = random.nextInt(888888)+111111;

        //이메일 보낼 양식
        String setFrom = "rytns24@naver.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
        String toMail = email;
        String title = "비밀번호 재설정 인증 이메일 입니다.";
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
    public void delete(@SessionAttribute String userId) {
        userService.delete(userId);
    }


    // 아이디 찾기
    @GetMapping(value = "/findIdForm")
    public String findIdForm() {
        return "user/findIdForm";
    }

    @PostMapping(value = "/findIdForm")
    public String findIdPost(@RequestParam("email") String email,
                             RedirectAttributes redirectAttributes,
                             HttpServletRequest request) {
        UserDTO user = userService.findByEmail(email);
        if(user != null) {
            redirectAttributes.addFlashAttribute("userDTO", user);
            System.out.println(user.getLogin_type());
            return "redirect:/user/findId";
        } else {
            // 이건 단발성 요청에 존재하는 기능 !
            redirectAttributes.addFlashAttribute("error", "입력하신 이메일로 등록된 아이디가 없습니다.");
            return "redirect:/user/findIdForm";
        }
    }

    // 찾은 아이디 조회
    @GetMapping(value = "/findId")
    public String findIdView() {
        return "user/findId";
    }

    // 비밀번호 찾기
    @GetMapping(value = "/findPwdForm")
    public String findPwdForm() {
        return "user/findPwdForm";
    }

    @PostMapping(value = "/findPwdForm")
    public String findPwdPost(@RequestParam("email") String email,
                              RedirectAttributes redirectAttributes,
                              HttpServletRequest request) {
        UserDTO user = userService.findByEmail(email);
        if(user != null) {
            // 세션에 사용자 정보 저장했음 !
            redirectAttributes.addFlashAttribute("userDTO", user);
            return "redirect:/user/findPwd";
        } else {
            // 이건 단발성 요청에 존재하는 기능 !
            redirectAttributes.addFlashAttribute("error", "입력하신 이메일로 등록된 아이디가 없습니다.");
            return "redirect:/user/findPwdForm";
        }
    }

    // 찾은 비밀번호 조회
    @GetMapping(value = "/findPwd")
    public String findPwdView() {
        return "user/findPwd";
    }



    @PostMapping(value = "/showProfile")
    @ResponseBody
    public UserIntro showProfile(@RequestParam String userid){

        return userService.showProfile(userid);
    }


    @PostMapping(value = "/userIconChange")
    @ResponseBody
    public String userIconChange(@RequestParam String userid, MultipartFile img){
        String fileName=objectStorage.uploadFile(bucketName,"miniproject/",img);

        return userService.userIconChange(userid,fileName);
    }


    @PostMapping(value = "/userIconCheck")
    @ResponseBody
    public String userIconCheck(@RequestParam String userid){

        return userService.userIconCheck(userid);
    }
}