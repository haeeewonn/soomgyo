package com.cos.soomgyo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="youtube")
@SequenceGenerator(
			name="YOUTUBE_SEQ_GENERATOR"
			,sequenceName = "YOUTUBE_SEQ"
			,initialValue = 1
			,allocationSize = 1
		)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity

public class Youtube {
	
	@Id //기본키
	 @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="YOUTUBE_SEQ_GENERATOR")
	private int id;
	
	@Column(nullable=false, length=500)
	private String title;
	
	@Column(nullable=false)
	private String thumbnail;
	
	@Column(nullable=false)
	private String videoUrl;
	
	@Column(nullable=false, length=50)
	private String category;
	
	@OneToOne(mappedBy="youtube", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private likes likes;

	
	
}
