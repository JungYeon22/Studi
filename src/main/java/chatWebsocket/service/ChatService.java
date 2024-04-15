package chatWebsocket.service;
import chatWebsocket.bean.ChatMessageDTO;
import chatWebsocket.bean.ChatRoomDTO;
import chatWebsocket.bean.ChatRoomJoinDTO;

import java.util.List;
public interface ChatService {
    // 채팅방 목록 조회
    List<ChatRoomDTO> selectChatRoomList();

    // 채팅방 만들기
    int openChatRoom(ChatRoomDTO room);

    // 채팅방 입장 + 내용 얻어오기
    List<ChatMessageDTO> joinChatRoom(ChatRoomJoinDTO join);

    // 채팅 메세지 삽입
    int insertMessage(ChatMessageDTO cm);

    // 채팅방 나가기
    int exitChatRoom(ChatRoomJoinDTO join);
}

