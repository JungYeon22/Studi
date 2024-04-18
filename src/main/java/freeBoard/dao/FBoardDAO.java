package freeBoard.dao;

import freeBoard.bean.FBoardCommentDTO;
import freeBoard.bean.FBoardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface FBoardDAO {

    void write(FBoardDTO fBoardDTO);

    List<FBoardDTO> getFBoardList(@Param("startNum") int startNum,@Param("size") int size);

    void updateLike(Map<String, Object> map);

    List<Integer> getUserLikeList(String userId);

    List<FBoardCommentDTO> getBoardComment(int fBoard);

    void addComment(FBoardCommentDTO fBoardCommentDTO);

    List<FBoardDTO> fBoardList(@Param("startNum") int startNum,@Param("size") int size);

    List<FBoardDTO> getFBoardTopRank(int number);
}
