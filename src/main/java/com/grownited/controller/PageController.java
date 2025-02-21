package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PageController {

	
//	opening home page
	@GetMapping(value = {"/", "/home"})
	public String openHomePage() {
//		System.out.println("Home page is called");
		return "Home";
	}

	
	@GetMapping("/aboutus")
	public String aboutUsPage() {
		return "About";
	}
	
	@GetMapping("/contactus")
	public String openContactUsPage() {
		return "ContactUs";
	}
	
	
	@GetMapping("/admin/dashboard")
	public String openAdminPanel() {
		return "AdminPanel";
	}
	
	
	
}
