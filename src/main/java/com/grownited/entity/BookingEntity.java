package com.grownited.entity;

import java.time.LocalTime;
import java.util.Date;
import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "Bookings")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookingEntity {

	@Id
	@GeneratedValue
	UUID id;
	Date bookingDate;
	LocalTime  bookingTime;
	String status;
	Double price;
	
//	1:1
	UUID userId;
	UUID providerId;
	UUID serviceId;

}
