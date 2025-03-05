package com.grownited.entity;

import java.time.LocalTime;
import java.util.Date;
import java.util.UUID;

import com.grownited.enumD.Bookstatus;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
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
	@Enumerated(EnumType.STRING)
	Bookstatus status = Bookstatus.PENDING; //set the default value pending
	
	
//	1:1
	
	 // Customer Relationship
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    UserEntity user;

    // Service Provider Relationship
    @ManyToOne
    @JoinColumn(name = "serviceProviderId", nullable = false)
     UserEntity serviceProvider;

   
    // The booked service
    @ManyToOne
    @JoinColumn(name = "serviceId", nullable = false)
    private ServiceEntity service;


    
}
