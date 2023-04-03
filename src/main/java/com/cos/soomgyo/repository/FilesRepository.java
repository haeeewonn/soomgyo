package com.cos.soomgyo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.soomgyo.model.Files;

public interface FilesRepository extends JpaRepository<Files, Integer>{
	Files findById(int id);
}
