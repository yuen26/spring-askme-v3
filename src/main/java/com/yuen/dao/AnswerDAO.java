package com.yuen.dao;

import java.util.List;

import com.yuen.domain.Answer;

public interface AnswerDAO {

	List<Answer> findAllByUser(int uid);
	
	Answer findOneNoFetch(int id);
	
    Answer findOne(int id);
    
    Answer findBestAnswer(int qid);
    
    int count();
    
    int count(int uid);
    
    int countBestAnswers(int uid);
    
    void create(Answer answer);
    
    void upVotes(int id);
    
    void downVotes(int id);
    
    void updateBest(int id);
    
    void resetBest(int qid);
    
    void delete(Answer answer);

}
