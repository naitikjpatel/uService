package com.grownited.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grownited.entity.CategoryEntity;
import com.grownited.service.CategoryService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PageController {

	@Autowired
	private CategoryService categoryService;
	
//	opening home page
	@GetMapping(value = {"/", "/home"})
	public String openHomePage(HttpSession httpSession,Model model) {
		UUID userId=(UUID)httpSession.getAttribute("userId");
		 System.out.println("Session User ID: " + userId);  // Debugging line
		    
		if(userId == null) {
			List<CategoryEntity> categoryList=categoryService.getAllCategory();
			model.addAttribute("categories", categoryList);
			return "Home";
			
		}
		return "redirect:/loginuserhome";
//		System.out.println("Home page is called");
		
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
	
	
	@GetMapping("/loginuserhome")
	public String loginUserHome() {
		System.out.println("This login user home is called");
		return "LoginUserHome";
	}
	
	
	@GetMapping("/service-provider/panel")
	public String serviceProviderPanel() {
		return "ServiceProviderPanel";
	}
	
	@GetMapping("/service-provider/dashboard")
	public String serviceProviderDashboard() {
		return "ServiceProviderDashboard";
	}
	
	
	
	@GetMapping("admindashboard")
	public String adminDashborad() {
		return "AdminDashboard";
	}
	
	
}
