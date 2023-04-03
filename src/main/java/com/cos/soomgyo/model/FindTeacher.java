package com.cos.soomgyo.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="teacher")
@SequenceGenerator(
		name="TEACHER_SEQ_GENERATOR"
		,sequenceName = "TEACHER_SEQ"
		,initialValue = 1
		,allocationSize = 1
	)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class FindTeacher {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="TEACHER_SEQ_GENERATOR")
	private int id;
	
	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name="userId")
	private Users users;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	private String introduce;
	
	@Lob
	private String lessoninfo;
	
	
	private String filename;
	
	private String fileOriName;
	
	private String fileurl;
	
	@ColumnDefault("0")
	private int premium;
	
}
