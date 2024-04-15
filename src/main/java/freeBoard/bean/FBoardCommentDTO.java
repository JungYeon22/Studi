package freeBoard.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter
public class FBoardCommentDTO {
    private int fBoard;
    private String writer;
    private String comment;
    private Date date;
}
