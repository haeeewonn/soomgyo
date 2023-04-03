package com.cos.soomgyo.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.soomgyo.model.Community;
import com.cos.soomgyo.model.Users;

public interface CommunityRepository extends JpaRepository<Community, Integer>{

	Page<Community> findByNotice(int notice, Pageable pageable);
	List<Community> findByUsers(Users user);
}
