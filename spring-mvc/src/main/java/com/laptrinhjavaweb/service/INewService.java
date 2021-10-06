package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.ProductImageDTO;

public interface INewService {
	List<ProductDTO> findAll(Pageable pageable);
	int getTotalItem();
	ProductDTO findById(long id);
	ProductDTO save(ProductDTO dto);
	ProductImageDTO saveImg(ProductImageDTO dto);
	ProductDetailDTO saveDetail(ProductDetailDTO dto);
	ProductDetailDTO findDetailByID(Long id);
	List<ProductImageDTO> findListImgageByProduct(Long id);
	List<ProductDetailDTO> findListProductDetailByProduct(Long id);
	List<ProductDTO> findAllByFilter(Long categoryid, String title,String address,Float min,Float max);
	List<ProductDTO> findListProductByUserID(Long id);
	List<ProductDTO> findProductPopulator();
	void delete(long[] ids);
	void deleteDetail(long[] ids);
	void deleteImg(long [] ids);
}
