package com.yuen.validator;

import com.yuen.domain.User;
import com.yuen.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
	
	@Autowired
	private UserService userService;
	
    @Override
    public boolean supports(Class<?> cls) {
        return User.class.isAssignableFrom(cls);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	User user = (User) o;
        
        // Match password
        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Match.user.confirmPassword");
        }
        
        // Unique email
        User dbUser = userService.findOne(user.getEmail());
        if (dbUser != null && dbUser.getId() != user.getId()) {
            errors.rejectValue("email", "Unique.user.email");
        }
    }

}
