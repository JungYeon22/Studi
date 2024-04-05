package manager.service;

import manager.dao.ManagerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    private ManagerDAO managerDAO;

    @Override
    public void getToTalMember(String hiredate) {

        managerDAO.getToTalMember(hiredate);
    }

    @Override
    public void getWeekMember(String hiredate) {
        managerDAO.getWeekMember(hiredate);
    }

    @Override
    public void getTodayMember(String hiredate) {

        managerDAO.getTodayMember(hiredate);
    }
}
