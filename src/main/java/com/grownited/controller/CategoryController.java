package com.grownited.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CategoryEntity;
import com.grownited.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired 
	private CategoryService categoryService;
	
	@GetMapping("/opencategory")
	public String addCategory() {
		return "AddCategory";
	}
	
	@PostMapping("addcategory")
	public String saveCategory(CategoryEntity categoryEntity)
	{
		categoryService.createCategory(categoryEntity);
		return "redirect:/listcategory";
	}
	
	//this will list all the category on webapp
	@GetMapping("/listcategory")
	public String getAllCategory(Model model) {
		List<CategoryEntity> categoryList=categoryService.getAllCategory();
		
		model.addAttribute("categoryList", categoryList);
		return "CategoryList";
	}
	
	//this for the delete category by id
	@GetMapping("/deletecategory/{categoryId}")
	public String deleteCategoryById(@PathVariable UUID categoryId) {
		categoryService.deleteCategory(categoryId);
		return "redirect:/listcategory";
	}
	
	@GetMapping("/editcategory/{categoryId}")
	public String editCategoryById(@PathVariable UUID categoryId,Model model) {
		CategoryEntity category=categoryService.getCategoryById(categoryId);
		model.addAttribute("category",category);
		return "EditCategory";
	}
	
	@PostMapping("/updatecategory")
	public String updateCategory(@ModelAttribute CategoryEntity categoryEntity) {
		categoryService.updateCategory(categoryEntity,categoryEntity.getCategoryId());
		return "redirect:/listcategory";
	}
}

