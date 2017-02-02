package com.yuen.service;

import com.yuen.domain.Vote;

public interface VoteService {

	Vote findOne(int aid, int uid);

	void create(Vote vote);
	
}
