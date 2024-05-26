package com.example.bureau1.controllers;

import com.example.bureau1.models.Things;
import com.example.bureau1.services.BureauServices;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

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
    public String ThingsInfo(@PathVariable Long id, Model model){
        Things things = bureauServices.getThingsById(id);
        model.addAttribute("things", things);
        model.addAttribute("images", things.getImages());
        return "things-info";
    }

    @PostMapping("/things/create")
    public String createThings(@RequestParam("file1") MultipartFile file1,
                               @RequestParam("file2") MultipartFile file2,
                               @RequestParam("file3") MultipartFile file3,
                               Things things, Principal principal) throws IOException {
        bureauServices.saveThings(principal,things, file1, file2, file3 );
        return "redirect:/";
    }
    @PostMapping("/things/delete/{id}")
    public String deleteThing(@PathVariable Long id){
        bureauServices.deleteThing(id);
        return "redirect:/";

    }
}



