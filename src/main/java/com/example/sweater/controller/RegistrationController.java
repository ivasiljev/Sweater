package com.example.sweater.controller;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.UserRepo;

@Controller
public class RegistrationController {
	@Autowired
	private UserRepo userRepo;
	
	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}
	
	@PostMapping("/registration")
	public String addUser(User user, Model model) {
		User userFromDB = userRepo.findByUsername(user.getUsername());
		
		if (userFromDB != null) {
			model.addAttribute("message", "User exists!");
			return "registration";
		}
		
		user.setActive(true);
		user.setRoles(Collections.singleton(Role.USER));
		userRepo.save(user);
		
		return "redirect:/login";
	}
}
