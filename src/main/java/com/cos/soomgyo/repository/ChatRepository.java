package com.cos.soomgyo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.cos.soomgyo.model.Chat;
import com.cos.soomgyo.model.Room;

public interface ChatRepository extends CrudRepository<Chat, Integer> {

    List<Chat> findAllByRoomIdOrderBySendDate(int roomId);
}
