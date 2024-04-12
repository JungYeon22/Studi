package rest.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {

    @PostMapping("/")
    public ResponseEntity<String> sendMessage(@RequestBody String content) {
        System.out.println("Spring 서버에서 요청을 받았습니다. 받은 메시지: " + content);
        return ResponseEntity.ok("Spring 서버 응답: 요청을 받았습니다.");
    }
}
