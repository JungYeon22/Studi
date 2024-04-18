package manager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import manager.bean.ManagerDTO;
import manager.bean.ManagerReport;
import manager.bean.NoticeDTO;
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
    public String managerPage(@RequestParam(required = false, defaultValue = "1") String pg, Model model,
                              @ModelAttribute ManagerReport managerReport){
        model.addAttribute("pg", pg);

        List<NoticeDTO> notiList = managerService.getNotice();
        model.addAttribute("notiList", notiList );
        model.addAttribute("managerReport", managerReport);
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

    @PostMapping(value = "/managerPage/pichart1", produces = "application/json")
    @ResponseBody
    public String pichart1(Model model){
        List<Map<String, Object>> typeCounts = managerService.pichart1();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String jsonData;
        try {
            jsonData = objectMapper.writeValueAsString(typeCounts);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            jsonData = "[]";
        }

        return jsonData;
    }

    @PostMapping(value = "/managerPage/pichart2", produces = "application/json")
    @ResponseBody
    public String pichart2(Model model){
        List<Map<String, Object>> fielddCounts = managerService.pichart2();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String jsonData;
        try {
            jsonData = objectMapper.writeValueAsString(fielddCounts);
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
    @PostMapping(value = "/managerPage/noti")
    @ResponseBody
    public void noti(@RequestParam Map<String,String> map){
        System.out.println(map.get("title"));
        managerService.registerNotice(map);
    }

    @PostMapping(value = "/noti/delete")
    @ResponseBody
    public void notiDelte(@RequestParam String id){
        managerService.notiDelete(Integer.parseInt(id));
    }

    @PostMapping(value = "/managerPage/reportList", produces = "application/json")
    @ResponseBody
    public Map<String, Object> report(){

        return managerService.report();
    }
    @PostMapping(value = "/managerPage/reportSelect", produces = "application/json")
    @ResponseBody
    public Map<String, Object> reportSelect(@RequestParam String reportNum){
        return managerService.reportSelect(reportNum);
    }

    @PostMapping(value = "/managerPage/reportStatus", produces = "application/json")
    @ResponseBody
    public void reportStatus(@RequestParam Map<String,String> map){

        managerService.reportStatus(map);
        managerService.reportUser(map);
    }
}
