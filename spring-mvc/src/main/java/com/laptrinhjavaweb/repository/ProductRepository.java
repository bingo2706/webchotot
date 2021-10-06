package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>{
	List<ProductEntity> findOneByCategory_idAndTitleContaining(Long id,String title);
	List<ProductEntity> findOneByCategory_id(Long id);
	List<ProductEntity> findOneByTitleContaining(String title);
	List<ProductEntity> findOneByAddressContaining(String address);
	List<ProductEntity> findOneByCreatedBy(String username);
	
	@Query(value="select * from product p order by p.view desc limit 10",nativeQuery = true)
	List<ProductEntity> findProductPopulator(); 
	
}
