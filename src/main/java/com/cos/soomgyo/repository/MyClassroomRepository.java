package com.cos.soomgyo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.soomgyo.model.FindTeacher;
import com.cos.soomgyo.model.likes;

public interface MyClassroomRepository extends JpaRepository<likes, Integer>{
	Page<likes> findAll(Pageable pageable);
}
