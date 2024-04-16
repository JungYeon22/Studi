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

    public List<BoardDTO> boardListGet(int startNum);

    public String boardTagGet(String boardid);

    List<BoardDTO> boardListGet1(Map<String, Object> map);

    public int getTotal();

    public int getTotal1(Map<String, Object> map);
}
