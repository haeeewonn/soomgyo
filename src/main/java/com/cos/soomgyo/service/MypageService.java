package com.cos.soomgyo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cos.soomgyo.config.auth.PrincipalDetail;
import com.cos.soomgyo.model.FindTeacher;
import com.cos.soomgyo.model.Room;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.model.Youtube;
import com.cos.soomgyo.repository.FindTeacherRepository;
import com.cos.soomgyo.repository.RoomRepository;
import com.cos.soomgyo.repository.UserRepositroy;

@Service
public class MypageService {
	@Autowired
	private UserRepositroy userRepositroy;
	@Autowired
	private FindTeacherRepository findteacher;
	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private BCryptPasswordEncoder encodeer;

	@Transactional
	public void 회원정보수정(int id, Users user, MultipartFile file) {
		System.out.println("회원정보수정 비밀번호 " + user.getPassword());
		Users persistance = userRepositroy.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("회원정보 수정 실패");
		});
		String rawPassword = user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		persistance.setPassword(encPassword);
		persistance.setPhone(user.getPhone());
		persistance.setCategory(user.getCategory());
		System.out.println(user.getProfilefilename());
		if (user.getProfilefilename() != null) {
			persistance.setProfilefilename(user.getProfilefilename());
			persistance.setProfilefileOriName(user.getProfilefileOriName());
			persistance.setProfilefileurl(user.getProfilefileurl());
		}
	}
	
	@Transactional
	public void 회원탈퇴(int id) {
		userRepositroy.deleteById(id);
	}
	@Transactional
	public FindTeacher 강사정보(Users user){
		
		if(findteacher.existsByUsers(user)) {
		FindTeacher ft=findteacher.findByUsers(user).orElseThrow();
		return ft;
		}
		return null;
		
		
		
	}
	@Transactional
	public boolean 상담중복(int student,int teacher) {
		Users stu = userRepositroy.findById(student).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Users tea = userRepositroy.findById(teacher).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
	return roomRepository.existsByStudentAndTeacher(stu,tea);
		
	
	}
	@Transactional
	public void 상담신청(int student, int teacher) {
		Users stu = userRepositroy.findById(student).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Users tea = userRepositroy.findById(teacher).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Room room =new Room();
		room.setStudent(stu);
		room.setTeacher(tea);
		roomRepository.save(room);
		}
	@Transactional
	public List<Room> 레슨목록(Users user){
		if(roomRepository.existsByTeacher(user)) {
			List<Room> room=roomRepository.findByTeacher(user);
			return room;
			}
			return null;
	
	}
	@Transactional
	public List<Room> 레슨목록학생(Users user){
		if(roomRepository.existsByStudent(user)) {
			List<Room> room=roomRepository.findByStudent(user);
			return room;
		}
		return null;
		
	}
	@Transactional
	public void 레슨승인(int student, int teacher) {
		Users stu = userRepositroy.findById(student).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Users tea = userRepositroy.findById(teacher).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Room room=roomRepository.findByStudentAndTeacher(stu, tea).orElseThrow();
		room.setLesson(1);
	}
	@Transactional
	public void 레슨거절(int student, int teacher) {
		Users stu = userRepositroy.findById(student).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Users tea = userRepositroy.findById(teacher).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		Room room=roomRepository.findByStudentAndTeacher(stu, tea).orElseThrow();
		
		roomRepository.deleteById(room.getId());
	}
}
