package board.dao;

import board.bean.BoardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {

    public void boardInputData(BoardDTO boardDTO);

    public void tagInput(Map<String, Object> map);

    public List<BoardDTO> boardListGet();

    public String boardTagGet(String boardid);
}
