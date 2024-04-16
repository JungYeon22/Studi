package board.service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
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

    @Autowired
    private BoardPaging boardPaging;
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
    public Map<String,Object> boardListGet(String pg) {

        //1페이지당 3개씩
        int startNum= (Integer.parseInt(pg)*5)-4;


        List<BoardDTO> list = boardDAO.boardListGet(startNum);
        //List -> JSON 변환


        //총글수 가져오기
        int total = boardDAO.getTotal();


        boardPaging.setCurrentPage(Integer.parseInt(pg));
        boardPaging.setPageBlock(5);
        boardPaging.setPageSize(5);
        boardPaging.setTotal(total);
        boardPaging.makePagingHTML();

        Map<String,Object> map = new HashMap<>();
        map.put("list", list);
        map.put("boardPaging", boardPaging.getPagingHTML().toString());

        return map;
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

    @Override
    public BoardDTO boardListGetbyId(String boardid) {
        return boardDAO.boardListGetbyId(boardid);
    }

    @Override
    public void addHit(String boardid) {
        boardDAO.addHit(boardid);
    }

    @Override
    public String boardScrap(String boardid, String userId) {
        Map<String, String> map = new HashMap<>();
        map.put("boardid",boardid);
        map.put("userId",userId);
        return boardDAO.boardScrap(map);
    }

    @Override
    public void addBoardScrap(String boardid, String userId) {
        Map<String, String> map = new HashMap<>();
        map.put("boardid",boardid);
        map.put("userId",userId);
        boardDAO.addBoardScrap(map);
    }

    @Override
    public String removeBoardScrap(String boardid, String userId) {
        Map<String, String> map = new HashMap<>();
        map.put("boardid",boardid);
        map.put("userId",userId);
        boardDAO.removeBoardScrap(map);
        return "";
    }

    @Override
    public String removeBoard(String boardid, String userId) {

        Map<String, String> map = new HashMap<>();
        map.put("boardid",boardid);
        map.put("userId",userId);
        boardDAO.removeBoardScrap(map);
        boardDAO.removeBoard(map);
        return "";
    }
}
