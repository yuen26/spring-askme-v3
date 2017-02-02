package com.yuen.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.Answer;

@Repository
@Transactional
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> findAllByUser(int uid) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "select distinct a " +
					 "from Answer a " +
					 "left join fetch a.question q " +
					 "left join fetch q.user " +
					 "where a.user.id = :uid";
		
		return session.createQuery(hql).setParameter("uid", uid).getResultList();
	}
	
	@Override
	public Answer findOneNoFetch(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Answer.class, id);
	}
	
	@Override
	public Answer findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "select a " +
					 "from Answer a " +
					 "left join fetch a.question " +
					 "left join fetch a.user " +
					 "where a.id = :id";
		try {
			return (Answer) session.createQuery(hql)
								.setParameter("id", id)
								.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Answer findBestAnswer(int qid) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "select a " +
					 "from Answer a " +
					 "left join fetch a.question q " +
					 "left join fetch a.user " +
				     "where a.best = 1 " +
				     "and q.id = :qid";
		
		try {
			return (Answer) session.createQuery(hql)
								.setParameter("qid", qid)
								.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " + 
            	     "from Answer";
    	
        return ((Number) session.createQuery(hql).getSingleResult()).intValue();
	}

	@Override
	public int count(int uid) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " + 
            	     "from Answer a " +
            	     "where a.user.id = :uid";
    	Number count = (Number) session.createQuery(hql)
    								.setParameter("uid", uid)
    								.getSingleResult();
    	
        return count.intValue();
	}

	@Override
	public int countBestAnswers(int uid) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " + 
            	     "from Answer a " +
            	     "where a.user.id = :uid " +
            	     "and a.best = 1";
    	Number count = (Number) session.createQuery(hql)
    								.setParameter("uid", uid)
    								.getSingleResult();
    	
        return count.intValue();
	}
	
	@Override
	public void create(Answer answer) {
		Session session = sessionFactory.getCurrentSession();
        session.persist(answer);
	}

	@Override
	public void upVotes(int id) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "update Answer a " +
    				 "set a.votes = a.votes + 1 " +
    				 "where a.id = :id";
    	
        session.createQuery(hql)
                .setParameter("id", id)
                .executeUpdate();
	}

	@Override
	public void downVotes(int id) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "update Answer a " +
    				 "set a.votes = a.votes - 1 " +
    				 "where a.id = :id";
    	
        session.createQuery(hql)
                .setParameter("id", id)
                .executeUpdate();
	}

	@Override
	public void updateBest(int id) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "update Answer a " +
    				 "set a.best = 1 " +
    				 "where a.id = :id";
    	
        session.createQuery(hql)
                .setParameter("id", id)
                .executeUpdate();
	}

	@Override
	public void resetBest(int qid) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "update Answer a " +
    				 "set a.best = 0 " +
    				 "where a.question.id = :qid";
    	
        session.createQuery(hql)
                .setParameter("qid", qid)
                .executeUpdate();
	}
	
	@Override
	public void delete(Answer answer) {
		Session session = sessionFactory.getCurrentSession();
        session.delete(answer);
	}

}
