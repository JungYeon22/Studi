package chat.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping(value = "/chat")
public class ChatController {

    @GetMapping(value = "/chatForm")
    public String chatForm(){
        return "chat/chatForm";
    }

    @GetMapping(value = "/doChat")
    public String doChat(){
        return "chat/doChat";
    }
}
