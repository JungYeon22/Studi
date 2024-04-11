package freeBoard.service;

import freeBoard.bean.FBoardDTO;

import java.util.List;

public interface FBoardService {

    void write(FBoardDTO fBoardDTO);

    List<FBoardDTO> getFBoardList(int page);

    void updateLike(String num, String userId);

    List<Integer> getUserLikeList(String userId);
}
