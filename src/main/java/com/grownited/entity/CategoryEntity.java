package com.grownited.entity;

import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "categories")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CategoryEntity {

	@Id
	@GeneratedValue
	UUID categoryId;
	String categoryName;
	String categoryDescription;
//	MultipartFile categoryPic;
//	String categoryPicUrl;
	
	@OneToMany(mappedBy = "category",cascade = CascadeType.ALL)
	List<ServiceEntity> services;
}