package com.cos.soomgyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.soomgyo.model.Community;
import com.cos.soomgyo.model.Reply;
import com.cos.soomgyo.model.Users;
import com.cos.soomgyo.repository.CommunityRepository;
import com.cos.soomgyo.repository.ReplyRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReplyService {
	@Autowired
	private ReplyRepository replyRepository;
	@Autowired
	private CommunityRepository communityRepository;
	
	@Transactional
	public void replySave(int communityId, Reply reply, Users user) {
		Community community = communityRepository.findById(communityId)
				.orElseThrow(()->new IllegalArgumentException("해당 communityId가 없습니다. id"+communityId));
		reply.save(community, user);
		replyRepository.save(reply);
	}
	@Transactional
	public void replyDelete(int replyid) {
		replyRepository.deleteById(replyid);
	}
	@Transactional
	public Long replycount(int communityId) {
		return replyRepository.countBycommunityId(communityId);
	}
	@Transactional
	public void replyUpdate(int replyid, Reply requestReply) {
		Reply reply2 = replyRepository.findById(replyid)
				.orElseThrow(()->new IllegalArgumentException("해당 replyId가 없습니다. id"+replyid));
		reply2.setContent(requestReply.getContent());
	}
}
