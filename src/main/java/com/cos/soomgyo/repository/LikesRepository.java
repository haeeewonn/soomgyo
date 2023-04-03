package com.cos.soomgyo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.model.Youtube;
import com.cos.soomgyo.model.likes;

public interface LikesRepository extends JpaRepository<likes, Integer>{
	boolean existsByUsersAndYoutube (Users user,Youtube youtube);
	Optional<likes> deleteByUsersAndYoutube(Users user,Youtube youtube);
}