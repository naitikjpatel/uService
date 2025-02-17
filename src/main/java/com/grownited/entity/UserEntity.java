package com.grownited.entity;

import java.util.Date;
import java.util.UUID;

import com.grownited.enumD.Role;
import com.grownited.enumD.Status;


import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "users")
@Data
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
	String profile_pic_url;
	Date created_at;
	Date updated_at;

}
