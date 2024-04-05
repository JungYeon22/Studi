package chat.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping(value = "/webChat")
public class ChatController {

    @GetMapping(value = "/doChat")
    public String doChat(){

        return "webChat/doChat";
    }

    @GetMapping(value = "/chatForm")
    public String chatForm(){

        return "webChat/chatForm";
    }
}
