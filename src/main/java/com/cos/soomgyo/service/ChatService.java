package com.cos.soomgyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cos.soomgyo.model.Chat;
import com.cos.soomgyo.model.Room;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.repository.ChatRepository;
import com.cos.soomgyo.repository.RoomRepository;
import com.cos.soomgyo.repository.UserRepositroy;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatService {
    private final RoomRepository roomRepository;
    private final ChatRepository chatRepository;
    @Autowired
    private UserRepositroy userRepositroy;
    /**
     * 모든 채팅방 찾기
     */
    public List<Room> findAllRoom() {
        return roomRepository.findAll();
    }

    /**
     * 특정 채팅방 찾기
     * @param id room_id
     */
    public Room findRoomById(int id) {
        return roomRepository.findById(id).orElseThrow();
    }
 

    /**
     * 채팅방 만들기
     * @param name 방 이름
     */
    public Room createRoom(int Student, int Teacher) {
    	Users stu =userRepositroy.findById(Student).orElseThrow();
    	Users tea =userRepositroy.findById(Teacher).orElseThrow();
    	Room room=new Room();
    	room.setStudent(stu);
    	room.setTeacher(tea);
        return roomRepository.save(room);
    }

    /////////////////
    
    /**
     * 채팅 생성
     * @param roomId 채팅방 id
     * @param sender 보낸이
     * @param message 내용
     */
    public Chat createChat(int roomId, String sender, String message) {
        Room room = roomRepository.findById(roomId).orElseThrow();  //방 찾기 -> 없는 방일 경우 여기서 예외처리
        return chatRepository.save(Chat.createChat(room, sender, message));
    }

    /**
     * 채팅방 채팅내용 불러오기
     * @param roomId 채팅방 id
     */
    public List<Chat> findAllChatByRoomId(int roomId) {
    	  Room room = roomRepository.findById(roomId).orElseThrow();  //방 찾기 -> 없는 방일 경우 여기서 예외처리
        return chatRepository.findAllByRoomIdOrderBySendDate(room.getId());
    }


}
