package freeBoard.controller;

import freeBoard.bean.FBoardDTO;
import freeBoard.service.FBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/freeBoard")
public class FreeBoardController {
    @Autowired
    private FBoardService fBoardService;

    @GetMapping(value = "/freeBoardList")
    public String freeBoardList(){
        return "/freeBoard/freeBoardList";
    }

    @PostMapping(value = "write")
    @ResponseBody
    public void write(@ModelAttribute("FBoardDTO") FBoardDTO fBoardDTO){
        fBoardService.write(fBoardDTO);
    }
}
