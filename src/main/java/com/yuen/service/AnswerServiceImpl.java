package com.yuen.service;

import com.yuen.dao.AnswerDAO;
import com.yuen.dao.UserDAO;
import com.yuen.domain.Answer;
import com.yuen.domain.CustomUserDetails;
import com.yuen.domain.User;
import com.yuen.util.Const;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {
    
    @Autowired
    private AnswerDAO answerDAO;
    
    @Autowired
    private UserDAO userDAO;
    
    @Override
	public List<Answer> findAllByUser(int uid) {
    	return answerDAO.findAllByUser(uid);
    }
    
    @Override
	public List<Answer> findBestAnswers(List<Answer> answers) {
    	List<Answer> bestAnswers = new ArrayList<>();
    	for (Answer answer : answers) {
    		if (answer.isBest()) {
    			bestAnswers.add(answer);
    		}
    	}
    	return bestAnswers;
    }
    
    @Override
    public Answer findOneNoFetch(int id) {
    	return answerDAO.findOneNoFetch(id);
    }
    
    @Override
    public Answer findOne(int id) {
        return answerDAO.findOne(id);
    }

    @Override
    public int count() {
        return answerDAO.count();
    }
    
    @Override
	public int count(int uid) {
    	return answerDAO.count(uid);
    }

	@Override
	public int countBestAnswers(int uid) {
		return answerDAO.countBestAnswers(uid);
	}
    
    @Override
    public void create(Answer answer) {
    	answer.setCreatedAt(new Date());
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        answer.setUser(currentUser);
        answerDAO.create(answer);
        
        userDAO.upPoint(currentUser.getId(), Const.ANSWER_POINT);
    }
    
    /*
     * qid: question ID 
     * aid: answer ID
     * uid: the owner ID of answer ID 
     */
    @Override
    public void setBest(int qid, int aid, int uid) {
    	// Find old best answer
        Answer oldBest = answerDAO.findBestAnswer(qid);
        
        // Reset old best answer and the point of its owner
        if (oldBest != null) { 
        	answerDAO.resetBest(qid);
            userDAO.downPoint(oldBest.getUser().getId(), Const.BEST_POINT);
        }
        
        // Update new best answer and the point of its owner
        answerDAO.updateBest(aid);
        userDAO.upPoint(uid, Const.BEST_POINT);
    }

    @Override
    public void upVotes(int id) {
        answerDAO.upVotes(id);
    }

    @Override
    public void downVotes(int id) {
        answerDAO.downVotes(id);
    }
    
    @Override
    public void delete(Answer answer) {
    	if (answer.isBest()) {
    		userDAO.downPoint(answer.getUser().getId(), Const.BEST_POINT);
    	}
    	
        answerDAO.delete(answer);
    }

}
