package com.grownited.repository;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.BookingEntity;
import com.grownited.entity.UserEntity;

@Repository
public interface BookingRepository extends JpaRepository<BookingEntity, UUID> {

	List<BookingEntity> findByUser_UserId(UUID userId);
	 // Find bookings where the service provider's userId matches
    List<BookingEntity> findByServiceUserEntityUserId(UUID providerId);
    
    
    List<BookingEntity> findByService_UserEntity_UserId(UUID providerId);
    // Check if a provider is already booked at a specific date and time
    boolean existsByServiceProvider_UserIdAndBookingDateAndBookingTime(UUID providerId, Date bookingDate, LocalTime bookingTime);

}
