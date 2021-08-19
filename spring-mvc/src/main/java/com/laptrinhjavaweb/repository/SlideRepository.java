package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.SlideEntity;

public interface SlideRepository extends JpaRepository<SlideEntity, Long>{
	 void deleteByProduct_id(Long product_id);
}
