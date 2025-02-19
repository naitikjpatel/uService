package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ServiceController {

	@GetMapping("newservice")
	public String openService() {
		return "Services";
	}
	@PostMapping("addservice")
	public String addService() {
		return "redirect:/newservice";
	}
}
