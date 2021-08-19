package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();
	List<CategoryDTO> findAllList(Pageable pageble);
	CategoryDTO save(CategoryDTO dto);
	CategoryDTO findById(Long id);
	void delete(long[] ids);
	int getTotalItem();
}
