package manager.controller;

import manager.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;
    @GetMapping(value = "/managerPage")
    public String managerPage(){
        return "manager/managerPage";
    }
}
