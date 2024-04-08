package freeBoard.dao;

import freeBoard.bean.FBoardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FBoardDAO {

    void write(FBoardDTO fBoardDTO);
}
