package com.yuen.controller.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yuen.service.CategoryService;
import com.yuen.service.QuestionService;
import com.yuen.service.TagService;
import com.yuen.service.UserService;
import com.yuen.util.Const;

@Controller
public class AppSearchController {
	
	@Autowired
    private UserService userService;
	
	@Autowired
    private QuestionService questionService;

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private TagService tagService;
	
	@GetMapping("/search")
    public String search(@RequestParam(value = "q", required = true) String q, Model model) {
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("topUsers", userService.findTopPoint(5));
        model.addAttribute("tags", tagService.findAllApp());
        model.addAttribute("questions", questionService.search(q, 1, Const.QUESTION_PER_PAGE));
        return "search";
    }
    
    @GetMapping("/loadMoreSearch")
    public ModelAndView loadMoreSearch(
    		@RequestParam(value = "q", required = true) String q, @RequestParam("page") int page, 
    		Model model) {
        if (page != 1) {
            page = (page - 1) * Const.QUESTION_PER_PAGE + 1;
        }

        model.addAttribute("questions", questionService.search(q, page, Const.QUESTION_PER_PAGE));
        return new ModelAndView("questions_fragment");
    }
	
}
