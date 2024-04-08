package manager.service;

import manager.dao.ManagerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;


@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    private ManagerDAO managerDAO;

    @Override
    public int getToTalMember(String hiredate) {
        return managerDAO.getToTalMember(hiredate);
    }

    @Override
    public int getWeekMember(String hiredate) {
        return managerDAO.getWeekMember(hiredate);
    }

    @Override
    public List<Map<String, Object>> getTodayMember(String hiredate) {
        return managerDAO.getTodayMember(hiredate);
    }
}
