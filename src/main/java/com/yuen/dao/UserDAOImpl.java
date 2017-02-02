package com.yuen.dao;

import com.yuen.domain.User;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<User> findAll() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct u " + 
    				 "from User u " +
    				 "left join fetch u.roles";
    	
        return session.createQuery(hql).getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> findLast(int limit) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "from User u " + 
    				 "order by u.id desc";
    	
        return session.createQuery(hql)
        		.setMaxResults(limit)
        		.getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> findTopPoint(int limit) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "from User u " +
            	     "order by u.point desc";
    	
        return session.createQuery(hql)
        		.setMaxResults(limit)
        		.getResultList();
    }

    @Override
    public User findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();

    	String hql = "select distinct u " +
					 "from User u " +
					 "left join fetch u.roles " +
			    	 "where u.id = :id";
	
	   try {
	   	return (User) session.createQuery(hql)
	   					.setParameter("id", id)
	   					.getSingleResult();
	   } catch (NoResultException e) {
		   return null;
	   }
    }
    
    @Override
    public User findOne(String email) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct u " +
    				 "from User u " +
    				 "left join fetch u.roles " +
    		    	 "where u.email = :email";
    	
        try {
        	return (User) session.createQuery(hql)
        			.setParameter("email", email)
        			.getSingleResult();
        } catch (NoResultException e) {
        	return null;
        }
    }
    
	@Override
    public int count() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " + 
            	     "from User";
    	
        return ((Number) session.createQuery(hql).getSingleResult()).intValue();
    }

    @Override
    public void create(User user) {
    	Session session = sessionFactory.getCurrentSession();
        session.persist(user);
    }
    
    @Override
    public void update(User user) {
    	Session session = sessionFactory.getCurrentSession();
    	session.update(user);
    }

    @Override
    public void upPoint(int uid, int point) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "update User u " + 
    				 "set u.point = u.point + :point " + 
    				 "where u.id = :uid";
    	
        session.createQuery(hql)
			.setParameter("point", point)
			.setParameter("uid", uid)
			.executeUpdate();
    }
    
    @Override
    public void downPoint(int uid, int point) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "update User u " + 
    				 "set u.point = u.point - :point " + 
    				 "where u.id = :uid";
    	
        session.createQuery(hql)
			.setParameter("point", point)
			.setParameter("uid", uid)
			.executeUpdate();
    }
    
    @Override
    public void delete(User user) {
    	Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }

}
