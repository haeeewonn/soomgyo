package com.cos.soomgyo.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.soomgyo.dto.ResponseDto;
import com.cos.soomgyo.model.Room;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.service.MypageService;

@RestController
public class MypageApiController {
	@Autowired
	MypageService mypageService;

	@PostMapping("/counsel/{student}/{teacher}")
	public ResponseDto<Integer> counsel(@PathVariable int student, @PathVariable int teacher) {

		mypageService.상담신청(student, teacher);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/counselck/{student}/{teacher}")
	public boolean counselck(@PathVariable int student, @PathVariable int teacher) {

		System.out.println("중복실행");
		return mypageService.상담중복(student, teacher);
	}
	

	
}
