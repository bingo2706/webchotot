package com.laptrinhjavaweb.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.ProductImageDTO;
import com.laptrinhjavaweb.entity.ProductDetailEntity;
import com.laptrinhjavaweb.entity.ProductImageEntity;


@Component
public class ProductDetailConverter {
	
	@Autowired
	private ProductImageConverter productImageConverter;
	
	public ProductDetailDTO toDto(ProductDetailEntity entity){
		ProductDetailDTO result = new ProductDetailDTO();
		result.setAcreage(entity.getAcreage());
		result.setContent(entity.getContent());
		result.setId(entity.getId());
		result.setPrice(entity.getPrice());
		result.setOriginalPrice(entity.getOriginalPrice());
		result.setStock(entity.getStock());
		result.setName(entity.getName());
		result.setProductId(entity.getProduct().getId());
		List<ProductImageDTO> listImg = new ArrayList<>();
		for(ProductImageEntity item : entity.getProductimage()){
			ProductImageDTO dto = productImageConverter.toDto(item);
			listImg.add(dto);
		}
		result.setListImg(listImg);
		return result;
	}
	public ProductDetailEntity toEntity(ProductDetailDTO dto){
		ProductDetailEntity result = new ProductDetailEntity();
		result.setAcreage(dto.getAcreage());
		result.setContent(dto.getContent());
		result.setPrice(dto.getPrice());
		result.setOriginalPrice(dto.getOriginalPrice());
		result.setStock(dto.getStock());
		result.setName(dto.getName());
		return result;
	}
	public ProductDetailEntity toEntity(ProductDetailEntity result,ProductDetailDTO dto){
	
		result.setAcreage(dto.getAcreage());
		result.setContent(dto.getContent());
		result.setPrice(dto.getPrice());
		result.setOriginalPrice(dto.getOriginalPrice());
		result.setStock(dto.getStock());
		result.setName(dto.getName());
		return result;
	}
}
