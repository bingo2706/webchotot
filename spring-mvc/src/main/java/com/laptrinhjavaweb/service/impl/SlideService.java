package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.SlideConverter;
import com.laptrinhjavaweb.dto.SlideDTO;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.SlideEntity;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.repository.SlideRepository;
import com.laptrinhjavaweb.service.ISlideService;

@Service
public class SlideService implements ISlideService{

	@Autowired
	private SlideRepository slideRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private SlideConverter slideConverter;
	
	@Override
	public List<SlideDTO> findAll(Pageable pageble) {
		List<SlideDTO> models = new ArrayList<>();
		List<SlideEntity> entity = slideRepository.findAll(pageble).getContent();
		for(SlideEntity item: entity){
			SlideDTO slideDTO = slideConverter.toDto(item);
			models.add(slideDTO);
		}
		return models;
	}

	@Override
	public SlideDTO save(SlideDTO dto) {
		ProductEntity productEntity = productRepository.findOne(dto.getProductId());
		SlideEntity entity = new SlideEntity();
		if(dto.getId() != null){
			SlideEntity oldEntity = slideRepository.findOne(dto.getId());
			oldEntity.setProduct(productEntity);
			entity = slideConverter.toEntity(oldEntity, dto);
		}else{
			
			entity = slideConverter.toEntity(dto);
			entity.setProduct(productEntity);
		}
		return slideConverter.toDto(slideRepository.save(entity));
	}

	@Override
	public SlideDTO findById(Long id) {
		SlideEntity entity = slideRepository.findOne(id);
		return slideConverter.toDto(entity);
	}

	@Override
	public void delete(long[] ids) {
		for(long id : ids){
			slideRepository.delete(id);
		}
	}

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		return (int) slideRepository.count();
	}
	
}
