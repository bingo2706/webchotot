package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{
     UserEntity findOneByUserNameAndStatus(String name, int status);
     UserEntity findOneByEmail(String email);
     UserEntity findOneByUsertoken(String usertoken);
}
