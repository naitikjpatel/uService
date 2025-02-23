package com.grownited.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.ServiceEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.ServicesRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.CategoryService;

@Controller
public class ServiceController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ServicesRepository servicesRepository;
	
	@GetMapping("newservice")
	public String openService(Model model) {
		List<CategoryEntity> categoryList	=categoryService.getAllCategory();
		model.addAttribute("categories",categoryList);
		return "AddService";
	}
	@PostMapping("addservice")
	public String addService(ServiceEntity serviceEntity,@RequestParam UUID providerId,@RequestParam UUID categoryId) {
		//set date 
		serviceEntity.setCreatedAt(new Date());
		serviceEntity.setUpdatedAt(new Date());
		System.out.println(serviceEntity + "\n"+ providerId+"\n"+categoryId);
//		get user by providerId
		Optional<UserEntity> op=userRepository.findById(providerId);
		
		//get category by id
		CategoryEntity categoryEntity=categoryService.getCategoryById(categoryId);
		
		System.out.println(serviceEntity + "\n"+ op.get()+"\n"+categoryEntity);
		//set fk
		serviceEntity.setUserEntity(op.get());
		
		//set fk
		serviceEntity.setCategory(categoryEntity);
		servicesRepository.save(serviceEntity);
		
		return "redirect:/newservice";
	}
	
	//list of services
	
	
	//here i want a serivces by the categories and providerId also
	
	
	
	@GetMapping("/get-services-by-categoryId")
	public String getAllServiceByCategoryId(@RequestParam("categoryId") UUID categoryId,Model model) {
		List<ServiceEntity> serviceList=servicesRepository.findByCategory_CategoryId(categoryId);
		return "SeriveList";
	}
	
	
	@GetMapping("/get-serivces-by-providerId")
	public String getAllServicesOfProvider(@RequestParam("providerId") UUID userId,Model model) {
		List<ServiceEntity> serviceList=servicesRepository.findByUserEntity_UserId(userId);
		return "";
	}
	
	/* This method for the admin */

	@GetMapping("/servicelist")
	public String getAllService(Model model) {
		List<ServiceEntity> serviceList=servicesRepository.findAll();
		model.addAttribute("services", serviceList);
		return "ServiceList";
	}
	
	
	@GetMapping("/deleteservice")
	public String deleteServiceById(@RequestParam("id") UUID serviceId) {
		Optional<ServiceEntity> op=servicesRepository.findById(serviceId);
		if(op.isEmpty()) {
			return "redirect:/login";
		}
		servicesRepository.delete(op.get());
		return "redirect:/servicelist";
	}
	
	@GetMapping("/editservice")
	public String editService(@RequestParam("id") UUID serviceId,Model model) {
		Optional<ServiceEntity> op=servicesRepository.findById(serviceId);
		ServiceEntity serviceEntity=op.get();
		if(op.isEmpty()) {
			return "redirect:/login";
		}
		model.addAttribute("service",serviceEntity);
		return "EditService";
		
	}
	
}
