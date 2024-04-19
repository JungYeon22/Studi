package board.dao;

import board.bean.BoardDTO;
import board.bean.BoardReply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {

    public void boardInputData(BoardDTO boardDTO);

    public void tagInput(Map<String, Object> map);

    public List<BoardDTO> boardListGet(int startNum);

    public String boardTagGet(String boardid);

    List<BoardDTO> boardListGet1(Map<String, Object> map);

    public int getTotal();

    public int getTotal1(Map<String, Object> map);

    BoardDTO boardListGetbyId(String boardid);

    public void addHit(String boardid);

    public String boardScrap(Map<String, String> map);

    public void addBoardScrap(Map<String, String> map);

    public void removeBoardScrap(Map<String, String> map);

    public void removeBoard(Map<String, String> map);

    public void addReply(Map<String, Object> map);

    public List<BoardReply> loadReply(String boardid);

    public void boardEditData(BoardDTO boardDTO);

    public void tagEdit(Map<String, Object> map);

    public List<BoardDTO> getHot5();

    public List<BoardDTO> getRecent5();

    public void removeComment(Map<String, String> map);

    public void removeTag(Map<String, String> map);

    public void removeReply(String no);

    public void editReply(Map<String, String> map);

    public void reportUser(Map<String, String> map);

    public List<BoardDTO> boardCntGetByUserId(String userId);
}
