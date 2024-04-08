package freeBoard.service;

import freeBoard.bean.FBoardDTO;
import freeBoard.dao.FBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FBoardServiceImpl implements FBoardService{
    @Autowired
    private FBoardDAO fBoardDAO;

    @Override
    public void write(FBoardDTO fBoardDTO) {
        fBoardDAO.write(fBoardDTO);
    }
}
