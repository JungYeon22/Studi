package board.controller;


import board.bean.BoardDTO;
import board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "board")
public class BoardController {

    @Autowired
    private BoardService boardService;
    @GetMapping(value = "/boardListMain")
    public String boardListMain(){

        return "board/boardListMain";
    }

    @GetMapping(value = "/boardListDetail")
    public String boardListDetail(){

        return "board/boardListDetail";
    }

    @GetMapping(value = "/boardInput")
    public String boardInput(){
        return "board/boardInput";
    }

    @GetMapping(value = "/boardInputData")
    @ResponseBody
    public String boardInputData(@ModelAttribute BoardDTO boardDTO, @RequestParam() String[] lang){
        return boardService.boardInputData(boardDTO,lang);
    }


}
