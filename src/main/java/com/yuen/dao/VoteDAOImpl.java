package com.yuen.dao;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.Vote;

@Repository
@Transactional
public class VoteDAOImpl implements VoteDAO {

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Vote findOne(int aid, int uid) {
		Session session = sessionFactory.getCurrentSession();
	
		String hql = "from Vote v " +
					 "where v.answer.id = :aid " +
					 "and v.user.id = :uid";
		
		try {
			return (Vote) session.createQuery(hql)
							.setParameter("aid", aid)
							.setParameter("uid", uid)
							.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void create(Vote vote) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(vote);
	}

}
