package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SessionController {

	@GetMapping(value = {"/","signup"})
	public String signUp() {
		return "Signup";
	}
	
	@GetMapping("login")
	public String login() {
		return "Login";
	}
	
	@GetMapping("fp")
	public String forgotPassword() {
		return "ForgotPassword";
	}
	
	
	
	
}
