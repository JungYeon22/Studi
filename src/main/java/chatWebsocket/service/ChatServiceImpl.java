package chatWebsocket.service;

import chatWebsocket.bean.ChatMessageDTO;
import chatWebsocket.bean.ChatRoomDTO;
import chatWebsocket.bean.ChatRoomJoinDTO;
import chatWebsocket.dao.ChatDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import user.bean.UserDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ChatServiceImpl implements ChatService{
@Autowired
    private ChatDAO chatDAO;


@Autowired
private HttpSession session;

    // 채팅 목록 조회
    @Override
    public List<ChatRoomDTO> selectChatRoomList() {

        System.out.println("ChatService의 selectChatRoomList 메소드가 호출되었습니다.");
        return chatDAO.selectChatRoomList();
    }

    // 채팅방 만들기
    @Override
    public int openChatRoom(ChatRoomDTO room) {
        System.out.println("채팅방 만들기 성공");
        return chatDAO.openChatRoom(room);
    }

    // 채팅방 입장 + 내용 얻어오기
    @Override
    public List<ChatMessageDTO> joinChatRoom(ChatRoomJoinDTO join) {

        // 현재 회원이 해당 채팅방에 참여하고 있는지 확인
        int result = chatDAO.joinCheck(join);

        if(result == 0) { // 참여하고 있지 않은 경우 참여
            chatDAO.joinChatRoom(join);
        }
        // 채팅 메세지 목록 조회
        return chatDAO.selectChatMessage(join.getChatRoomNo());
    }


    // 채팅 메세지 삽입
    @Override
    public int insertMessage(ChatMessageDTO cm) {

		//cm.setMessage(Util.XSSHandling(cm.getMessage()));
      // cm.setMessage(Util.newLineHandling(cm.getMessage()));

        return chatDAO.insertMessage(cm);
    }

    // 채팅방 나가기
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int exitChatRoom(ChatRoomJoinDTO join) {

        // 채팅방 나가기
        int result = chatDAO.exitChatRoom(join);

        if(result > 0) { // 채팅방 나가기 성공 시

            // 현재 방에 몇명이 있나 확인
            int cnt = chatDAO.countChatRoomMember(join.getChatRoomNo());

            // 0명일 경우 방 닫기
            if(cnt == 0) {
                result = chatDAO.closeChatRoom(join.getChatRoomNo());
            }
        }
        return result;
    }
}