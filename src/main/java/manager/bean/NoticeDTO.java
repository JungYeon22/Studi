package manager.bean;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class NoticeDTO {
    private int noti_id;
    private String title;
    private String content;
    private Date date;
    private int period;
}
