package com.grownited.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserAddressEntity {
	@Id
	@GeneratedValue
	UUID id;
	
	String addressLine;
//	String city;
//	String state;
//	String postalCode;
//	String country;
	Double latitude;
	Double longtitude;

//	fk
	UUID userId;
}
