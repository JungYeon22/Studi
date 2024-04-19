package board.controller;

import board.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import user.bean.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @PostMapping(value = "/application")
    public String application(HttpServletRequest request,
                              @ModelAttribute Map<String, String> map){
        HttpSession session = request.getSession();
        UserDTO userDTO = (UserDTO)session.getAttribute("userDTO");
        map.put("userId", userDTO.getUserId());
        projectService.application(map);
        return "redirect:/";
    }

    @GetMapping(value = "applicationList")
    @ResponseBody
    public List<UserDTO> applicationList(@RequestParam String boardId){
         return projectService.applicationList(boardId);
    }

    @PostMapping(value = "/approve")
    public String participation(HttpServletRequest request,
                                @ModelAttribute Map<String,Object> map){
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        projectService.approve(map);
        return "redirect:/";
    }

}
