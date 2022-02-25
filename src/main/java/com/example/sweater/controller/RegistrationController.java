package com.example.sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

import javax.validation.Valid;

import com.example.sweater.domain.User;
import com.example.sweater.service.UserService;

@Controller
public class RegistrationController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}
	
	@PostMapping("/registration")
	public String addUser(@Valid User user, BindingResult bindingResult, Model model) {
        if (user.getPassword() != null && !user.getPassword().equals(user.getPassword2())) {
            model.addAttribute("password2Error", "Passwords are different!");
        }

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }

		if (!userService.addUser(user)) {
			model.addAttribute("usernameError", "User exists!");
			return "registration";
		}

        model.addAttribute("message", "User successfully registered!");
        model.addAttribute("messageType", "alert-success");
		return "login";
	}

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated!");
            model.addAttribute("messageType", "alert-success");
        } else {
            model.addAttribute("message", "Activation code is not found!");
            model.addAttribute("messageType", "alert-danger");
        }

        return "login";
    }
}
