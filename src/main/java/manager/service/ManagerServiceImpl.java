package manager.service;

import manager.bean.ManagerDTO;
import manager.bean.ManagerData;
import manager.bean.ManagerPaging;
import manager.dao.ManagerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    private ManagerDAO managerDAO;
    @Autowired
    private ManagerData managerData;
    @Autowired
    private ManagerPaging managerPaging;
    @Override
    public List<Map<String, Object>> getTodayMember() {
        List<Map<String, Object>> signupCounts = managerDAO.getTodayMember();
        /*for (Map<String, Object> row : signupCounts) {
            String date = row.get("date").toString();
            int signups = Integer.parseInt(row.get("signups").toString());
            System.out.println("Date: " + date + ", Signups: " + signups);
        }*/
        managerData.setSignupCounts(signupCounts);
        return signupCounts;
    }

    @Override
    public List<Map<String, Object>> boardUpload() {
        List<Map<String, Object>> boardCounts = managerDAO.boardUpload();
        for (Map<String, Object> row : boardCounts) {
            String date = row.get("date").toString();
            int upload = Integer.parseInt(row.get("upload").toString());
            System.out.println("Date: " + date + ", Upload: " + upload);
        }
        /*managerData.setBoardCounts(boardCounts);*/
        return boardCounts;
    }


    @Override
    public Map<String, Object> getUserList(String pg) {
        //1페이지당 3개씩 - MySQL
        int startNum = Integer.parseInt(pg) * 3 - 3; //시작위치는 0부터
        System.out.println(startNum);
        //List객체가 JSON으로 자동 변환된다. - pom.xml <dependency>에 추가해야 함
        List<ManagerDTO> list = managerDAO.getUserList(startNum);
        System.out.println("list = " + list);

        //페이징 처리
        int totalA = managerDAO.getTotalA(); //총글수

        managerPaging.setCurrentPage(Integer.parseInt(pg));
        managerPaging.setPageBlock(3);
        managerPaging.setPageSize(3);
        managerPaging.setTotalA(totalA);
        managerPaging.makePagingHTML();

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("managerPaging", managerPaging);

        return map;
    }
}
