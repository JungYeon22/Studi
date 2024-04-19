package project.controller;

import board.bean.BoardDTO;
import board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.service.ProjectService;
import user.bean.UserDTO;
import user.bean.UserIntro;

import java.util.List;

@Controller
@RequestMapping(value = "projectPage")
public class ProjectTeamController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private ProjectService projectService;


    @GetMapping(value = "/myProjectPage")
    public String myProjectPage(@RequestParam(required = true) String boardId, Model model){
        BoardDTO boardDTO = boardService.boardListGetbyId(boardId);
        List<UserIntro> projectMemberList = projectService.getProjectMember(boardId);
        for(UserIntro userIntro: projectMemberList){
            System.out.println(userIntro.getUserId());
        }
        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("projectMemberList", projectMemberList);
        return "projectPage/myProjectPage";
    }

}
