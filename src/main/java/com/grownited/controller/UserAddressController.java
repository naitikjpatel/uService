package com.grownited.controller;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserAddressEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserAddressRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.UserAddressService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserAddressController {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private UserAddressRepository userAddressRepository;
	
	@PostMapping("/updateuseraddress")
	public String updateUserAddress(UserAddressEntity addressEntity,HttpSession httpSession) {
			UserEntity userEntity=(UserEntity)httpSession.getAttribute("user");
			addressEntity.setUserEntity(userEntity);
			//lat and long
			userAddressRepository.save(addressEntity);
			
		return "redirect:/profile";
	}
}
