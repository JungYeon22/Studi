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

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@Component
@Log4j
public class ChattingHandler extends TextWebSocketHandler {

    @Autowired
    private ChatService chatService;

    private final Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info(session.getId() + " connected");
        UserDTO userDTO = (UserDTO) session.getAttributes().get("loginMember");
        if (userDTO != null) {
            session.getAttributes().put("userId", userDTO.getUserId());
        }
        sessions.add(session);
    }

    @Override

    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        log.info("Received message: " + payload);

        ObjectMapper objectMapper = new ObjectMapper();
        ChatMessageDTO chatMessageDTO = objectMapper.readValue(payload, ChatMessageDTO.class);
        log.info("Received chat message: " + chatMessageDTO);

        // 세션에서 사용자의 Name
        String userId = (String) session.getAttributes().get("userId");
        if (userId != null) {
            chatMessageDTO.setUserId(userId); // 가져온 userId를 메시지 DTO에 설정합니다.
        }

        int result = chatService.insertMessage(chatMessageDTO);

        if (result > 0) {
            int chatRoomNo = (Integer) session.getAttributes().get("chatRoomNo");
            sessions.stream()
                    .filter(s -> chatRoomNo == chatMessageDTO.getChatRoomNo())
                    .forEach(s -> sendMessage(s, chatMessageDTO, objectMapper));
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info(session.getId() + " disconnected");
        sessions.remove(session);
    }

    private void sendMessage(WebSocketSession session, ChatMessageDTO chatMessageDTO, ObjectMapper objectMapper) {
        try {
            session.sendMessage(new TextMessage(objectMapper.writeValueAsString(chatMessageDTO)));
        } catch (IOException e) {
            log.error("Failed to send message to session " + session.getId(), e);
        }
    }
}