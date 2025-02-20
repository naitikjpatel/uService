package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserProfileController {

	@GetMapping("/profile")
	public String openProfilePage() {
		return "UserProfile"; 
	}
}
