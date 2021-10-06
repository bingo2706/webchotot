package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.OrderRoomDTO;
import com.laptrinhjavaweb.entity.OrderRoomEntity;

@Component
public class OrderRoomConverter {
	
	public OrderRoomDTO toDto(OrderRoomEntity entity){
		OrderRoomDTO result = new OrderRoomDTO();
		result.setId(entity.getId());
		result.setAddress(entity.getAddress());
		result.setEmail(entity.getEmail());
		result.setFullname(entity.getFullname());
		result.setPhonenumber(entity.getPhonenumber());
		result.setProductId(entity.getProduct().getId());
		result.setStatus(entity.getStatus());
		return result;
	}
	
	public OrderRoomEntity toEntity(OrderRoomDTO dto){
		OrderRoomEntity result = new OrderRoomEntity();
		result.setAddress(dto.getAddress());
		result.setFullname(dto.getFullname());
		result.setEmail(dto.getEmail());
		result.setPhonenumber(dto.getPhonenumber());
		result.setStatus("0");
		return result;
	}

}
