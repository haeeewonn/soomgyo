package com.cos.soomgyo.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.soomgyo.dto.ResponseDto;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.service.UserService;

@RestController
public class UserApiController {
	@Autowired
	private UserService userService;
	
	
	@PostMapping("/auth/joinProc/{role}")//회원가입 로직이 실행되는 부분
	public ResponseDto<Integer> save(@RequestBody Users user, @PathVariable String role) {
		userService.회원가입(user,role);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);

	}
	@PostMapping("/auth/idCheck.do/{userid}")//아이디 중복확인
	public boolean idck(@PathVariable String userid) {
		
		boolean result=userService.idck(userid);

		return result;

	}
	@PostMapping("/auth/emailCheck.do/{email}")//이메일 중복확인
	public boolean mailck(@PathVariable String email) {
		boolean result=userService.mailck(email);

		return result;

	}
	
	@PostMapping("/auth/fogetid/{email}")//아이디 찾기
	public ResponseDto<String> fogetck(@PathVariable String email) {
		Users user = userService.fogetid(email);
		return new ResponseDto<String>(HttpStatus.OK.value(),user.getUserid());
	}
	@PostMapping("/auth/fogetpwd/{userid}")//비밀번호 찾기 중 아이디 확인->이메일 값가져옴
	public ResponseDto<String> fogetpwd(@PathVariable String userid) {

		Users user = userService.fogetpwd(userid);

		return new ResponseDto<String>(HttpStatus.OK.value(),user.getEmail());
	}
	
	@PutMapping("/auth/repassword")//비밀번호 찾기
	public ResponseDto<Integer> update(@RequestBody Users user) {
		//json 형태를 받기위한 RequestBody
		userService.repwd(user);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

	
	
	
}
