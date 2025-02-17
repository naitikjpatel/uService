package com.grownited.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserEntity;

@Controller
public class SessionController {

//	opening home page
	@GetMapping("/")
	public String openHomePage() {
		return "Home";
	}
	
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
	@PostMapping("saveUser")
	public String saveUser(@ModelAttribute UserEntity userEntity) {
		
		userEntity.setCreated_at(new Date());
		userEntity.setUpdated_at(new Date());
		return "Login";
	}
	
	//This is url to loginUser : for login
	@PostMapping("loginuser")
	public String loginUser() {
		return "Home";
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
	
	
	
}
