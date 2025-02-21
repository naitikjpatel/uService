package com.grownited.entity;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.grownited.enumD.Role;
import com.grownited.enumD.Status;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "services")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ServiceEntity {

	@Id
	@GeneratedValue(generator = "UUID")
	UUID serviceId;
	String serviceName;
	String description;
	Date createdAt;
	Date updatedAt;
	
	//this both fk
//	UUID providerId;
	
	@ManyToOne
	@JoinColumn(name="providerId")
	@ToString.Exclude
	UserEntity userEntity;
	
	@ManyToOne
	@JoinColumn(name = "categoryId" )  //bidirectional mapping 
	CategoryEntity category;
	
	
	
	
}
