package com.cos.soomgyo.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cos.soomgyo.model.Users;



public interface UserRepositroy extends JpaRepository<Users,Integer>{
	Optional<Users> findByUserid(String userid);
	boolean existsByUserid(String userid);
	boolean existsByEmail(String email);
	Optional<Users> findByEmail(String email);
	
	

	

}

