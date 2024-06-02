package com.example.bureau1.controllers;

import com.example.bureau1.models.Things;
import com.example.bureau1.models.User;
import com.example.bureau1.repositories.BureauRepository;
import com.example.bureau1.services.BureauServices;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.NoSuchElementException;

@RequiredArgsConstructor
@Controller

public class MainController {

    private final BureauServices bureauServices;

    @GetMapping("/")
    public String home(@RequestParam(name = "title", required = false) String title, Model model, Principal principal) {
        model.addAttribute("things", bureauServices.listThings(title));
        model.addAttribute("user", bureauServices.getUserByPrincipal(principal));
        return "home";
    }

    @GetMapping("/things/{id}")
    public String thingsInfo(@PathVariable Long id, Model model, Principal principal) {
        Things things = bureauServices.getThingsById(id);
        model.addAttribute("user", bureauServices.getUserByPrincipal(principal));
        model.addAttribute("things", things);
        model.addAttribute("images", things.getImages());
        model.addAttribute("authorThings", things.getUser());
        return "things-info";
    }

    @PostMapping("/things/create")
    public String createThings(@RequestParam("file1") MultipartFile file1,
                               @RequestParam("file2") MultipartFile file2,
                               @RequestParam("file3") MultipartFile file3,
                               Things things, Principal principal) throws IOException {
        bureauServices.saveThings(principal, things, file1, file2, file3);
        return "redirect:/";
    }
    @PostMapping("/things/delete/{id}")
    public String delete(@PathVariable Long id, Principal principal) {
        User user = bureauServices.getUserByPrincipal(principal);

        try {
            bureauServices.delete(user,id);
            return "correct_delete";
        } catch (IllegalArgumentException | NoSuchElementException e) {
            return "error_things";
        }
    }
    @GetMapping("/about_us")
    public String about_us(Model model, Principal principal){
        User user = bureauServices.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "about_us";
    }
    @GetMapping("/create")
    public String create(Model model, Principal principal){
        User user = bureauServices.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "create";
    }

@Autowired
private BureauRepository bureauRepository;
    @GetMapping("/search")
    public String searchByKeywords(@RequestParam String keywords, Model model, Principal principal) {
        String key = keywords;
        if (keywords.isEmpty()) return "redirect:/";

        User user = bureauServices.getUserByPrincipal(principal);
        model.addAttribute("user", user);

        Iterable<Things> allThings = bureauRepository.findAll();
        ArrayList<Things> searchResults = new ArrayList<>();

        for (Things thing : allThings) {
            if (thing.getKeywords().contains(keywords)) {
                searchResults.add(thing);
            }
        }

        model.addAttribute("key", key);
        model.addAttribute("searchings", searchResults);
        return "search";
    }

}









