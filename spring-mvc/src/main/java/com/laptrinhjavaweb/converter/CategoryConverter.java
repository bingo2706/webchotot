package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;

@Component
public class CategoryConverter {
	public CategoryDTO toDto(CategoryEntity entities){
		CategoryDTO results = new CategoryDTO();
		results.setName(entities.getName());
		results.setCode(entities.getCode());
		results.setId(entities.getId());
		results.setStatus(entities.getStatus());
		results.setThumbnail(entities.getThumbnail());
		results.setCreatedDate(entities.getCreatedDate());
		return results;
	}
	public CategoryEntity toEntity(CategoryDTO dto){
		CategoryEntity results = new CategoryEntity();
		results.setName(dto.getName());
		results.setCode(dto.getCode());
		results.setStatus(dto.getStatus());
		results.setThumbnail(dto.getThumbnail());
		return results;
	}
	public CategoryEntity toEntity(CategoryEntity results,CategoryDTO dto){
		results.setName(dto.getName());
		results.setCode(dto.getCode());
		results.setStatus(dto.getStatus());
		results.setThumbnail(dto.getThumbnail());
		return results;
	}
}
