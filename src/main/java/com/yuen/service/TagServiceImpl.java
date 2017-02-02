package com.yuen.service;

import com.yuen.dao.TagDAO;
import com.yuen.domain.Tag;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagDAO tagDAO;
    
    @Override
    public List<Tag> findAllApp() {
    	return tagDAO.findAllApp();
    }
    
    @Override
    public List<Tag> findAllAdmin() {
        return tagDAO.findAllAdmin();
    }
    
    @Override
    public Tag findOne(int id) {
        return tagDAO.findOne(id);
    }

    @Override
    public Tag findOne(String name) {
        return tagDAO.findOne(name);
    }
    
    @Override
    public int count() {
        return tagDAO.count();
    }
    
    @Override
    public void create(Tag tag) {
        tag.setName(tag.getName().toLowerCase());
        tagDAO.create(tag);
    }

    @Override
    public void update(Tag tag) {
        tag.setName(tag.getName().toLowerCase());
        tagDAO.update(tag);
    }

    @Override
    public void delete(Tag tag) {
        tagDAO.delete(tag);
    }

}
