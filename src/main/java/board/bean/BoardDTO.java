package board.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class BoardDTO {
    private String BOARDID;
    private String SUBJECT;
    private String CONTENT;
    private int userCnt;
    private String projectType;
    private String projectField;
    private String UserId;
    private Date DATE;
    private String FILE;
    private String HIT;

}
