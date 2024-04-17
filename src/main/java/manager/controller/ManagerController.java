package manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import manager.bean.ManagerDTO;
import manager.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin")
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @GetMapping(value = "/managerPage")
    public String managerPage(@RequestParam(required = false, defaultValue = "1") String pg,Model model){
        model.addAttribute("pg", pg);

        List<NoticeDTO> notiList = managerService.getNotice();
        model.addAttribute("notiList", notiList );
        return "manager/managerPage";
    }
    @PostMapping(value = "/managerPage/signupCounts", produces = "application/json")
    @ResponseBody
    public String getTodayMember(Model model){
        List<Map<String, Object>> signupCounts = managerService.getTodayMember();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String jsonData;
        try {
            jsonData = objectMapper.writeValueAsString(signupCounts);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            jsonData = "[]";
        }

        return jsonData;
    }

    @PostMapping(value = "/managerPage/boardUpload", produces = "application/json")
    @ResponseBody
    public String boardUpload(Model model){
        List<Map<String, Object>> boardCounts = managerService.boardUpload();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String jsonData;
        try {
            jsonData = objectMapper.writeValueAsString(boardCounts);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            jsonData = "[]";
        }

        return jsonData;
    }

    @PostMapping(value="/managerPage/getUserList", produces = "application/json")
    @ResponseBody
    public Map<String, Object> getUserList(@RequestParam String pg){
        return managerService.getUserList(pg);
    }

    @PostMapping(value="/managerPage/getUserList2", produces = "application/json")
    @ResponseBody
    public Map<String, Object> getUserList2(@RequestParam String input,
                                            @RequestParam String value,
                                            @RequestParam String pg){
        Map<String, Object> map = new HashMap<>();
        map.put("input", input);
        map.put("value", value);
        map.put("pg", pg);
        return managerService.getUserList2(map);
    }
}
