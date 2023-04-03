package com.cos.soomgyo.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.repository.UserRepositroy;



@Service //빈등록
public class PrincipalDetailService implements UserDetailsService {
	
	@Autowired
	private UserRepositroy userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		System.out.println(userid);
		Users principal = userRepository.findByUserid(userid)
				.orElseThrow(()->{
					return new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다.: "+userid);
				});
		return new PrincipalDetail(principal);
		//시큐리티 세션에 유저 정보가 저장이 된다.
		//그때 타입이 userdetails 타입이다.
	}

}
