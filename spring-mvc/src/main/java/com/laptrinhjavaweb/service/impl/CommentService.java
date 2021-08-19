package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CommentConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICommentService;

@Service
public class CommentService implements ICommentService{

	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private CommentConverter commentConverter;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public CommentDTO save(CommentDTO dto) {
		CommentEntity entity = new CommentEntity();
		
		if(dto.getId() !=null){
			CommentEntity oldEntity = commentRepository.findOne(dto.getId());
			oldEntity.setProduct(productRepository.findOne(dto.getProductId()));
			oldEntity.setUsers(userRepository.findOne(dto.getUserId()));
			entity = commentConverter.toEntity(oldEntity, dto);
		}else{
			entity = commentConverter.toEntity(dto);
			entity.setProduct(productRepository.findOne(dto.getProductId()));
			entity.setUsers(userRepository.findOne(dto.getUserId()));
		}
		
		return commentConverter.toDto(commentRepository.save(entity));
	}

	@Override
	public List<CommentDTO> findAllByProductId(Long product_id) {
		List<CommentDTO> models = new ArrayList<>();
		List<CommentEntity> entity = commentRepository.findOneByProduct_id(product_id);
		for(CommentEntity item : entity){
			CommentDTO dto = commentConverter.toDto(item);
			models.add(dto);
			
		}
		return models;
	}

	@Override
	public void delete(Long id) {
		commentRepository.delete(id);
		
	}
	
}
