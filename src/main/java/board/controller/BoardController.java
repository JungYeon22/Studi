package board.controller;


import board.bean.BoardDTO;
import board.bean.BoardReply;
import board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    public String boardListDetail(@RequestParam String boardid, Model model, HttpServletRequest request, HttpServletResponse response){
        boardHit(boardid,request,response);
        BoardDTO boardDTO = boardService.boardListGetbyId(boardid);

        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy년 MM월 dd일");
        String date = simpleDateFormat.format(boardDTO.getDATE());

        model.addAttribute("boardDTO",boardDTO);
        model.addAttribute("userId",boardDTO.getUserId());
        model.addAttribute("date",date);



        return "board/boardListDetail";
    }

    private void boardHit(String boardid, HttpServletRequest request, HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        boolean isCookie = false;
        // request에 쿠키들이 있을 때
        for (int i = 0; cookies != null && i < cookies.length; i++) {
            // HIT 쿠키가 있을 때
            if (cookies[i].getName().equals("HIT")) {
                // cookie 변수에 저장
                cookie = cookies[i];
                // 만약 cookie 값에 현재 게시글 번호가 없을 때
                if (!cookie.getValue().contains("[" + boardid + "]")) {
                    // 해당 게시글 조회수를 증가시키고, 쿠키 값에 해당 게시글 번호를 추가
                    boardService.addHit(boardid);
//                    System.out.println("조회수증가");
                    cookie.setValue(cookie.getValue() + "[" + boardid + "]");
                }
                isCookie = true;
                break;
            }
        }
        // 만약 postView라는 쿠키가 없으면 처음 접속한 것이므로 새로 생성
        if (!isCookie) {
            boardService.addHit(boardid);
//            System.out.println("조회수증가");
            cookie = new Cookie("HIT", "[" + boardid + "]"); // oldCookie에 새 쿠키 생성
        }


        cookie.setPath("/"); // 모든 경로에서 접근 가능
        cookie.setMaxAge(10);
        response.addCookie(cookie);

    }

    @GetMapping(value = "/boardInput")
    public String boardInput(){
        return "board/boardInput";
    }

    @PostMapping(value = "/boardInputData")
    @ResponseBody
    public String boardInputData(@ModelAttribute BoardDTO boardDTO, @RequestParam String[] lang){
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
    public String boardTagGet(@RequestParam String boardid){

        return boardService.boardTagGet(boardid);
    }




    @PostMapping(value = "/boardScrap")
    @ResponseBody
    public String boardScrap(@RequestParam String boardid, String userId){
        String scrap = boardService.boardScrap(boardid,userId);

//        System.out.println("scrap="+scrap);

        if(scrap==null){
            boardService.addBoardScrap(boardid,userId);
            return "non_exist";
        }else{
            return "exist";
        }

    }


    @PostMapping(value = "/checkBoardScrap")
    @ResponseBody
    public String checkBoardScrap(@RequestParam String boardid, String userId){
        String scrap = boardService.boardScrap(boardid,userId);

//        System.out.println("scrap="+scrap);

        if(scrap==null){
            return "non_exist";
        }else{
            return "exist";
        }

    }

    @PostMapping(value = "/removeBoardScrap")
    @ResponseBody
    public String removeBoardScrap(@RequestParam String boardid, String userId){
     return boardService.removeBoardScrap(boardid,userId);
    }


    @PostMapping(value = "/removeBoard")
    @ResponseBody
    public String removeBoard(@RequestParam String boardid, String userId){
        return boardService.removeBoard(boardid,userId);
    }
    @PostMapping(value = "/addReply")
    @ResponseBody
    public String addReply(@RequestParam String boardid, String userId,String text, int ref){

        return boardService.addReply(boardid,userId,text,ref);
    }


    @PostMapping(value = "/loadReply")
    @ResponseBody
    public List<BoardReply> loadReply(@RequestParam String boardid){

        return boardService.loadReply(boardid);
    }


}
