package freeBoard.service;

import freeBoard.bean.FBoardDTO;
import freeBoard.dao.FBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FBoardServiceImpl implements FBoardService{
    @Autowired
    private FBoardDAO fBoardDAO;

    @Override
    public void write(FBoardDTO fBoardDTO) {
        fBoardDAO.write(fBoardDTO);
    }

    @Override
    public List<FBoardDTO> getFBoardList(int page) {
        int startNum = (page-1)*5;
        int size = 5;
        // 1page 0 ~ 4  / 2page 5 ~ 9
        return fBoardDAO.getFBoardList(startNum, size);
    }

    @Override
    public void updateLike(String num, String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("fBoard", Integer.parseInt(num));
        map.put("userId", userId);
        System.out.println("updateLike(service)..");
        fBoardDAO.updateLike(map);
    }

    @Override
    public List<Integer> getUserLikeList(String userId) {
        return fBoardDAO.getUserLikeList(userId);
    }
}
