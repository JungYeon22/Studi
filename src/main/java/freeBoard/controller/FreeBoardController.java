package freeBoard.controller;

import freeBoard.bean.FBoardDTO;
import freeBoard.bean.FBoardCommentDTO;
import freeBoard.service.FBoardService;
import manager.bean.NoticeDTO;
import manager.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/freeBoard")
public class FreeBoardController {
    @Autowired
    private FBoardService fBoardService;
    @Autowired
    private ManagerService managerService;

    @GetMapping(value = "/freeBoardList")
    public String freeBoardList(Model model){
        List<FBoardDTO> fBoardList = fBoardService.fBoardList(1);
        List<NoticeDTO> notiList = managerService.getNotice();
        for(NoticeDTO noticeDTO : notiList){
            System.out.println(noticeDTO.toString());
        }
        model.addAttribute("fBoardList", fBoardList);
        model.addAttribute("notiList", notiList);
        return "/freeBoard/freeBoardList";
    }

    @PostMapping(value = "getUserLikeList")
    @ResponseBody
    public List<Integer> getUserLikeList(@RequestParam String userId, Model model){
        return fBoardService.getUserLikeList(userId);
    }

    @PostMapping(value = "write")
    @ResponseBody
    public void write(@ModelAttribute("FBoardDTO") FBoardDTO fBoardDTO){
        fBoardService.write(fBoardDTO);
    }

    @PostMapping(value = "updateLike")
    @ResponseBody
    public void updateLike(@RequestParam("num") String num,
                     @RequestParam("userId") String userId){
        fBoardService.updateLike(num, userId);
    }

    @PostMapping(value = "getBoardList")
    @ResponseBody
    public List<FBoardDTO> getBoardList(@RequestParam String page){
        return fBoardService.getFBoardList(Integer.parseInt(page));
    }

    @PostMapping(value = "getBoardComment")
    @ResponseBody
    public List<FBoardCommentDTO> getBoardComment(@RequestParam String fBoard){
        return fBoardService.getBoardComment(Integer.parseInt(fBoard));
    }

    @PostMapping(value = "addComment")
    @ResponseBody
    public List<FBoardCommentDTO> addComment(@ModelAttribute FBoardCommentDTO fBoardCommentDTO){
        return fBoardService.addComment(fBoardCommentDTO);
    }

    @GetMapping(value = "getFBoardTopRank")
    @ResponseBody
    public List<FBoardDTO> getFBoardTopRank(){
        List<FBoardDTO> fBoardList = fBoardService.getFBoardTopRank(5);
        for(FBoardDTO fBoardDTO : fBoardList){
            System.out.println(fBoardDTO.getTitle());
        }
        return fBoardList;
    }

    @PostMapping(value = "deleteFBoard")
    @ResponseBody
    public void deleteFBoard(@RequestParam String fBoard){
        System.out.println("fBoard = " + fBoard);
        fBoardService.deleteFBoard(Integer.parseInt(fBoard));
    }



}
