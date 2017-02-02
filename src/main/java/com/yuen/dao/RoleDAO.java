package com.yuen.dao;

import com.yuen.domain.Role;

public interface RoleDAO {
	
	Role findOne(String name);
	
}
