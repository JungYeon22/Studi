package chatWebsocket.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomJoinDTO {
    private String memberNo;
    private int chatRoomNo;
}
