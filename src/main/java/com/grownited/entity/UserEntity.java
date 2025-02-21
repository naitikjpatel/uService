package com.grownited.entity;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.grownited.enumD.Role;
import com.grownited.enumD.Status;


import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "users")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserEntity {

	@Id
	@GeneratedValue
	UUID userId;
	String name;
	String emailId;
	String phone;
	String password;
	@Enumerated(EnumType.STRING)
	Role role;
	@Enumerated(EnumType.STRING)
	Status status;
//	MultipartFile profilePic;
	String profilePicUrl;
	Date createdAt;
	Date updatedAt;
	
	@OneToOne(mappedBy = "userEntity")
	UserAddressEntity userAddressEntity;
	
	@OneToMany(mappedBy = "userEntity")
	@ToString.Exclude
	List<ServiceEntity> serviceEntities;

}
