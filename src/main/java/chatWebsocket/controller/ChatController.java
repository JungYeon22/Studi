        package chatWebsocket.controller;


        import org.springframework.web.bind.annotation.GetMapping;
        import org.springframework.web.bind.annotation.RequestParam;
        import chatWebsocket.bean.ChatMessageDTO;
        import chatWebsocket.bean.ChatRoomDTO;
        import chatWebsocket.service.ChatService;
        import lombok.extern.log4j.Log4j;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.annotation.*;
        import org.springframework.web.servlet.mvc.support.RedirectAttributes;
        import user.bean.UserDTO;

        import javax.servlet.http.HttpSession;
        import java.util.List;

        @Controller
        @SessionAttributes({"userDTO", "chatRoomNo"})
        @RequestMapping(value = "/chat")
        public class ChatController {
            @Autowired
            private ChatService service;

            // 채팅방 목록 조회
            @GetMapping("/chatRoomList")
            public String chattingList(Model model) {
                List<ChatRoomDTO> chatRoomList = service.selectChatRoomList();
                model.addAttribute("chatRoomList", chatRoomList);
                return "chat/chatRoomList";
            }

            // 채팅방 만들기
            @GetMapping("/openChatRoom")
            public String openChatRoom(HttpSession session, Model model,
                                       @RequestParam("title") String title, RedirectAttributes ra) {

                // 세션에서 회원 정보를 가져옵니다.
                UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
                if (userDTO == null || userDTO.getUserId() == null) {
                    // 로그인되어 있지 않은 경우
                    ra.addFlashAttribute("message", "로그인이 필요합니다.");
                    return "redirect:/user/loginForm"; // 로그인 페이지로 리다이렉트
                }

                // 로그인된 사용자의 정보가 올바르게 가져와졌을 때만 이후 로직을 수행합니다.
                try {
                    // 채팅방 DTO를 생성하고 필드 값을 설정합니다.
                    System.out.println("전달된 제목: " + title); // 콘솔에 제목 값 출력
                    ChatRoomDTO chatRoomDTO = new ChatRoomDTO();
                    chatRoomDTO.setMemberNo(userDTO.getUserId());
                    chatRoomDTO.setTitle(title); // 채팅방 제목을 설정합니다.

                    // 채팅방을 열고 결과를 받습니다.
                    int chatRoomNo = service.openChatRoom(chatRoomDTO);

                    // 채팅방 열기에 성공한 경우
                    if (chatRoomNo > 0) {
                        // 채팅방 생성 후 바로 해당 채팅방으로 이동하도록 리다이렉트합니다.
                        return "redirect:/chat/chatRoom/" + chatRoomNo;
                    } else {
                        // 채팅방 열기에 실패한 경우
                        ra.addFlashAttribute("message", "채팅방 만들기 실패");
                        return "redirect:/chat/chatRoomList"; // 채팅방 목록 페이지로 리다이렉트
                    }
                } catch (Exception e) {
                    // 채팅방 열기 도중에 예외가 발생한 경우
                    e.printStackTrace();
                    ra.addFlashAttribute("message", "채팅방을 열 수 없습니다.");
                    return "redirect:/chat/chatRoomList"; // 채팅방 목록 페이지로 리다이렉트
                }
            }

            // 채팅방 입장
            @GetMapping("/chatRoom/{chatRoomNo}")
            public String joinChatRoom(HttpSession session,
                                       Model model,
                                       @PathVariable("chatRoomNo") int chatRoomNo,
                                       RedirectAttributes ra) {
                UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
                if (userDTO == null || userDTO.getUserId() == null) {
                    // 로그인되어 있지 않은 경우
                    ra.addFlashAttribute("message", "로그인이 필요합니다.");
                    return "redirect:/loginForm"; // 로그인 페이지로 리다이렉트
                } else {
                    // 채팅방 페이지로 이동합니다.
                    System.out.println("사용자 " + userDTO.getUserId() + "가 채팅방 " + chatRoomNo + "에 입장하였습니다.");
                    model.addAttribute("title", "채팅방 " + chatRoomNo);
                    return "chat/chatRoom"; // 수정: 리다이렉션 제거하고 해당 페이지로 직접 이동
                }
            }
        }
            // 채팅방 나가기
         /*   @GetMapping("/chat/exit")
            @ResponseBody
            public int exitChatRoom(@ModelAttribute("loginMember") Member loginMember,
                                    ChatRoomJoinDTO join) {
                join.setMemberNo(loginMember.getMemberNo());

                return service.exitChatRoom(join);
            }
        }*/

