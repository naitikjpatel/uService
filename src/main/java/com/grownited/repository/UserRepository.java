package com.grownited.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.UserEntity;
import com.grownited.entity.ServiceEntity;


public interface UserRepository extends JpaRepository<UserEntity,UUID> {
	UserEntity findByEmailIdAndPassword(String emailId, String password);
	Optional<UserEntity> findByEmailId(String emailId);
	
	

}
