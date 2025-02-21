package com.grownited.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/userlist")
	public String getAllUser(HttpSession httpSession,Model model) {
		List<UserEntity> userList=userRepository.findAll();
		model.addAttribute("users" ,userList);
		return "UserList";
	}
	
	@GetMapping("/deleteuser/{userId}")
	public String deleteUserById(@PathVariable UUID userId) {
		userRepository.deleteById(userId);
		return "redirect:/userlist";
	}
	
	
}
