package com.cos.soomgyo.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.soomgyo.config.auth.PrincipalDetail;
import com.cos.soomgyo.model.Chat;
import com.cos.soomgyo.model.Room;
import com.cos.soomgyo.service.ChatService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RoomController {

    private final ChatService chatService;

    /**
     * 채팅방 참여하기
     * @param roomId 채팅방 id
     */
    @GetMapping("/chat/{roomId}")
    public String joinRoom(@PathVariable(required = false)  int roomId, Model model,@AuthenticationPrincipal PrincipalDetail principal) {
    	//room findbyid ==if(getstudent id ==principal.id)
        List<Chat> chatList = chatService.findAllChatByRoomId(roomId);
        System.out.println("ㅎㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㄻㄴㅇㄹㄹㅎ");
        Room userid=chatService.findRoomById(roomId);
        if(userid.getStudent().getId()==principal.getUser().getId()) {
        	 model.addAttribute("roomId", roomId);
             model.addAttribute("chatList", chatList);
             model.addAttribute("sender",principal.getUser().getName());
             model.addAttribute("receiver",userid.getTeacher().getProfilefilename());
             return "thymeleaf/room";
        }
        else if(userid.getTeacher().getId()==principal.getUser().getId()) {
        	 model.addAttribute("roomId", roomId);
             model.addAttribute("chatList", chatList);
             model.addAttribute("sender",principal.getUser().getName());
             model.addAttribute("receiver",userid.getStudent().getName());
             return "thymeleaf/room";
        }
        return "index";
        
       
    }

    /**
     * 채팅방 등록
     * @param form
     */
    @PostMapping("/room")
    public String createRoom(@RequestParam(value="StudentID")int Student,@RequestParam(value="TeacherID")int Teacher) {
        chatService.createRoom(Student,Teacher);
        return "redirect:/roomList";
    }

    /**
     * 채팅방 리스트 보기
     */
    @GetMapping("/roomList")
    public String roomList(Model model) {
        List<Room> roomList = chatService.findAllRoom();
        model.addAttribute("roomList", roomList);
        return "thymeleaf/roomList";
    }

    /**
     * 방만들기 폼
     */
    @GetMapping("/roomForm")
    public String roomForm() {
        return "thymeleaf/roomForm";
    }

}
