package board.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class BoardReply {

    private int No;
    private int ref;
    private String BOARDID;
    private Date DATE;
    private String UserId;
    private String TEXT;
}
