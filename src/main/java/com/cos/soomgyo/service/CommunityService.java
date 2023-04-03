package com.cos.soomgyo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cos.soomgyo.model.Community;
//import com.cos.soomgyo.model.Files;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.repository.CommunityRepository;

@Service
public class CommunityService {
	@Autowired
	private CommunityRepository communityRepository;

	
	@Transactional
	public void 글쓰기(Community community, Users user) {
		community.setCount(0);
		community.setUsers(user);
		
		communityRepository.save(community);
	}
	@Transactional
	public void 공지사항(Community community, Users user) {
		community.setCount(0);
		community.setUsers(user);
		community.setNotice(1);
		community.setCategory("공지사항");
		communityRepository.save(community);
	}

	
	@Transactional(readOnly = true)
	public Page<Community> 글목록(int notice, Pageable pageable){
		return communityRepository.findByNotice(notice,pageable);
	}
	@Transactional(readOnly = true)
	public List<Community> 내글목록(Users user){
		return communityRepository.findByUsers(user);
		}

	@Transactional(readOnly = true)
	public Community 글상세보기(int id) {
		return communityRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디 찾을수없음");
				});
	}
	
	@Transactional
	public Community 글상세보기조회수(int id) {
		Community community=communityRepository.findById(id)
		.orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패 : 아이디 찾을수없음");
		});
		int cnt=community.getCount();
		cnt++;
		community.setCount(cnt);
		communityRepository.save(community);
		return communityRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디 찾을수없음");
				});
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		communityRepository.deleteById(id);
	}
	@Transactional
	public void 글수정하기(Community requestCommunity, Users user, MultipartFile file, int id) {
		System.out.println("글수정하기 service"+requestCommunity.getTitle()+","+requestCommunity.getCategory()+","+requestCommunity.getId()+","+id);
		Community commu = communityRepository.findById(id).orElseThrow(()->{
			System.out.println("실행");
			return new IllegalArgumentException("글 상세보기 실패 : 아이디 찾을수없음");
		});
		commu.setCategory(requestCommunity.getCategory());
		commu.setTitle(requestCommunity.getTitle());
		commu.setContent(requestCommunity.getContent());
		commu.setFileOriName(requestCommunity.getFileOriName());
		commu.setFilename(requestCommunity.getFilename());
		commu.setFileurl(requestCommunity.getFileurl());
	}
}
