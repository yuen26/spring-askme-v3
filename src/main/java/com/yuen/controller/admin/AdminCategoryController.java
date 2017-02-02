package com.yuen.controller.admin;

import com.yuen.domain.Category;
import com.yuen.service.CategoryService;
import com.yuen.service.QuestionService;
import com.yuen.validator.CategoryValidator;

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
public class AdminCategoryController {

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private CategoryValidator categoryValidator;

    @GetMapping("/admin/category")
    public String index(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "category_list";
    }

    @GetMapping("/admin/category/{id}")
    public String show(@PathVariable int id, Model model) {
        Category category = categoryService.findOne(id);
        if (category == null) {
            return "404";
        } else {
        	model.addAttribute("questions", questionService.findAllByCategory(id));
            return "question_list";
        }
    }

    @GetMapping("/admin/category/add")
    public String add(Model model) {
        model.addAttribute("category", new Category());
        return "category_form";
    }
    
    @GetMapping("/admin/category/{id}/edit")
    public String edit(@PathVariable int id, Model model) {
        Category category = categoryService.findOne(id);
        if (category == null) {
            return "404";
        } else {
        	model.addAttribute("category", category);
            return "category_form";
        }
    }

    @PostMapping("/admin/category/save")
    public String save(@Valid Category category, BindingResult result,
            Model model, RedirectAttributes redirect) {
    	categoryValidator.validate(category, result);
        if (result.hasErrors()) {
            return "category_form";
        }
        
        if (category.getId() == 0) {
        	categoryService.create(category);
        } else {
        	categoryService.update(category);
        }
        
        redirect.addFlashAttribute("success", "Saved category " + category.getName() + " successfully!");
        return "redirect:/admin/category";
    }

    @GetMapping("/admin/category/{id}/delete")
    public String delete(@PathVariable int id, RedirectAttributes redirect) {
        Category category = categoryService.findOne(id);
        if (category == null) {
            return "404";
        } else {
        	categoryService.delete(category);
            redirect.addFlashAttribute("success", "Deleted category " + category.getName() + " successfully!");
            return "redirect:/admin/category";
        }
    }

}
