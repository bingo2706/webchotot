package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.OrderRoomDTO;

public interface IOrderRoomService {
	List<OrderRoomDTO> findAll();
	List<OrderRoomDTO> findListOrderByUserId(Long id);
	int activeOrder(Long id);
	OrderRoomDTO save(OrderRoomDTO dto);
}
