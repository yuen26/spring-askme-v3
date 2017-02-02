package com.yuen.controller.admin;

import com.yuen.domain.Question;
import com.yuen.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminQuestionController {

    @Autowired
    private QuestionService questionService;
    
    @GetMapping("/admin/question")
    public String index(Model model) {
        model.addAttribute("questions", questionService.findAll());
        return "question_list";
    }
    
    @GetMapping("/admin/question/{id}")
    public String show(@PathVariable int id, Model model) {
        Question question = questionService.findOne(id);
        if (question == null) {
            return "404";
        } else {
        	model.addAttribute("question", question);
            return "admin_question_detail";
        }
    }
    
    @GetMapping("/admin/question/{id}/delete")
    public String delete(@PathVariable int id, Model model, RedirectAttributes redirect) {
        Question question = questionService.findOne(id);
        if (question == null) {
            return "404";
        } else {
        	questionService.delete(question);
            redirect.addFlashAttribute("success", "Deleted question " + question.getTitle() + " successfully!");
            return "redirect:/admin/question";
        }
    }
    
}
