package manager.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class ManagerUserBan {
    private String userId;
    private String name;
    private String email;
    private String phone;
    private Date bandate;
}
