package com.grownited.controller;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.UserEntity;
import com.grownited.enumD.Bookstatus;
import com.grownited.repository.BookingRepository;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.CategoryService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PageController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BookingRepository bookingRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CategoryRepository categoryRepository;
//	opening home page
	@GetMapping(value = {"/", "/home"})
	public String openHomePage(HttpSession httpSession,Model model) {
//		UUID userId=(UUID)httpSession.getAttribute("userId");
//		 System.out.println("Session User ID: " + userId);  // Debugging line
//		    
//		if(userId == null) {
			List<CategoryEntity> categoryList=categoryService.getAllCategory();
			model.addAttribute("categories", categoryList);
			return "Home";
			
//		}
//		return "redirect:/loginuserhome";
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
	public String loginUserHome(Model model) {
		System.out.println("This login user home is called");
		List<CategoryEntity> categories = categoryRepository.findAll();
    	model.addAttribute("categories", categories);
		return "LoginUserHome";
	}
	
	
	@GetMapping("/service-provider/panel")
	public String serviceProviderPanel() {
		return "ServiceProviderPanel";
	}
	
	@GetMapping("/service-provider/dashboard")
	public String serviceProviderDashboard(Model model,HttpSession httpSession) {
		  Optional<UserEntity> op = userRepository.findById((UUID)httpSession.getAttribute("userId"));
		  Long totalBookings=bookingRepository.countByServiceProvider_UserId((UUID)httpSession.getAttribute("userId"));
		  Long completedBookings=bookingRepository.countByServiceProvider_UserIdAndStatus((UUID)httpSession.getAttribute("userId"),Bookstatus.ACCEPT);
		  Long pendingBookings=bookingRepository.countByServiceProvider_UserIdAndStatus((UUID)httpSession.getAttribute("userId"),Bookstatus.PENDING);
		  
		model.addAttribute("serviceProvider", op.get());
		model.addAttribute("totalBookings",totalBookings);
		model.addAttribute("completedBookings",completedBookings);
		model.addAttribute("pendingBookings", pendingBookings);
		return "ServiceProviderDashboard";
	}
	
	
	
	@GetMapping("admindashboard")
	public String adminDashborad() {
		return "AdminDashboard";
	}
	
	
	@GetMapping("/errorpage")
	public String errorPage() {
		return "ErrorPage";
	}
	
	

}
