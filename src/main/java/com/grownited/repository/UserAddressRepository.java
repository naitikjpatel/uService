package com.grownited.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.UserAddressEntity;

public interface UserAddressRepository extends JpaRepository<UserAddressEntity, UUID>{

}
