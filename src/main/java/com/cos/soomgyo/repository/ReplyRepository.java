package com.cos.soomgyo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.soomgyo.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{
	Long countBycommunityId(int communityId);
}
