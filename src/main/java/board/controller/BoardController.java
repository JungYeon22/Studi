package board.controller;


import board.bean.BoardDTO;
import board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "board")
public class BoardController {

    @Autowired
    private BoardService boardService;
    @GetMapping(value = "/boardListMain")
    public String boardListMain(@RequestParam String pg,Model model){
        model.addAttribute("pg",pg);

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
    public Map<String, Object> boardListGet(@RequestParam String pg){

        return boardService.boardListGet(pg);
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
