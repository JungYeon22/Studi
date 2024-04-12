package board.service;

import board.bean.BoardDTO;

import java.util.List;
import java.util.Map;

public interface BoardService {
    public String boardInputData(BoardDTO boardDTO, String[] lang);

    public Map<String,Object> boardListGet(String pg);

    public String boardTagGet(String boardid);

    public List<BoardDTO> boardListGet1( String type, String field);
}
