package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.ProductImageDTO;
import com.laptrinhjavaweb.entity.ProductImageEntity;

@Component
public class ProductImageConverter {
	public ProductImageDTO toDto(ProductImageEntity entity){
		ProductImageDTO result = new ProductImageDTO();
		result.setCaption(entity.getCaption());
		result.setThumbnail(entity.getThumbnail());
		result.setProductId(entity.getProductdetail().getId());
		result.setId(entity.getId());
		return result;
	}
	public ProductImageEntity toEntity(ProductImageDTO dto){
		ProductImageEntity result = new ProductImageEntity();
		result.setCaption(dto.getCaption());
		result.setThumbnail(dto.getThumbnail());
		return result;
	}
}
