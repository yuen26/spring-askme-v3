package com.yuen.controller.app;

import com.yuen.domain.User;
import com.yuen.service.UserService;
import com.yuen.validator.UserValidator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AppSecurityController {

    @Autowired
    UserService userService;
    
    @Autowired
    UserValidator userValidator;
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String getRegister(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String postRegister(@Valid User user, BindingResult result,
            RedirectAttributes redirect) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "register";
        }

        userService.create(user, "member");
        redirect.addFlashAttribute("success", "You registered successfully!");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }
    
    @GetMapping("/403")
    public String accessDenied() {
    	return "403";
    }
    
}