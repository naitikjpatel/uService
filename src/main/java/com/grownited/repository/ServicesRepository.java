package com.grownited.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.ServiceEntity;

public interface ServicesRepository extends JpaRepository<ServiceEntity, UUID> {

}
