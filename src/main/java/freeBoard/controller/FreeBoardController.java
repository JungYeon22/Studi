package freeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/freeBoard")
public class FreeBoardController {

    @GetMapping(value = "/freeBoardList")
    public String freeBoardList(){
        return "/freeBoard/freeBoardList";
    }
}
