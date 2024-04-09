package board.service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
}
