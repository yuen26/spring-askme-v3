package com.yuen.controller.admin;

import com.yuen.domain.Tag;
import com.yuen.service.QuestionService;
import com.yuen.service.TagService;
import com.yuen.validator.TagValidator;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminTagController {

    @Autowired
    private TagService tagService;
    
    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private TagValidator tagValidator;

    @GetMapping("/admin/tag")
    public String index(Model model) {
        model.addAttribute("tags", tagService.findAllAdmin());
        return "tag_list";
    }

    @GetMapping("/admin/tag/{id}")
    public String show(@PathVariable int id, Model model) {
        Tag tag = tagService.findOne(id);
        if (tag == null) {
            return "404";
        } else {
        	model.addAttribute("questions", questionService.findAllByTag(tag.getName()));
            return "question_list";
        }
    }

    @GetMapping("/admin/tag/add")
    public String add(Model model) {
        model.addAttribute("tag", new Tag());
        return "tag_form";
    }
    
    @GetMapping("/admin/tag/{id}/edit")
    public String edit(@PathVariable int id, Model model) {
        Tag tag = tagService.findOne(id);
        if (tag == null) {
            return "404";
        } else {
        	model.addAttribute("tag", tag);
            return "tag_form";
        }
    }

    @PostMapping("/admin/tag/save")
    public String save(@Valid Tag tag, BindingResult result, RedirectAttributes redirect) {
        tagValidator.validate(tag, result);
    	if (result.hasErrors()) {
            return "tag_form";
        }
    	
    	if (tag.getId() == 0) {
    		tagService.create(tag);
    	} else {
    		tagService.update(tag);
    	}

    	redirect.addFlashAttribute("success", "Saved tag " + tag.getName() + " successfully!");
        return "redirect:/admin/tag";
    }

    @GetMapping("/admin/tag/{id}/delete")
    public String delete(@PathVariable int id, RedirectAttributes redirect) {
        Tag tag = tagService.findOne(id);
        if (tag == null) {
            return "404";
        } else {
        	tagService.delete(tag);
            
            redirect.addFlashAttribute("success", "Deleted tag " + tag.getName() + " successfully!");
            return "redirect:/admin/tag";
        }
    }

}
