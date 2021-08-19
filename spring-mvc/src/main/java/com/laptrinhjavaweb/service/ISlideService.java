package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.SlideDTO;

public interface ISlideService {
	List<SlideDTO> findAll(Pageable pageble);
	SlideDTO save(SlideDTO dto);
	SlideDTO findById(Long id);
	void delete(long[] ids);
	int getTotalItem();
}
