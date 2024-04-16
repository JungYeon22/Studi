package user.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
public class UserIntro {
    private String name;
    private String userId;
    private String career;
    private String position;
    private String skill1;
    private String skill2;
    private String skill3;
    private String introduce;
}
