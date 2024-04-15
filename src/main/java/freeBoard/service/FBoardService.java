package freeBoard.service;

import freeBoard.bean.FBoardDTO;
import freeBoard.bean.FBoardCommentDTO;

import java.util.List;

public interface FBoardService {

    void write(FBoardDTO fBoardDTO);

    List<FBoardDTO> getFBoardList(int page);

    void updateLike(String num, String userId);

    List<Integer> getUserLikeList(String userId);

    List<FBoardCommentDTO> getBoardComment(int fBoard);

    List<FBoardCommentDTO> addComment(FBoardCommentDTO fBoardCommentDTO);

    List<FBoardDTO> fBoardList(int page);
}
