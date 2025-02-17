package com.grownited.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PageController {

	@GetMapping("/aboutus")
	public String aboutUsPage() {
		return "About";
	}
}
