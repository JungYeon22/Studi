package board.controller;


import board.bean.BoardDTO;
import board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @PostMapping(value = "/boardInputData")
    @ResponseBody
    public String boardInputData(@ModelAttribute BoardDTO boardDTO, @RequestParam() String[] lang){
        boardDTO.setBOARDID(boardDTO.getUserId()+boardDTO.getSUBJECT());
        boardService.boardInputData(boardDTO,lang);
        return "";
    }

    @PostMapping(value = "/boardListGet")
    @ResponseBody
    public List<BoardDTO> boardListGet(){

        return boardService.boardListGet();
    }

    @PostMapping(value = "/boardListGet1")
    @ResponseBody
    public List<BoardDTO> boardListGet1(@RequestParam  String type, String field){


        return boardService.boardListGet1(type,field);
    }

    @PostMapping(value = "/boardTagGet")
    @ResponseBody
    public String boardTagGet(@RequestParam() String boardid){

        return boardService.boardTagGet(boardid);
    }
}
