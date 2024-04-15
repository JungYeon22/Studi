package chatWebsocket.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO {
    private int chatRoomNo;
    private String title;
    private int memberNo;
}
