package com.yuen.service;

import com.yuen.dao.QuestionDAO;
import com.yuen.domain.CustomUserDetails;
import com.yuen.domain.Question;
import com.yuen.domain.User;
import com.yuen.util.StringUtil;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionDAO questionDAO;

    @Override
    public List<Question> findAll() {
        return questionDAO.findAll();
    }

    @Override
    public List<Question> findLast(int first, int max) {
        return questionDAO.findLast(first, max);
    }

    @Override
    public List<Question> findTopViews(int first, int max) {
        return questionDAO.findTopViews(first, max);
    }

    @Override
    public List<Question> findNoAnswers(int first, int max) {
        return questionDAO.findNoAnswers(first, max);
    }
    
    @Override
    public List<Question> findAllByUser(int uid) {
    	return questionDAO.findAllByUser(uid);
    }
    
    @Override
    public List<Question> findAllByCategory(int cid) {
        return questionDAO.findAllByCategory(cid);
    }
    
    @Override
    public List<Question> findAllByCategory(int cid, int first, int max) {
        return questionDAO.findAllByCategory(cid, first, max);
    }
    
    @Override
    public List<Question> findAllByTag(String name) {
        return questionDAO.findAllByTag(name);
    }
    
    @Override
    public List<Question> findAllByTag(String name, int first, int max) {
        return questionDAO.findAllByTag(name, first, max);
    }
    
    @Override
    public List<Question> search(String q, int first, int max) {
        return questionDAO.search(q, first, max);
    }
    
    @Override
    public Question findOne(int id) {
        return questionDAO.findOne(id);
    }

    @Override
    public int count() {
        return questionDAO.count();
    }
    
    @Override
    public void create(Question question) {
    	question.setSlug(StringUtil.slugify(question.getTitle()));
        question.setCreatedAt(new Date());
        question.setUpdatedAt(new Date());
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();
        question.setUser(currentUser);
        
        questionDAO.create(question);
    }
    
    @Override
    public void upViews(int id) {
        questionDAO.upViews(id);
    }
    
    @Override
    public void delete(Question question) {
        questionDAO.delete(question);
    }

}
