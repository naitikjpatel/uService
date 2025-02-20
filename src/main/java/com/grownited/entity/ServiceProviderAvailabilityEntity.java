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
public class ServiceProviderAvailabilityEntity {

	@Id
	@GeneratedValue
	UUID serviceProviderAvailid;
	

	Boolean isAvailable;
	
	//fk
	UUID providerId;

}
