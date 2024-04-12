package user.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter @Getter
@ToString
public class UserDTO {

    private String name;
    private String userId;
    private String pwd;
    private String phone;
    private String email;
    private Date hiredate;
}
