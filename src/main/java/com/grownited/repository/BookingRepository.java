package com.grownited.repository;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grownited.entity.BookingEntity;
import com.grownited.entity.UserEntity;
import com.grownited.enumD.Bookstatus;

@Repository
public interface BookingRepository extends JpaRepository<BookingEntity, UUID> {

	List<BookingEntity> findByUser_UserId(UUID userId);
	 // Find bookings where the service provider's userId matches
    List<BookingEntity> findByServiceUserEntityUserId(UUID providerId);
    
    
    List<BookingEntity> findByService_UserEntity_UserId(UUID providerId);
    // Check if provider is already booked for the given date and time
    Long countByServiceProvider_UserIdAndBookingDateAndBookingTime(UUID serviceProviderId, Date bookingDate, LocalTime bookingTime);

    
    long countByServiceProvider_UserId(UUID serviceProviderId);

    // ✅ Pending bookings for a service provider
    long countByServiceProvider_UserIdAndStatus(UUID serviceProviderId, Bookstatus status);

}
