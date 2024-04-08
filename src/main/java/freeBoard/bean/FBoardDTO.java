package freeBoard.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter
public class FBoardDTO {
    private int fBoardNum;
    private String writer;
    private String title;
    private String content;
    private Date date;
    private int like;
}
