package com.grownited.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;
import com.grownited.service.FileUploadService;

@Controller
public class SessionController {

	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private	UserRepository userRepository;
	
	//This open the singup page
	@GetMapping(value = {"sp","signup"})
	public String signUp() {
		return "Signup";
	}
	
	//This open the Login Page
	@GetMapping("login")
	public String login() {
		
		
		return "Login";}
	
	
	//This open the forgot password jsp
	@GetMapping("forgotpassword")
	public String forgotPassword()
	{
		
		return "ForgotPassword";
	}
	
	//This is url to save the user in the database . for signup
	
//	this use when we take the photo of the user
//	@PostMapping("saveUser")
//	public String saveUser(@ModelAttribute UserEntity userEntity) {
//		
//		userEntity.setCreatedAt(new Date());
//		userEntity.setUpdatedAt(new Date());
//		fileUploadService.uploadUserImage(userEntity.getProfilePic(),userEntity.getEmailId());
//		
//		
//		String path="images/products/";
//		String imgName=userEntity.getProfilePic().getOriginalFilename();
//		
//		String imgSrc=path+imgName;
//		userEntity.setProfilePicUrl(imgSrc);
//	
//		
//		return "Login";
//	}
	
	@PostMapping("saveUser")
	public String saveUser(@ModelAttribute UserEntity userEntity) {
		
		userEntity.setCreatedAt(new Date());
		userEntity.setUpdatedAt(new Date());
		
		userRepository.save(userEntity);
		return "redirect:/login";
	}
	
	
	
	//This is url to loginUser : for login
	@PostMapping("loginuser")
	public String loginUser(UserEntity userEntity) {
		userEntity= userRepository.findByEmailIdAndPassword(userEntity.getEmailId(), userEntity.getPassword());
		if(userEntity!=null)
		return "Home";
		else
			return "redirect:/login";
	}
	
	//Update Password url
	@PostMapping("updatePassword")
	public String updatePassword() {
		return "Login";
	}
	
	@PostMapping("sendotp")
	public String sendOtp() {
		return "UpdatePassword";
	}
	
	
	@GetMapping("logout")
	public String logout() {
		return "Home";
	}
	
	
}
