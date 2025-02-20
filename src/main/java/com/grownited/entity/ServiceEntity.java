package com.grownited.entity;

import java.util.Date;
import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "services")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ServiceEntity {

	@Id
	@GeneratedValue
	UUID serviceId;
	String serviceName;
	String description;
	Date createdAt;
	Date updatedAt;
	
	//this both fk
	UUID providerId;  
	
	@ManyToOne
	@JoinColumn(name = "categoryId" )  //bidirectional mapping 
	CategoryEntity category;
	
	
	
	
}
