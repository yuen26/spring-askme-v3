package com.yuen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuen.dao.VoteDAO;
import com.yuen.domain.Vote;

@Service
public class VoteServiceImpl implements VoteService {

	@Autowired
	private VoteDAO voteDAO;
	
	@Override
	public Vote findOne(int aid, int uid) {
		return voteDAO.findOne(aid, uid);
	}

	@Override
	public void create(Vote vote) {
		voteDAO.create(vote);
	}

}
