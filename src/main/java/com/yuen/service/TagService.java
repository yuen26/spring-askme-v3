package com.yuen.service;

import com.yuen.domain.Tag;
import java.util.List;

public interface TagService {

	List<Tag> findAllApp();	
	
    List<Tag> findAllAdmin();

    Tag findOne(int id);
    
    Tag findOne(String name);
    
    int count();

    void create(Tag tag);

    void update(Tag tag);

    void delete(Tag tag);
    
}
