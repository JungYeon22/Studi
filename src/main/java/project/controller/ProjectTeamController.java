package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "projectPage")
public class ProjectTeamController {


    @GetMapping(value = "/myProjectPage")
    public String myProjectPage(){
        return "projectPage/myProjectPage";
    }

}
