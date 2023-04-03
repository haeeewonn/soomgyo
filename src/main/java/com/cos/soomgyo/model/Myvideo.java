package com.cos.soomgyo.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="myvideo")
@SequenceGenerator(
			name="MYVIDEO_SEQ_GENERATOR"
			,sequenceName = "MYVIDEO_SEQ"
			,initialValue = 1
			,allocationSize = 1
		)
@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity

public class Myvideo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="MYVIDEO_SEQ_GENERATOR")
	private int id;
	
	@ManyToOne
    @JoinColumn(name = "UserID")
    private Users users;

    @ManyToOne
    @JoinColumn(name = "YoutubeID")
    private Youtube youtube;
    
    private String memo ;
    
    
}
