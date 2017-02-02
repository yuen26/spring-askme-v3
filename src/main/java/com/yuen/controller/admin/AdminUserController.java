package com.yuen.controller.admin;

import com.yuen.domain.Answer;
import com.yuen.domain.User;
import com.yuen.service.AnswerService;
import com.yuen.service.QuestionService;
import com.yuen.service.UserService;
import com.yuen.validator.UserValidator;
import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminUserController {

    @Autowired
    private UserService userService;
    
    @Autowired 
    private QuestionService questionService;
    
    @Autowired
    private AnswerService answerService;
    
    @Autowired
    UserValidator userValidator;

    @GetMapping("/admin/user")
    public String index(Model model) {
        List<User> users = userService.findAll();
        
        model.addAttribute("users", users);
        return "user_list";
    }

    @GetMapping("/admin/user/{id}")
    public String show(@PathVariable int id, Model model) {
        User user = userService.findOne(id);
        if (user == null) {
            return "404";
        } else {
        	List<Answer> answers = answerService.findAllByUser(id);
        	List<Answer> bestAnswers = answerService.findBestAnswers(answers);
        	
        	model.addAttribute("user", user);
        	model.addAttribute("questions", questionService.findAllByUser(id));
        	model.addAttribute("answers", answers);
        	model.addAttribute("bestAnswers", bestAnswers);
            return "admin_user_profile";
        }
    }

    @GetMapping(value = "/admin/user/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "user_form";
    }
    
    @GetMapping("/admin/user/{id}/edit")
    public String edit(@PathVariable int id, Model model) {
        User user = userService.findOne(id);
        if (user == null) {
            return "404";
        } else {
        	model.addAttribute("user", user);
            return "user_form";
        }
    }
    
    @PostMapping("/admin/user/save")
    public String save(@Valid User user, BindingResult result, @RequestParam("role") String role,
            Model model, RedirectAttributes redirect) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "user_form";
        }

        if (user.getId() == 0) {
        	userService.create(user, role);
        } else {
        	userService.update(user, role);
        }
        
        redirect.addFlashAttribute("success", "Saved user " + user.getName() + " successfully!");
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}/delete")
    public String delete(@PathVariable int id, RedirectAttributes redirect) {
        User user = userService.findOne(id);
        if (user == null) {
            return "404";
        } else {
        	if (user.getId() == 1) {
                redirect.addFlashAttribute("error", "Can not delete this user!");
            } else {
                userService.delete(user);
                redirect.addFlashAttribute("success", "Delete user " + user.getName() + " successfully!");
            }
            return "redirect:/admin/user";
        }
    }

}
