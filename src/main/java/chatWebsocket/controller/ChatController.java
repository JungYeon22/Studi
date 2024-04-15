package chatWebsocket.controller;



import chatWebsocket.bean.ChatMessageDTO;
import chatWebsocket.bean.ChatRoomDTO;
import chatWebsocket.bean.ChatRoomJoinDTO;
import chatWebsocket.service.ChatService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
        import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@SessionAttributes({"loginMember", "chatRoomNo"})
@RequestMapping(value = "chat")
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
                               ChatRoomDTO room, RedirectAttributes ra) {

        Integer memberNo = (Integer) session.getAttribute("memberNo");
        if (memberNo == null) {
            // 로그인되어 있지 않은 경우
            ra.addFlashAttribute("message","로그인이 필요합니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        room.setMemberNo(memberNo);

        int chatRoomNo = service.openChatRoom(room);

        String path = "redirect:/chat/";

        if (chatRoomNo > 0) {
            path += "room/" + chatRoomNo;
        } else {
            path += "roomList";
            ra.addFlashAttribute("message", "채팅방 만들기 실패");
        }
        return path;
    }

    // 채팅방 입장
    @GetMapping("/room/{chatRoomNo}")
    public String joinChatRoom(HttpSession session, Model model,
                               @PathVariable("chatRoomNo") int chatRoomNo,
                               ChatRoomJoinDTO join,
                               RedirectAttributes ra) {
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        if (memberNo == null) {
            // 로그인되어 있지 않은 경우
            ra.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        join.setMemberNo(memberNo);
        List<ChatMessageDTO> list = service.joinChatRoom(join);

        if (list != null) {
            model.addAttribute("list", list);
            model.addAttribute("chatRoomNo", chatRoomNo); // session에 올림
            return "chat/chatRoom";
        } else {
            ra.addFlashAttribute("message", "채팅방이 존재하지 않습니다.");
            return "redirect:../roomList";
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
}
