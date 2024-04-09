package board.service;

import board.bean.BoardDTO;

import java.util.List;

public interface BoardService {
    public String boardInputData(BoardDTO boardDTO, String[] lang);

    public List<BoardDTO> boardListGet();
}
