package com.yuen.dao;

import com.yuen.domain.Category;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<Category> findAll() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct c " + 
    				 "from Category c " +
    				 "left join fetch c.questions";
    	
    	return session.createQuery(hql).getResultList();
    }
    
    @Override
    public Category findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();
        return session.get(Category.class, id);
    }
    
    @Override
    public Category findOne(String name) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "from Category " +
    	             "where name = :name";
    	
    	try {
    		return (Category) session.createQuery(hql)
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
            	     "from Category";
    	
        return ((Number) session.createQuery(hql).getSingleResult()).intValue();
    }
    
    @Override
    public void create(Category category) {
    	Session session = sessionFactory.getCurrentSession();
        session.persist(category);
    }

    @Override
    public void update(Category category) {
    	Session session = sessionFactory.getCurrentSession();
        session.update(category);
    }

    @Override
    public void delete(Category category) {
    	Session session = sessionFactory.getCurrentSession();
        session.delete(category);
    }

}
