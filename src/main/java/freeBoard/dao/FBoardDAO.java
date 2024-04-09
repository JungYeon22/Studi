package freeBoard.dao;

import freeBoard.bean.FBoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface FBoardDAO {

    void write(FBoardDTO fBoardDTO);

    List<FBoardDTO> getFBoardList();

    void updateLike(Map<String, Object> map);

    List<Integer> getUserLikeList(String userId);
}
