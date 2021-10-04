package com.laptrinhjavaweb.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.entity.ProductDetailEntity;
import com.laptrinhjavaweb.entity.ProductEntity;

@Component
public class ProductConverter {
	
	@Autowired
	private ProductDetailConverter productDetailConverter;
	
	public ProductDTO toDto(ProductEntity entity){
		ProductDTO result = new ProductDTO();
		result.setTitle(entity.getTitle());
		for(int i =0 ; i< entity.getProductdetail().size();i++){
			for(int j = 0 ; j< entity.getProductdetail().get(i).getProductimage().size();j++){
				result.setThumbnail(entity.getProductdetail().get(i).getProductimage().get(j).getThumbnail());
			}
		}
		List<ProductDetailDTO> listDetail = new ArrayList<>();
	    for(ProductDetailEntity item : entity.getProductdetail()){
	    	ProductDetailDTO dto = productDetailConverter.toDto(item);
	    	listDetail.add(dto);
	    }
	    result.setListDetail(listDetail);
		result.setShortDescription(entity.getShortDescription());
		result.setId(entity.getId());
		result.setCategoryId(entity.getCategory().getId());
		result.setCreatedDate(entity.getCreatedDate());
		result.setCategoryCode(entity.getCategory().getCode());
		result.setCategoryName(entity.getCategory().getName());		
		result.setAddress(entity.getAddress());
		result.setStatus(entity.getStatus());
		result.setCreatedBy(entity.getCreatedBy());
	
		
		return result;
	}
	public ProductEntity toEntity(ProductDTO dto){
		ProductEntity result = new ProductEntity();
		result.setTitle(dto.getTitle());
		result.setThumbnail(dto.getThumbnail());
		result.setShortDescription(dto.getShortDescription());
		result.setAddress(dto.getAddress());
		result.setStatus(dto.getStatus());
		return result;
	}
	public ProductEntity toEntity(ProductEntity result ,ProductDTO dto){
		result.setTitle(dto.getTitle());
		result.setThumbnail(dto.getThumbnail());
		result.setShortDescription(dto.getShortDescription());
		result.setAddress(dto.getAddress());
		result.setStatus(dto.getStatus());
		return result;
	}
}
