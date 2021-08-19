package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.SlideDTO;
import com.laptrinhjavaweb.entity.SlideEntity;

@Component
public class SlideConverter {
	public SlideDTO toDto(SlideEntity entity){
		SlideDTO result = new SlideDTO();
		result.setName(entity.getName());
		result.setDescription(entity.getDescription());
		result.setThumbnail(entity.getThumbnail());
		result.setId(entity.getId());
		result.setProductId(entity.getProduct().getId());
		result.setCreatedDate(entity.getCreatedDate());
		return result;
	}
	public SlideEntity toEntity(SlideDTO dto){
		SlideEntity result = new SlideEntity();
		result.setName(dto.getName());
		result.setDescription(dto.getDescription());
		result.setThumbnail(dto.getThumbnail());
		return result;
	}
	public SlideEntity toEntity(SlideEntity result,SlideDTO dto){
		
		result.setName(dto.getName());
		result.setDescription(dto.getDescription());
		
		return result;
	}
}
