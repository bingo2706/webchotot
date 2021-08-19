package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.dto.ProductDTO;

public interface INewDAO {
	List<ProductDTO> findProductByFilter(String address,Float min,Float max); 
}
