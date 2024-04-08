package board.dao;

import board.bean.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface BoardDAO {
    public void boardInputData(BoardDTO boardDTO);

    public void tagInput(Map<String, Object> map);
}
