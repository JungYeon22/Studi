package freeBoard.bean;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter
public class FBoardDTO {
    private int fBoard;
    private String writer;
    private String writer_name;
    private String title;
    private String content;
    private Date date;
    private int likes;
    private int comment;
}
