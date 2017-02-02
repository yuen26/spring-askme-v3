package com.yuen.controller.admin;

import com.yuen.domain.User;
import com.yuen.domain.Question;
import com.yuen.service.CategoryService;
import com.yuen.service.QuestionService;
import com.yuen.service.TagService;
import com.yuen.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminDashboardController {

    @Autowired
    UserService userService;

    @Autowired
    QuestionService questionService;
    
    @Autowired
    CategoryService categoryService;

    @Autowired
    TagService tagService;

    @GetMapping("/admin")
    public String dashboard(Model model) {
        int countUsers = userService.count();
        int countQuestions = questionService.count();
        int countCategories = categoryService.count();
        int countTags = tagService.count();
        List<Question> newQuestions = questionService.findLast(1, 10);
        List<User> newUsers = userService.findLast(8);

        model.addAttribute("countUsers", countUsers);
        model.addAttribute("countQuestions", countQuestions);
        model.addAttribute("countCategories", countCategories);
        model.addAttribute("countTags", countTags);
        model.addAttribute("newQuestions", newQuestions);
        model.addAttribute("newUsers", newUsers);
        return "dashboard";
    }
    
}
