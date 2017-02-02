package com.yuen.dao;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.Role;

@Repository
@Transactional
public class RoleDAOImpl implements RoleDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Role findOne(String name) {
		Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "from Role " +
    				 "where name = :name";
    	
    	try {
    		return (Role) session.createQuery(hql)
            		.setParameter("name", name)
                    .getSingleResult();
    	} catch (NoResultException e) {
    		return null;
    	}
	}

}
