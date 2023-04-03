package com.cos.soomgyo.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="chat")
@SequenceGenerator(
			name="CHAT_SEQ_GENERATOR"
			,sequenceName = "CHAT_SEQ"
			,initialValue = 1
			,allocationSize = 1
		)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Chat {

    @Id  @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="CHAT_SEQ_GENERATOR")
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "roomID")
    private Room room;

    private String sender;

    @Column
    private String message;

    @CreatedDate
    @Column
    private LocalDateTime sendDate;
    
    @Builder
    public Chat(Room room, String sender, String message) {
        this.room = room;
        this.sender = sender;
        this.message = message;
        this.sendDate = LocalDateTime.now();
    }

    /**
     * 채팅 생성
     * @param room 채팅 방
     * @param sender 보낸이
     * @param message 내용
     * @return Chat Entity
     */
    public static Chat createChat(Room room, String sender, String message) {
        return Chat.builder()
                .room(room)
                .sender(sender)
                .message(message)
                .build();
    }
}
