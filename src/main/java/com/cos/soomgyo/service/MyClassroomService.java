package com.cos.soomgyo.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cos.soomgyo.model.likes;
import com.cos.soomgyo.repository.MyClassroomRepository;

@Service
public class MyClassroomService {
	@Autowired
	private MyClassroomRepository classroomRepository;
	
	@Transactional
	public Page<likes> 영상목록(Pageable pageable){
		return classroomRepository.findAll(pageable);
	}
}
