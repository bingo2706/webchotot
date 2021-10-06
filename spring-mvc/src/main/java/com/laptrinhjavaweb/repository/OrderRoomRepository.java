package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.OrderRoomEntity;

public interface OrderRoomRepository extends JpaRepository<OrderRoomEntity, Long>{
	@Query("select o from orderroom o,user u, "
			+ "product p where o.product.id = p.id and u.userName = p.createdBy and u.id = ?1")
	public List<OrderRoomEntity> getListOrderByUserId(Long id);
}
