package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;

@Component
public class CommentConverter {
	public CommentDTO toDto(CommentEntity entity){
		CommentDTO result = new CommentDTO();
		result.setContent(entity.getContent());
		result.setId(entity.getId());
		result.setParentId(entity.getParentId());
		result.setUserId(entity.getUsers().getId());
		result.setProductId(entity.getProduct().getId());
		result.setNameUser(entity.getUsers().getFullName());
		result.setCreatedDate(entity.getCreatedDate());
		result.setThumbnail(entity.getUsers().getThumbnail());
		return result;
	}
	public CommentEntity toEntity(CommentDTO dto){
		CommentEntity result = new CommentEntity();
		result.setContent(dto.getContent());
		result.setParentId(dto.getParentId());
	
		return result;
	}
	public CommentEntity toEntity(CommentEntity result,CommentDTO dto){
		result.setContent(dto.getContent());
		result.setParentId(dto.getParentId());
		return result;
	}
}
