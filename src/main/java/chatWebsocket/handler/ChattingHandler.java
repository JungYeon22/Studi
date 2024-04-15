package chatWebsocket.handler;


import chatWebsocket.bean.ChatMessageDTO;
import chatWebsocket.service.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import user.bean.UserDTO;

import java.util.*;

@Component
@Log4j
public class ChattingHandler extends TextWebSocketHandler {

    @Autowired
    private ChatService chatservice;
    private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());


    //연결
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println(session.getId()+"연결됨");

        sessions.add(session);

    }
    //메세지 처리
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

        // TextMessage : 웹소켓을 이용해 텍스트로 전달된 메시지가 담겨있는 객체 .

        // payload : 전송되는 데이터
        // message.getPayload()  :  JSON
        System.out.println("전달된 메시지 : "+ message.getPayload());

        // Jackson 라이브러리 : Java에서 JSON 을 다루기위한 라이브러리

        // Jackson-databind 라이브러리 : ObjectMapper 객체를 이용해서
        //                              JSON 데이터를 특정 VO 필드에 맞게 자동 매핑

        ObjectMapper objectMapper = new ObjectMapper();

        ChatMessageDTO chatMessageDTO = objectMapper.readValue(message.getPayload(), ChatMessageDTO.class);

        // 시간 세팅
        chatMessageDTO.setCreateDate( new Date( System.currentTimeMillis()));
        System.out.println(chatMessageDTO);

        // 채팅 메시지 DB 삽입
        int result = chatservice.insertMessage(chatMessageDTO);

        if ( result > 0 ) {
            // 같은 방에 접속중인 클라이언트에게만 메시지 보내기
            //  --> Set<WebSocketSession> 에서 같은 방 클라이언트만 골라내기
            for ( WebSocketSession s : sessions ) {

                // WebSocketSession == HttpSession (로그인정보,채팅방정보) 을 가로챈것..
                int chatRoomNo = (Integer) s.getAttributes().get("chatRoomNo");

                // WebSocketSession에 담겨있는 채팅장 번호와
                // 메시지에 담겨있는 채팅방 번호가 같은 경우  === 같은방 클라이언트
                if ( chatRoomNo == chatMessageDTO.getChatRoomNo() ) {
                    //같은방 클라이언트에게 JSON 형식의 메시지를 보냄
                    s.sendMessage(new TextMessage(objectMapper.writeValueAsString(chatMessageDTO)));
                }
            }
        }
    }

    //연결종료
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

        sessions.remove(session); // 웹소켓연결 종료시 종료된 WebSocketSession을 Set에서 제거

    }
}