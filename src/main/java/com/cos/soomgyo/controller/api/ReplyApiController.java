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
import com.cos.soomgyo.model.Reply;
import com.cos.soomgyo.service.ReplyService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ReplyApiController {
	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/api/board/{communityID}/reply")
	public void save(@PathVariable int communityID, 
					@RequestBody Reply reply, 
					@AuthenticationPrincipal PrincipalDetail principalDetail){
		replyService.replySave(communityID, reply, principalDetail.getUser());
	}
	@DeleteMapping("/api/board/{communityId}/reply/{replyid}")
		public ResponseDto<Integer> delete(@PathVariable int replyid) {
			replyService.replyDelete(replyid);
			return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/board/{communityId}/reply/{replyid}")
	public ResponseDto<Integer> update(@PathVariable int replyid, @RequestBody Reply reply){
		replyService.replyUpdate(replyid,reply);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
