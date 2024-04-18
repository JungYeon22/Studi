package board.service;

import board.bean.BoardDTO;
import board.bean.BoardReply;

import java.util.List;
import java.util.Map;

public interface BoardService {
    public String boardInputData(BoardDTO boardDTO, String[] lang);

    public Map<String,Object> boardListGet(String pg);

    public String boardTagGet(String boardid);

    public List<BoardDTO> boardListGet1( String type, String field);

    public BoardDTO boardListGetbyId(String boardid);

    public void addHit(String boardid);

    public String boardScrap(String boardid, String userId);

    public void addBoardScrap(String boardid, String userId);

    public String removeBoardScrap(String boardid, String userId);

    public String removeBoard(String boardid, String userId);

    public String addReply(String boardid, String userId, String text, int ref);

    public List<BoardReply> loadReply(String boardid);

    public void boardEditData(BoardDTO boardDTO, String[] lang);

    public List<BoardDTO> getHot5();

    public List<BoardDTO> getRecent5();

    public void removeReply(String no);

    public void editReply(String no, String content);

    public void reportUser(String reportId, String reportText, String userid);
}
