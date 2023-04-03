package com.cos.soomgyo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.soomgyo.model.Youtube;





public interface youtubeRepository extends JpaRepository<Youtube,Integer>{
	Optional<Youtube> findByCategory(String category);
	
	
	
}
