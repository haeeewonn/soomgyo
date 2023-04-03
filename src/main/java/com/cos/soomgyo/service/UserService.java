package com.cos.soomgyo.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cos.soomgyo.model.RoleType;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.repository.UserRepositroy;

@Service
public class UserService {
	@Autowired
	private UserRepositroy userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encodeer;
	
	@Transactional
	public void 회원가입(Users user, String role) {
		String rawPassword =user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		user.setPassword(encPassword);

		if(role.equals("student")) {
			user.setRoles(RoleType.STUDENT);
		}
		else if (role.equals("teacher")){
			user.setRoles(RoleType.TEACHER);
		}
		else {
			user.setRoles(RoleType.ADMIN);
		}
		userRepository.save(user); //하나의 트랜젝션
	}
	public boolean idck(String id) {
	
		boolean result = userRepository.existsByUserid(id);

		return result;
	
	}
	public boolean mailck(String email) {
		System.out.println(email);
		boolean result = userRepository.existsByEmail(email);
		System.out.println(result);
		return result;
	
	}
	public Users fogetid(String email) {

		Users useremail = userRepository.findByEmail(email).orElseThrow(() -> {
			return new IllegalArgumentException();
		});
				
		return useremail;
		 
	}
	public Users fogetpwd(String userid) {
		
		Users useremail = userRepository.findByUserid(userid).orElseThrow(() -> {
			return new IllegalArgumentException();
		});
		
		return useremail;
		
	}
	@Transactional
	public void repwd(Users user) {
		Users persistance = userRepository.findByEmail(user.getEmail()).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		String rawPassword=user.getPassword();
		String encPassword= encodeer.encode(rawPassword);
		persistance.setPassword(encPassword);
		//회원수정 메서드종료 = 서비스종료  = 트랜잭션 종료= commit
		//영속화된 persistance 객체의 변화가 감지되면 더티체킹 되어 update문 날림.
	}
	@Transactional
	public Users findUser(int id) {
		return userRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		//회원수정 메서드종료 = 서비스종료  = 트랜잭션 종료= commit
		//영속화된 persistance 객체의 변화가 감지되면 더티체킹 되어 update문 날림.
	}
}


