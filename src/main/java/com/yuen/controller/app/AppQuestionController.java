package com.yuen.controller.app;

import java.beans.PropertyEditorSupport;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yuen.domain.Answer;
import com.yuen.domain.Category;
import com.yuen.domain.CustomUserDetails;
import com.yuen.domain.Question;
import com.yuen.service.CategoryService;
import com.yuen.service.QuestionService;
import com.yuen.service.TagService;
import com.yuen.service.UserService;

@Controller
public class AppQuestionController {
	
	@Autowired
    private UserService userService;
	
	@Autowired
    private QuestionService questionService;

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private TagService tagService;
    
    @GetMapping("/question/{id}/{slug}")
    public String show(@PathVariable("id") int id, @PathVariable("slug") String slug, Model model) {
        Question question = questionService.findOne(id);
        
        if (question == null) {
            return "404";
        } else {
        	questionService.upViews(id);

            model.addAttribute("categories", categoryService.findAll());
            model.addAttribute("topUsers", userService.findTopPoint(5));
            model.addAttribute("tags", tagService.findAllApp());
            model.addAttribute("question", question);
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof CustomUserDetails) {
                model.addAttribute("answer", new Answer());
            }
            return "app_question_detail";
        }
    }
    
    @GetMapping("/question/ask")
    public String getAsk(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("tags", tagService.findAllApp());
        model.addAttribute("question", new Question());
        return "question_form";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Category.class, "category", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                Category category = categoryService.findOne(Integer.parseInt(text));
                setValue(category);
            }
        });

        binder.registerCustomEditor(Set.class, "tags", new CustomCollectionEditor(Set.class) {
            @Override
            protected Object convertElement(Object element) {
                Integer id = Integer.parseInt((String) element);
                return tagService.findOne(id);
            }
        });
    }

    @PostMapping("/question/ask")
    public String postAsk(@Valid Question question, BindingResult result,
            Model model, RedirectAttributes redirect) {
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("tags", categoryService.findAll());

        if (result.hasErrors()) {
            return "question_form";
        }

        questionService.create(question);

        redirect.addFlashAttribute("success", "Your question has been posted successfully!");
        return "redirect:/question/ask";
    }

}