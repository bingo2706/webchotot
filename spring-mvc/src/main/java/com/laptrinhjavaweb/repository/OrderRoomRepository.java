package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.OrderRoomEntity;

public interface OrderRoomRepository extends JpaRepository<OrderRoomEntity, Long>{
	
}
