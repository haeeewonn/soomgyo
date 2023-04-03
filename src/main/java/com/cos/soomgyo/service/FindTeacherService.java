package com.cos.soomgyo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cos.soomgyo.model.FindTeacher;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.repository.FindTeacherRepository;
import com.cos.soomgyo.repository.UserRepositroy;

@Service
public class FindTeacherService {
	@Autowired
	private FindTeacherRepository findTeacherRepository;
	@Autowired
	private UserRepositroy userRepositroy;
	
	@Transactional
	public void 강사정보등록(Users user, FindTeacher findTeacher) {
		
		if(findTeacherRepository.existsByUsers(user)) {
			
			FindTeacher teacher=findTeacherRepository.findByUsers(user).orElseThrow();
			if(findTeacher.getFilename()==null) {
			teacher.setFilename(findTeacher.getFilename());
			teacher.setFileOriName(findTeacher.getFileOriName());
			teacher.setFileurl(findTeacher.getFileurl());
			}
			teacher.setIntroduce(findTeacher.getIntroduce());;
			teacher.setLessoninfo(findTeacher.getLessoninfo());
			teacher.setPremium(findTeacher.getPremium());
			teacher.setTitle(findTeacher.getTitle());
			return;
		}
		else {
			System.out.println(findTeacherRepository.existsByUsers(user));
		findTeacherRepository.save(findTeacher);
		}
	}
	@Transactional
	public Page<FindTeacher> 글목록(Pageable pageable){
		return findTeacherRepository.findAll(pageable);
	}
	@Transactional
	public  List<FindTeacher> 프리미엄 (int pre){
		return findTeacherRepository.findByPremium(pre);
	}
	@Transactional
	public FindTeacher 글상세보기(int id) {
		return findTeacherRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디 찾을수없음");
				});
	}
	@Transactional
	public void 프리미엄수락(int pre) {
		FindTeacher tea = findTeacherRepository.findById(pre).orElseThrow();
		tea.setPremium(2);
	}
	@Transactional
	public void 프리미엄거절(int pre) {
		FindTeacher tea = findTeacherRepository.findById(pre).orElseThrow();
		tea.setPremium(0);
	}
	
}
