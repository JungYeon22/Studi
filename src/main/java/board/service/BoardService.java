package board.service;

import board.bean.BoardDTO;

public interface BoardService {
    public String boardInputData(BoardDTO boardDTO, String[] lang);
}
