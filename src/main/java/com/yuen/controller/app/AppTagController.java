package com.yuen.controller.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yuen.domain.Tag;
import com.yuen.service.CategoryService;
import com.yuen.service.QuestionService;
import com.yuen.service.TagService;
import com.yuen.service.UserService;
import com.yuen.util.Const;

@Controller
public class AppTagController {
	
	@Autowired
    private UserService userService;
	
	@Autowired
    private QuestionService questionService;

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private TagService tagService;
    
    @GetMapping("/tag/{name}")
    public String tag(@PathVariable("name") String name, Model model) {
        // Check tag exist
        List<Tag> tags = tagService.findAllApp();
        Tag currentTag = null;
        for (Tag tag : tags) {
            if (tag.getName().equals(name)) {
                currentTag = tag;
                break;
            }
        }
        
        if (currentTag == null) {
            return "404";
        } else {
        	model.addAttribute("categories", categoryService.findAll());
            model.addAttribute("topUsers", userService.findTopPoint(5));
            model.addAttribute("tags", tags);
            model.addAttribute("questions", questionService.findAllByTag(name, 1, Const.QUESTION_PER_PAGE));
            model.addAttribute("currentTag", currentTag);
            return "tag";
        }
    }

    @GetMapping("/loadMoreByTag")
    public ModelAndView loadMoreByTag(
    		@RequestParam("name") String name, @RequestParam("page") int page, Model model) {
        if (page != 1) {
            page = (page - 1) * Const.QUESTION_PER_PAGE + 1;
        }
        
        model.addAttribute("questions", questionService.findAllByTag(name, page, Const.QUESTION_PER_PAGE));
        return new ModelAndView("questions_fragment");
    }
	
}
