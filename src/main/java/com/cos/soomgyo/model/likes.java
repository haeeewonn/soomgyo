package com.cos.soomgyo.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="likes")
@SequenceGenerator(
			name="LIKES_SEQ_GENERATOR"
			,sequenceName = "LIKES_SEQ"
			,initialValue = 1
			,allocationSize = 1
		)
@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity

public class likes {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="LIKES_SEQ_GENERATOR")
	private int id;
	
	@ManyToOne
    @JoinColumn(name = "UserID")
    private Users users;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "YoutubeID")
    private Youtube youtube;
    
    private String likes ;
    
}
