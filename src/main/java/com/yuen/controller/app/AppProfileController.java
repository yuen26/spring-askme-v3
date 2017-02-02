package com.yuen.controller.app;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yuen.domain.CustomUserDetails;
import com.yuen.domain.Question;
import com.yuen.domain.User;
import com.yuen.service.AnswerService;
import com.yuen.service.CategoryService;
import com.yuen.service.QuestionService;
import com.yuen.service.TagService;
import com.yuen.service.UserService;
import com.yuen.validator.UserValidator;

@Controller
public class AppProfileController {
	
	@Autowired
    private UserService userService;
	
	@Autowired 
    private QuestionService questionService;
    
    @Autowired
    private AnswerService answerService;
	
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private TagService tagService;
    
    @Autowired
    private UserValidator userValidator;
	
	@GetMapping("/user/{id}")
    public String show(@PathVariable("id") int id, Model model) {
        User user = userService.findOne(id);
        if (user == null) {
            return "404";
        } else {
        	List<Question> questions = questionService.findAllByUser(id);
        	
        	model.addAttribute("categories", categoryService.findAll());
            model.addAttribute("topUsers", userService.findTopPoint(5));
            model.addAttribute("tags", tagService.findAllApp());
            model.addAttribute("user", user);
        	model.addAttribute("countQuestions", questions.size());
        	model.addAttribute("countAnswers", answerService.count(id));
        	model.addAttribute("countBestAnswers", answerService.countBestAnswers(id));
        	model.addAttribute("questions", questions);
            return "app_user_profile";
        }
    }

    @GetMapping("/user/change-profile")
    public String update(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = ((CustomUserDetails) principal).getUser();

        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("topUsers", userService.findTopPoint(5));
        model.addAttribute("tags", tagService.findAllApp());
        model.addAttribute("user", userService.findOne(currentUser.getId()));
        return "change_profile";
    }

    @PostMapping("/user/change-profile")
    public String save(@Valid User user, BindingResult result,
            Model model, RedirectAttributes redirect, 
            HttpServletRequest request, 
            @RequestParam(value = "file", required = false) MultipartFile file) {
        userValidator.validate(user, result);
    	if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "change_profile";
        }

        // Upload avatar
        if (file != null) {
            try {
                InputStream inputStream = file.getInputStream();
                if (inputStream == null) {
                    System.out.println("File inputstream is null");
                }
                String path = request.getServletContext().getRealPath("/") + "upload/";
                FileUtils.forceMkdir(new File(path));
                File upload = new File(path + file.getOriginalFilename());
                file.transferTo(upload);
                user.setAvatar(file.getOriginalFilename());
                IOUtils.closeQuietly(inputStream);
            } catch (IOException ex) {
                System.out.println("Error saving uploaded file");
            }
        }
        
        userService.update(user);

        redirect.addFlashAttribute("success", "Saved your profile!");
        return "redirect:/login";
    }
	
}
