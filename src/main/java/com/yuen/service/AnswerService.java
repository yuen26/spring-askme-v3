package com.yuen.service;

import java.util.List;

import com.yuen.domain.Answer;

public interface AnswerService {
    
	List<Answer> findAllByUser(int uid);
	
	List<Answer> findBestAnswers(List<Answer> answers);
	
	Answer findOneNoFetch(int id);
	
    Answer findOne(int id);
    
    int count();
    
    int count(int uid);
    
    int countBestAnswers(int uid);
    
    void create(Answer answer);
    
    void setBest(int qid, int aid, int uid);

    void upVotes(int id);

    void downVotes(int id);
    
    void delete(Answer answer);
    
}
