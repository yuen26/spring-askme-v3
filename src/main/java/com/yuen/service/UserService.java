package com.yuen.service;

import com.yuen.domain.User;
import java.util.List;

public interface UserService {

    List<User> findAll();
    
    List<User> findLast(int limit);
    
    List<User> findTopPoint(int limit);
    
    User findOne(int id);
    
    User findOne(String email);
    
    int count();
    
    void create(User user, String role);
    
    void update(User user);
    
    void update(User user, String role);
    
    void upPoint(int uid, int point);
    
    void downPoint(int uid, int point);
    
    void delete(User user);

}
