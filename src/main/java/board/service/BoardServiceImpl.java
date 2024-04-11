package board.service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAO boardDAO;
    @Override
    public String boardInputData(BoardDTO boardDTO, String[] lang) {

         String lang_tmp="";

         for(int i=0;i<lang.length;i++){
             if(i==lang.length-1){
                 lang_tmp+=lang[i];
             }else{
                 lang_tmp+=lang[i]+",";
             }
         }
         boardDAO.boardInputData(boardDTO);
         Map<String,Object> map = new HashMap<>();
         map.put("boardId",boardDTO.getBOARDID());
         map.put("lang",lang_tmp);
         boardDAO.tagInput(map);

        return "";
    }

    @Override
    public List<BoardDTO> boardListGet() {
        return boardDAO.boardListGet();
    }

    @Override
    public String boardTagGet(String boardid) {
        return boardDAO.boardTagGet(boardid);
    }

    @Override
    public List<BoardDTO> boardListGet1(String type, String field) {
        Map<String,Object> map = new HashMap<>();
        if(type.length()==0){
            type="%p%";
        }
        if(field.length()==0){
            field="%e%";
        }

        map.put("projectType",type);
        map.put("projectField",field);


        return boardDAO.boardListGet1(map);
    }
}
