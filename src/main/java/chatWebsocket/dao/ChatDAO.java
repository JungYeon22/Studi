    package chatWebsocket.dao;

    import chatWebsocket.bean.ChatMessageDTO;
    import chatWebsocket.bean.ChatRoomDTO;
    import chatWebsocket.bean.ChatRoomJoinDTO;
    import org.mybatis.spring.SqlSessionTemplate;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Repository;

    import java.util.List;

    @Repository
    public class ChatDAO {

        @Autowired
        private SqlSessionTemplate sqlSession;

        /** 채팅방 목록 조회
         * @return  chatRoomList
         */
        public List<ChatRoomDTO> selectChatRoomList() {
            return sqlSession.selectList("chattingMapper.selectChatRoomList");
        }

        /** 채팅방 만들기
         * @param room
         * @return chatRoomNo
         */
        public int openChatRoom(ChatRoomDTO room) {

            int result = sqlSession.insert("chattingMapper.openChatRoom", room);

            if(result > 0) {return room.getChatRoomNo();}
            else {
                return 0;
            }
        }


        /** 채팅방 참여 여부 확인
         * @param join
         * @return result
         */
        public int joinCheck(ChatRoomJoinDTO join) {
            return sqlSession.selectOne("chattingMapper.joinCheck", join);
        }


        /** 채팅방 참여하기
         * @param join
         */
        public void joinChatRoom(ChatRoomJoinDTO join) {
            sqlSession.insert("chattingMapper.joinChatRoom", join);
        }


        /** 채팅 메세지 목록 조회
         * @param chatRoomNo
         * @return list
         */
        public List<ChatMessageDTO> selectChatMessage(int chatRoomNo) {
            return sqlSession.selectList("chattingMapper.selectChatMessage", chatRoomNo);
        }

        /** 채팅 메세지 삽입
         * @param cm
         * @return result
         */
        public int insertMessage(ChatMessageDTO cm) {
            return sqlSession.insert("chattingMapper.insertMessage", cm);
        }

        /** 채팅방 나가기
         * @param join
         * @return result
         */
        public int exitChatRoom(ChatRoomJoinDTO join) {
            return sqlSession.delete("chattingMapper.exitChatRoom", join);
        }

        /** 채팅방 인원 수 확인
         * @param chatRoomNo
         * @return cnt
         */
        public int countChatRoomMember(int chatRoomNo) {
            return sqlSession.selectOne("chattingMapper.countChatRoomMember", chatRoomNo);
        }

        /** 채팅방 닫기
         * @param chatRoomNo
         * @return result
         */
        public int closeChatRoom(int chatRoomNo) {
            return sqlSession.update("chattingMapper.closeChatRoom", chatRoomNo);
        }
    }
