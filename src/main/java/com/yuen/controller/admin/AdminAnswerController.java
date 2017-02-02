package com.yuen.controller.admin;

import com.yuen.domain.Answer;
import com.yuen.service.AnswerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminAnswerController {

    @Autowired
    private AnswerService answerService;

    @GetMapping("/admin/answer/{id}/delete")
    public String delete(@PathVariable int id, RedirectAttributes redirect) {
        Answer answer = answerService.findOne(id);
        if (answer == null) {
            return "404";
        } else {
        	answerService.delete(answer);
            redirect.addFlashAttribute("success", "Deleted answer successfully!");
            return "redirect:/admin/question/" + answer.getQuestion().getId();
        }
    }
    
}
