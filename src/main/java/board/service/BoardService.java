package board.service;

import board.bean.BoardDTO;

import java.util.List;

public interface BoardService {
    public String boardInputData(BoardDTO boardDTO, String[] lang);

    public List<BoardDTO> boardListGet();

    public String boardTagGet(String boardid);

    List<BoardDTO> boardListGet1( String type, String field);
}
