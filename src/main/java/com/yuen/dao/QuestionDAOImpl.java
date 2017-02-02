package com.yuen.dao;

import com.yuen.domain.Question;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class QuestionDAOImpl implements QuestionDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findAll() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct q " +
    				 "from Question q " +
    				 "left join fetch q.user " +
    				 "left join fetch q.answers";
    	
        return session.createQuery(hql).getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findLast(int first, int max) {
    	Session session = sessionFactory.getCurrentSession();

    	String hql = "select q " +
    				 "from Question q " +
    				 "left join fetch q.user " +
    				 "left join fetch q.category " +
    				 "left join fetch q.answers " +
    				 "order by q.id desc";
    	
    	return session.createQuery(hql)
                .setFirstResult(first - 1)
                .setMaxResults(max)
                .getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findTopViews(int first, int max) {
    	Session session = sessionFactory.getCurrentSession();

    	String hql = "select q " +
					 "from Question q " +
					 "left join fetch q.user " +
					 "left join fetch q.category " +
					 "left join fetch q.answers " +
    				 "order by q.views desc";
    	
    	return session.createQuery(hql)
                .setFirstResult(first - 1)
                .setMaxResults(max)
                .getResultList();
    }

    @Override
    public List<Question> findNoAnswers(int first, int max) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	CriteriaBuilder builder = session.getCriteriaBuilder();
    	CriteriaQuery<Question> criteria = builder.createQuery(Question.class);
    	Root<Question> root = criteria.from(Question.class);
    	root.fetch("user", JoinType.LEFT);
    	root.fetch("category", JoinType.LEFT);
    	root.fetch("answers", JoinType.LEFT);
    	criteria.select(root);
    	criteria.where(builder.isEmpty(root.get("answers")));
    	criteria.orderBy(builder.desc(root.get("id")));
    	
    	List<Question> questions = session.createQuery(criteria)
    			.setFirstResult(first - 1)
    			.setMaxResults(max)
    			.getResultList();
    	return questions;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findAllByUser(int uid) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct q " +
    				 "from Question q " +
					 "left join fetch q.category " +
					 "left join fetch q.tags " +
					 "left join fetch q.answers " +
    				 "where q.user.id = :uid " +
    				 "order by q.id desc";
    	
        return session.createQuery(hql)
                .setParameter("uid", uid)
                .getResultList();
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findAllByCategory(int cid) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct q " +
    				 "from Question q " +
    				 "left join fetch q.user " +
					 "left join fetch q.answers " +
    				 "where q.category.id = :cid " +
    				 "order by q.id desc";
    	
        return session.createQuery(hql)
                .setParameter("cid", cid)
                .getResultList();
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findAllByCategory(int cid, int first, int max) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct q " +
				 	 "from Question q " +
				 	 "left join fetch q.user " +
				 	 "left join fetch q.category c " +
					 "left join fetch q.answers " +
				 	 "where c.id = :cid " +
				 	 "order by q.id desc";
    	
        return session.createQuery(hql)
                .setParameter("cid", cid)
                .setFirstResult(first - 1)
                .setMaxResults(max)
                .getResultList();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findAllByTag(String name) {
    	Session session = sessionFactory.getCurrentSession();
   
    	String hql = "select distinct q " +
    				 "from Question q " +
    				 "left join fetch q.user " +
					 "left join fetch q.answers " +
					 "left join fetch q.tags t " +
    				 "where t.name = :name " +
    				 "order by q.id desc";
    	
        return session.createQuery(hql)
                .setParameter("name", name)
                .getResultList();
    }


    @SuppressWarnings("unchecked")
    @Override
    public List<Question> findAllByTag(String name, int first, int max) {
    	Session session = sessionFactory.getCurrentSession();
    	   
    	String hql = "select distinct q " +
				 	 "from Question q " +
				 	 "left join fetch q.user " +
					 "left join fetch q.category " +
					 "left join fetch q.tags t " +
					 "left join fetch q.answers " +
				 	 "where t.name = :name " +
				 	 "order by q.id desc";
    	
        return session.createQuery(hql)
                .setParameter("name", name)
                .setFirstResult(first - 1)
                .setMaxResults(max)
                .getResultList();
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Question> search(String q, int first, int max) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select distinct q " +
			 	 	 "from Question q " +
			 	 	 "left join fetch q.user " +
			 	 	 "left join fetch q.category " +
			 	 	 "left join fetch q.answers " +
    				 "where q.title like :q";
    	
        return session.createQuery(hql)
                .setParameter("q", "%" + q + "%")
                .setFirstResult(first - 1)
                .setMaxResults(max)
                .getResultList();
    }

    @Override
    public Question findOne(int id) {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select q " +
    				 "from Question q " +
    				 "left join fetch q.user " +
    				 "left join fetch q.category " +
    				 "left join fetch q.tags " +
    				 "left join fetch q.answers a " +
    				 "left join fetch a.user " +
    				 "where q.id = :id";
    	
    	try {
    		return (Question) session.createQuery(hql)
    							.setParameter("id", id)
								.getSingleResult();
    	} catch (NoResultException e) {
    		return null;
    	}
	}
    
    @Override
    public int count() {
    	Session session = sessionFactory.getCurrentSession();
    	
    	String hql = "select count(*) " + 
            	     "from Question";
    	
        return ((Number) session.createQuery(hql).getSingleResult()).intValue();
    }
    
    @Override
    public void create(Question question) {
    	Session session = sessionFactory.getCurrentSession();
        session.persist(question);
    }

    @Override
    public void upViews(int id) {
    	Session session = sessionFactory.getCurrentSession();
    	
        String hql = "update Question q " +
        			 "set q.views = q.views + 1 " +
        			 "where q.id = :id";
    	
    	session.createQuery(hql)
                .setParameter("id", id)
                .executeUpdate();
    }
    
    @Override
    public void delete(Question question) {
    	Session session = sessionFactory.getCurrentSession();
        session.delete(question);
    }

}
