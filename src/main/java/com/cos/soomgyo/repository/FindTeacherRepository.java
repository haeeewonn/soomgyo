package com.cos.soomgyo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.soomgyo.model.Community;
import com.cos.soomgyo.model.FindTeacher;
import com.cos.soomgyo.model.Users;

public interface FindTeacherRepository extends JpaRepository<FindTeacher, Integer> {

	Page<FindTeacher> findAll(Pageable pageable);
	List<FindTeacher> findByPremium(int pre);
	boolean existsByUsers(Users user);
	Optional<FindTeacher> findByUsers(Users user);
	

}
