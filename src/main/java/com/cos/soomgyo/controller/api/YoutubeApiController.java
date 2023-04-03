package com.cos.soomgyo.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.soomgyo.config.auth.PrincipalDetail;
import com.cos.soomgyo.dto.ResponseDto;
import com.cos.soomgyo.model.Myvideo;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.model.Youtube;
import com.cos.soomgyo.model.likes;
import com.cos.soomgyo.service.YoutubeService;

@RestController
public class YoutubeApiController {
		@Autowired
		private YoutubeService youtubeService;
		
		@PostMapping("/auth/updatevideo")//회원가입 로직이 실행되는 부분
		public ResponseDto<Integer> save(@RequestBody Youtube youtube) {
			youtubeService.영상저장(youtube);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);

		}
		@PostMapping("/savememo/{youtube}")
		public ResponseDto<Integer> memosave(@RequestBody Myvideo myvideo,@AuthenticationPrincipal PrincipalDetail principal, @PathVariable Youtube youtube) {
			System.out.println(myvideo+"asdf"+principal.getUser()+"asdfasd"+youtube);
			youtubeService.메모저장(myvideo,principal.getUser(),youtube);
			
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);

		}
		@PostMapping("/ckmemo/{youtube}")
		public boolean ckmemo (@AuthenticationPrincipal PrincipalDetail principal, @PathVariable Youtube youtube) {
			return youtubeService.메모확인(principal.getUser(), youtube);
		}
		@PutMapping("/updatememo/{youtube}")
		public ResponseDto<Integer> updatememo (@RequestBody Myvideo myvideo,@AuthenticationPrincipal PrincipalDetail principal, @PathVariable Youtube youtube) {
			youtubeService.메모수정(myvideo,principal.getUser(),youtube);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}
		@PostMapping("/likeVideo/{youtube}")
		public boolean likeVideo (@AuthenticationPrincipal PrincipalDetail principal, @PathVariable Youtube youtube) {
			return youtubeService.관심확인(principal.getUser(),youtube);
			
		}
		@PostMapping("/savelike/{youtube}")
		public ResponseDto<Integer> likesave(likes like,@AuthenticationPrincipal PrincipalDetail principal, @PathVariable Youtube youtube) {
			youtubeService.좋아요(like,principal.getUser(),youtube);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);

		}
		@DeleteMapping("/deletelike/{youtube}")
		public  ResponseDto<Integer> likedelete(@PathVariable Youtube youtube,@AuthenticationPrincipal PrincipalDetail principal ){
			youtubeService.싫어요(principal.getUser(),youtube);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		}

}
