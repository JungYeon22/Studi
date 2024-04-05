package manager.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerDTO {
    private String id;
    private String pwd;
    private String name;
    private String birth;
    private String skill;
    private String email;
    private String phone;
    private String hiredate;
}
