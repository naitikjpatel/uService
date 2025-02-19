package com.grownited.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ServicePackage {


	UUID servicePackageId;
	String packageName;
	Double basicPrice;
	Float tax;
	Double commision;

	String status;
	String otherInfo;
	
	
	//fk
	UUID categoryId;
	UUID serviceId;
	UUID userId;

}
