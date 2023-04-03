package com.cos.soomgyo.model;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "REPLY_SEQ_GENERATOR"
	    , sequenceName = "Reply_SEQ3"
	    , initialValue = 1
	    , allocationSize = 1
	)
public class Reply {
	
	@Id//기본키
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REPLY_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=200)
	private String content;
	
	@ManyToOne //여러개의 답변은 하나의 게시글에 존재
	@JoinColumn(name="communityId")
	private Community community;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private Users users;
	
	@CreationTimestamp 
	private Timestamp createDate;
	
	public void save(Community community, Users user) {
		this.community=community;
		this.users=user;
	}
}
