package com.yuen.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.yuen.domain.Tag;
import com.yuen.service.TagService;

@Component
public class TagValidator implements Validator {
	
	@Autowired
	private TagService tagService;

	@Override
	public boolean supports(Class<?> cls) {
		return Tag.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Tag tag = (Tag) o;
		
		// Unique tag
        Tag dbTag = tagService.findOne(tag.getName().toLowerCase());
        if (dbTag != null && dbTag.getId() != tag.getId()) {
            errors.rejectValue("name", "Unique.tag.name");
        }
	}
	
}
