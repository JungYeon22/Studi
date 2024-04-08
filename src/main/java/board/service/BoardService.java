package board.service;

import board.bean.BoardDTO;

public interface BoardService {
    String boardInputData(BoardDTO boardDTO, String[] lang);
}
