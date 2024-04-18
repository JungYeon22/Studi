package manager.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Setter
@Getter
public class ManagerReport {
    private int reportNum;
    private int status;
    private String targetId;
    private Date reportDate;
    private String UserId;
    private String content;
}
