package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CategoryEntity;

@Controller
public class CategoryController {

	@GetMapping("/opencategory")
	public String addCategory() {
		return "AddCategory";
	}
	
	@PostMapping("savecategory")
	public String saveCategory(CategoryEntity categoryEntity)
	{
		return "redirect:/opencategory";
	}
}
