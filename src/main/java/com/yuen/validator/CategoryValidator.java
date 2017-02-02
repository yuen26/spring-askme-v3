package com.yuen.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.yuen.domain.Category;
import com.yuen.service.CategoryService;

@Component
public class CategoryValidator implements Validator {
	
	@Autowired
	private CategoryService categoryService;

	@Override
	public boolean supports(Class<?> cls) {
		return Category.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Category category = (Category) o;
		
		// Unique category
        Category dbCategory = categoryService.findOne(category.getName());
        if (dbCategory != null && dbCategory.getId() != category.getId()) {
            errors.rejectValue("name", "Unique.category.name");
        }
	}
	
}
