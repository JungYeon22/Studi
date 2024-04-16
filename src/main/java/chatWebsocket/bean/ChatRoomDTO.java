package chatWebsocket.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO {
    private String userId;
    private int chatRoomNo;
    private String title;
    private String status;
    private String memberNo;
}
