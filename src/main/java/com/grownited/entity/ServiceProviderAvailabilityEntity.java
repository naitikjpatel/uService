package com.grownited.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ServiceProviderAvailabilityEntity {

	UUID serviceProviderAvailid;
	

	Boolean isAvailable;
	
	//fk
	UUID providerId;

}
