package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService{
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for(CategoryEntity item: entities){
			result.put(item.getCode(), item.getName());
		}
		return result;
	}

	@Override
	public List<CategoryDTO> findAllList(Pageable pageable) {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entity = categoryRepository.findAll(pageable).getContent();
		for(CategoryEntity item: entity){
			CategoryDTO categoryDTO = categoryConverter.toDto(item);
			models.add(categoryDTO);
		}
		return models;
	}

	@Override
	public CategoryDTO save(CategoryDTO dto) {
		CategoryEntity entity = new CategoryEntity();
		if(dto.getId() !=null){
			CategoryEntity oldCategory = categoryRepository.findOne(dto.getId());
			entity = categoryConverter.toEntity(oldCategory, dto);
		}else{
			entity = categoryConverter.toEntity(dto);
		}
		return categoryConverter.toDto(categoryRepository.save(entity));
	}

	@Override
	public void delete(long[] ids) {
		for(long id : ids){
			categoryRepository.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		return (int)categoryRepository.count();
	}

	@Override
	public CategoryDTO findById(Long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		
		return categoryConverter.toDto(entity);
	}

}
