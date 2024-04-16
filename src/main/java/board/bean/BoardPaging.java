package board.bean;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
@Getter
@Setter
public class BoardPaging {

    private int currentPage; //현재페이지
    private int pageBlock; // [이전][1][2][3][다음]
    private int pageSize;// 1페이지당 개수
    private int total; //총글수
    private StringBuffer pagingHTML;


    public void makePagingHTML() {
        pagingHTML = new StringBuffer();

        int totalP = (total+pageSize-1)/pageSize; //총 페이지수

        int startPage = (currentPage-1)/pageBlock*pageBlock+1;
        int endPage = startPage+pageBlock-1;
        if(endPage > totalP) endPage=totalP;

        if(startPage !=1)pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='boardPaging("+(startPage-1)+")'>이전</button>");
        for(int i=startPage;i<=endPage;i++) {
            if(i==currentPage) {
                pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='boardPaging("+i+")'>"+i+"</button>");
            }else {
                pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='boardPaging("+i+")'>"+i+"</button>");
            }
        }
        if(endPage < totalP)pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='boardPaging("+(endPage+1)+")'>다음</button>");




    }

    public void makePagingHTML1() {
        pagingHTML = new StringBuffer();

        int totalP = (total+pageSize-1)/pageSize; //총 페이지수

        int startPage = (currentPage-1)/pageBlock*pageBlock+1;
        int endPage = startPage+pageBlock-1;
        if(endPage > totalP) endPage=totalP;

        if(startPage !=1)pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='filterSelect("+(startPage-1)+")'>이전</button>");
        for(int i=startPage;i<=endPage;i++) {
            if(i==currentPage) {
                pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='filterSelect("+i+")'>"+i+"</button>");
            }else {
                pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='filterSelect("+i+")'>"+i+"</button>");
            }
        }
        if(endPage < totalP)pagingHTML.append("<button id='paging' type='button' class='btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2' onclick='filterSelect("+(endPage+1)+")'>다음</button>");




    }
}
