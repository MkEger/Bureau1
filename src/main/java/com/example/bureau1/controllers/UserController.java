package com.example.bureau1.controllers;

import com.example.bureau1.models.User;
import com.example.bureau1.services.UserServices;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserServices userServices;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(@ModelAttribute("user") User user, Model model) {
        if (userServices.createUser(user)){
            model.addAttribute("errorMessage", "Користувач з ім'ям: " + user.getUsername() + " уже існує");
            return "registration";
        }
        return "redirect:/login";
    }


}

