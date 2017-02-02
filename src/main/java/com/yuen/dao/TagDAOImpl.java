package com.yuen.dao;

import com.yuen.domain.Tag;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class TagDAOImpl implements TagDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Tag> findAllApp() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "from Tag";
    	
    	return session.createQuery(hql).getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Tag> findAllAdmin() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct t " + 
				 	 "from Tag t " +
				 	 "left join fetch t.questions";
    	
    	return session.createQuery(hql).getResultList();
    }
    
    @Override
    public Tag findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();
        return session.get(Tag.class, id);
    }
    
    @Override
    public Tag findOne(String name) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "from Tag " +
    				 "where name = :name";
    	
    	try {
    		return (Tag) session.createQuery(hql)
            		.setParameter("name", name)
                    .getSingleResult();
    	} catch (NoResultException e) {
    		return null;
    	}
    }
    
    @Override
    public int count() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " + 
            	     "from Tag";
    	
        return ((Number) session.createQuery(hql).getSingleResult()).intValue();
    }
    
    @Override
    public void create(Tag tag) {
    	Session session = sessionFactory.getCurrentSession();
        session.persist(tag);
    }

    @Override
    public void update(Tag tag) {
    	Session session = sessionFactory.getCurrentSession();
        session.update(tag);
    }

    @Override
    public void delete(Tag tag) {
    	Session session = sessionFactory.getCurrentSession();
        session.delete(tag);
    }

}
