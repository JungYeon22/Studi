package freeBoard.controller;

import freeBoard.bean.FBoardDTO;
import freeBoard.service.FBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import user.bean.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/freeBoard")
public class FreeBoardController {
    @Autowired
    private FBoardService fBoardService;

    @GetMapping(value = "/freeBoardList")
    public String freeBoardList(HttpSession session, Model model){
        UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
        List<Integer> userLikeList = new ArrayList<>();
        if(userDTO != null){
            userLikeList = fBoardService.getUserLikeList(userDTO.getUserId());
        }
        List<FBoardDTO> fBoardList = fBoardService.getFBoardList();

        model.addAttribute("fBoardList", fBoardList);
        model.addAttribute("userLikeList", userLikeList);
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

}
