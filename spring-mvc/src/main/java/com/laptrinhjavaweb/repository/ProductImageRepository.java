package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.ProductImageEntity;

public interface ProductImageRepository extends JpaRepository<ProductImageEntity, Long>{
	List<ProductImageEntity> findOneByProductdetail_id(Long id);
	 void deleteByProductdetail_id(Long product_id);
}
