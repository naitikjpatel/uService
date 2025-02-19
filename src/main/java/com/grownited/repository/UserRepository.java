package com.grownited.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity,UUID> {
	UserEntity findByEmailIdAndPassword(String emailId, String password);
}
