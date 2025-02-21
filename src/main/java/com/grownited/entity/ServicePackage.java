package com.grownited.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "servicePackages")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ServicePackage {

	@Id
	@GeneratedValue
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
