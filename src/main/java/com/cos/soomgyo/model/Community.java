package com.cos.soomgyo.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OrderBy;
import org.springframework.data.annotation.CreatedDate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="community")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder //빌더 패턴
@Entity
@SequenceGenerator(
		name = "COMMUNITY_SEQ_GENERATOR"
	    , sequenceName = "COMMUNITY_SEQ2"
	    , initialValue = 1
	    , allocationSize = 1
	)

public class Community {
	@Id //기본키
	 @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="COMMUNITY_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	//대용량 데이터
	private String content;
	
	private int count; //조회수
	
	@ManyToOne(fetch = FetchType.EAGER)
	//Many=Board, User = One 한명이 여러개의 게시글을 쓸 수 있다.
	@JoinColumn(name="userId")
	private Users users; //자바는 오브젝트를 저장할 수 있지만 DB는 오브젝트를 저장할 수 없기에 
	                     //외래키를 사용한다.
	
	@JsonIgnoreProperties({"community"})
	@OneToMany (mappedBy="community", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	//mappedBy는 연관관계의 주인이 아니라, DB에 컬럼을 만들지 않는다는 의미
	//하나의 게시글에는 여러개 댓글 작성
	private List<Reply> replyList;
	
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@Column(nullable=false, length=100)
	private String category;
	
	@ColumnDefault("0")
	private int notice;
	
	private String filename;
	private String fileOriName;
	private String fileurl;
	
	
}

