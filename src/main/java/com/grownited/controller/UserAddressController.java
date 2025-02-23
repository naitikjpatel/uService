package com.grownited.controller;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserAddressEntity;
import com.grownited.entity.UserEntity;
import com.grownited.enumD.Role;
import com.grownited.repository.UserAddressRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.GeocodingService;
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
	@Autowired
	private GeocodingService geocodingService;
	
	@PostMapping("/updateuserprofile")
	public String updateUserProfile(@ModelAttribute UserEntity userEntity, HttpSession httpSession) {
	    UUID userId = (UUID) httpSession.getAttribute("userId");
	    
	    if (userId == null) {
	        return "redirect:/login";
	    }

	    // Find user by ID
	    Optional<UserEntity> op = userRepository.findById(userId);
	    
	    if (op.isEmpty()) {
	        return "redirect:/"; // User not found
	    }
	    
	    UserEntity existingUser = op.get();

	    // ✅ Update user details
	    existingUser.setName(userEntity.getName());
	    existingUser.setEmailId(userEntity.getEmailId());
	    existingUser.setPhone(userEntity.getPhone());
	    existingUser.setUpdatedAt(new Date());

	    // ✅ Update address details
	    if (userEntity.getUserAddressEntity() != null) {
	        Optional<UserAddressEntity> addressOp = userAddressRepository.findByUserEntity_UserId(userId);
	        
	        if (addressOp.isPresent()) {
	            UserAddressEntity existingAddress = addressOp.get();
	            existingAddress.setAddressLine(userEntity.getUserAddressEntity().getAddressLine());

	            Double[] points = geocodingService.getLatLongFromAddress(userEntity.getUserAddressEntity().getAddressLine());
	            existingAddress.setLatitude(points[0]);
	            existingAddress.setLongtitude(points[1]);

	            userAddressRepository.save(existingAddress);
	            existingUser.setUserAddressEntity(existingAddress);
	        } else {
	            UserAddressEntity newAddress = userEntity.getUserAddressEntity();
	            newAddress.setUserEntity(existingUser);

	            Double[] points = geocodingService.getLatLongFromAddress(newAddress.getAddressLine());
	            newAddress.setLatitude(points[0]);
	            newAddress.setLongtitude(points[1]);

	            userAddressRepository.save(newAddress);
	            existingUser.setUserAddressEntity(newAddress);
	        }
	    }

	    // ✅ Update status only if user is a SERVICE_PROVIDER
	    if (existingUser.getRole() == Role.SERVICE_PROVIDER && userEntity.getStatus() != null) {
	        existingUser.setStatus(userEntity.getStatus());
	    }

	    // Save updated user
	    userRepository.save(existingUser);
	    
	    return "redirect:/profile";
	}

	/*@PostMapping("/updateuserprofile")
	public String updateUserAddress(UserAddressEntity addressEntity, HttpSession httpSession) {
	    UUID userId = (UUID) httpSession.getAttribute("userId");
	    
	    if (userId == null) {
	        return "redirect:/login";
	    }

	    // Find the user by ID
	    Optional<UserEntity> op = userRepository.findById(userId);
	    
	    if (op.isEmpty()) {
	        return "redirect:/"; // User not found
	    }
	    
	    UserEntity user = op.get();  // Get the user entity

	    // **Ensure existing email and role are not lost**
	    String existingEmail = user.getEmailId();
	    Role existingRole = user.getRole();

	    // Find address by user ID
	    Optional<UserAddressEntity> opA = userAddressRepository.findByUserEntity_UserId(userId);

	    if (opA.isPresent()) {
	        // If address exists, update it
	        UserAddressEntity existingAddress = opA.get();
	        existingAddress.setAddressLine(addressEntity.getAddressLine());
	      Double[] points=geocodingService.getLatLongFromAddress(addressEntity.getAddressLine());
	        existingAddress.setLatitude(points[0]);
	        existingAddress.setLongtitude(points[1]);
	        System.out.println(addressEntity.getAddressLine());
	        System.out.println("update"+points[0]);
	        userAddressRepository.save(existingAddress);
	        user.setUserAddressEntity(existingAddress); // Ensure user reference remains
	    } else {
	        // If address doesn't exist, create a new one
	        addressEntity.setUserEntity(user);
	        Double[] points=geocodingService.getLatLongFromAddress(addressEntity.getAddressLine());
	        addressEntity.setLatitude(points[0]);
	        addressEntity.setLongtitude(points[1]);
	        System.out.println("new address"+addressEntity.getAddressLine());
	        System.out.println("x	new "+points[0]);
	        userAddressRepository.save(addressEntity);
	        user.setUserAddressEntity(addressEntity);
	    }

	    // 🔥 **Reassign Email and Role to prevent null**
	    user.setEmailId(existingEmail);
	    user.setRole(existingRole);

	    // **Save User Again**
	    userRepository.save(user);
	    
	    return "redirect:/profile";
	}
*/
}
