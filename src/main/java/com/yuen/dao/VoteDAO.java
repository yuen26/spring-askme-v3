package com.yuen.dao;

import com.yuen.domain.Vote;

public interface VoteDAO {

    Vote findOne(int aid, int uid);

    void create(Vote vote);

}
