package com.cos.soomgyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.soomgyo.config.auth.PrincipalDetail;
import com.cos.soomgyo.model.Youtube;
import com.cos.soomgyo.service.MyClassroomService;
import com.cos.soomgyo.service.YoutubeService;

@Controller
public class MyClassController {
	@Autowired
	private MyClassroomService classroomService;
	@Autowired
	private YoutubeService youtubeService;
	
	//내 강의실 좋아요된 영상 뿌려주기
	@GetMapping("/MyClassroom")
	public String myclass(Model model, @PageableDefault(size=10, sort = "id", 
			direction = Sort.Direction.DESC)Pageable pageable) {
		model.addAttribute("myclass", classroomService.영상목록(pageable));
		return "board/MyClassroom";
	}
	
	//내 강의실에 담긴 영상 디테일 페이지로 이동 
	@GetMapping("/video/{youtube}")
	public String detailvideo(@PathVariable Youtube youtube, Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("myclass", youtubeService.동영상상세보기(youtube));
		model.addAttribute("myvideo", youtubeService.메모보기(principal.getUser()));
		return "board/VideoDetail";
	}

}
