package freeBoard.service;

import freeBoard.bean.FBoardDTO;

import java.util.List;
import java.util.Map;

public interface FBoardService {

    void write(FBoardDTO fBoardDTO);

    List<FBoardDTO> getFBoardList();

    void updateLike(String num, String userId);

    List<Integer> getUserLikeList(String userId);
}
