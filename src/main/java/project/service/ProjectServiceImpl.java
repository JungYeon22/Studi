package project.service;

import board.bean.BoardDTO;
import board.dao.ProjectDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import user.bean.UserDTO;
import user.bean.UserIntro;

import java.util.List;
import java.util.Map;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectDAO projectDAO;
    @Override
    public void application(Map<String, String> map) {
        projectDAO.application(map);
    }

    @Override
    public void approve(Map<String, Object> map) {
        projectDAO.applicationDelete(map);
        projectDAO.approve(map);
        projectDAO.updateProjectCnt(map);
    }

    @Override
    public List<UserDTO> applicationList(String boardId) {
        return projectDAO.applicationList(boardId);
    }

    @Override
    public List<BoardDTO> getMyProjectList(String userId) {
        return projectDAO.getMyProjectList(userId);
    }

    @Override
    public List<UserIntro> getProjectMember(String boardId) {
        return projectDAO.getProjectMember(boardId);
    }
}
