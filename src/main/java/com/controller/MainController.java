package com.controller;

import board.bean.BoardDTO;
import board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    BoardService boardService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(){
        return "index";
    }

    @PostMapping(value = "/getHot5")
    @ResponseBody
    public Map<String,Object> getHot5(){
        List<BoardDTO> list= boardService.getHot5();
        List<BoardDTO> list1= boardService.getRecent5();
        Map<String,Object> map = new HashMap<>();
        map.put("list",list);
        map.put("list1",list1);

        return map;
    }

}
