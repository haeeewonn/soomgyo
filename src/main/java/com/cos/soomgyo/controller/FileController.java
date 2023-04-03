package com.cos.soomgyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cos.soomgyo.repository.FilesRepository;
import com.cos.soomgyo.service.FileService;

@Controller
public class FileController {
	@Autowired
	FileService fileService;
	
	@Autowired
	FilesRepository filesRepository;
	
}
