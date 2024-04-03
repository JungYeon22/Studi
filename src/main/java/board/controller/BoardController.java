package board.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "board")
public class BoardController {

    @GetMapping(value = "/boardList1")
    public String boardList1(){

        return "board/boardList1";
    }

    @GetMapping(value = "/boardList2")
    public String boardList2(){

        return "board/boardList2";
    }


}
