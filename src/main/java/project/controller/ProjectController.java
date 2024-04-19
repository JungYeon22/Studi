package project.controller;

import project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import user.bean.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/projectTeam")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @PostMapping(value = "/application")
    @ResponseBody
    public void application(@RequestParam String applicationUser,
                            @RequestParam String applicationBoardId){
        Map<String, String > map = new HashMap<>();
        map.put("applicationUser", applicationUser);
        map.put("applicationBoardId", applicationBoardId);
        projectService.application(map);
    }

    @PostMapping(value = "/applicationList")
    @ResponseBody
    public List<UserDTO> applicationList(@RequestParam String boardId){
        System.out.println("boardId = " + boardId);
         return projectService.applicationList(boardId);
    }

    @PostMapping(value = "/approve")
    @ResponseBody
    public String participation(@RequestParam String boardId,
                                @RequestParam String userId){
        Map<String, Object> map = new HashMap<>();
        map.put("boardId", boardId);
        map.put("userId", userId);
        System.out.println(map.get("userId"));
        System.out.println("boardId = " + boardId);
        projectService.approve(map);
        return "승인";
    }

}
