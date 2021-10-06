package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.OrderRoomConverter;
import com.laptrinhjavaweb.dto.OrderRoomDTO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.entity.OrderRoomEntity;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.repository.OrderRoomRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IOrderRoomService;
import com.opensymphony.sitemesh.compatability.OldDecorator2NewDecorator;

@Service
public class OrderRoomService implements IOrderRoomService{

	@Autowired
	private OrderRoomRepository orderRoomRepository;
	
	@Autowired
	private OrderRoomConverter orderRoomConverter;
	
	@Autowired
	private INewService newservice;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<OrderRoomDTO> findAll() {
		List<OrderRoomDTO> models = new ArrayList<>();
		List<OrderRoomEntity> entities = orderRoomRepository.findAll();
		for(OrderRoomEntity item:entities){
			OrderRoomDTO dto = orderRoomConverter.toDto(item);
			models.add(dto);
		}
		return models;
	}

	@Override
	public List<OrderRoomDTO> findListOrderByUserId(Long id) {
		List<OrderRoomDTO> models = new ArrayList<>();
		List<OrderRoomEntity> entities = orderRoomRepository.getListOrderByUserId(id);
		for(OrderRoomEntity item : entities){
		
			OrderRoomDTO dto = orderRoomConverter.toDto(item);
			models.add(dto);
		}
// 		Cách 2: 
//		List<ProductDTO> productDtO = new ArrayList<>();
//		productDtO=	newservice.findListProductByUserID(id);
//		for(int i =0 ; i< productDtO.size();i++){
//			for(int j = 0;j<productDtO.get(i).getListOrder().size();j++){
//				OrderRoomDTO dto = productDtO.get(i).getListOrder().get(j);
//				models.add(dto);
//			}
//			
//			
//		}
		
		
		return models;
	}

	@Override
	public OrderRoomDTO save(OrderRoomDTO dto) {
		
		ProductEntity product = productRepository.findOne(dto.getProductId());
		OrderRoomEntity entity = new OrderRoomEntity();
		entity = orderRoomConverter.toEntity(dto);
		entity.setProduct(product);
		
		return orderRoomConverter.toDto(orderRoomRepository.save(entity));
	}

	@Override
	public int activeOrder(Long id) {
		OrderRoomEntity order = orderRoomRepository.findOne(id);
		order.setStatus("1");
		orderRoomRepository.save(order);
		return 1;
	}

}
