package com.grownited.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.BookingEntity;

@Repository
public interface BookingRepository extends JpaRepository<BookingEntity, UUID> {

}
