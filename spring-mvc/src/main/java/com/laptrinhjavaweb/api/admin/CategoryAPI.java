package com.laptrinhjavaweb.api.admin;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.UploadFileUtils;   
@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@PostMapping("/api/category") 
	public CategoryDTO createNew(@RequestBody CategoryDTO categoryDTO){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(categoryDTO.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+categoryDTO.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return categoryService.save(categoryDTO);
	}
	@PutMapping("/api/category") 
	public CategoryDTO updateNew(@RequestBody CategoryDTO updateNew){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(updateNew.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+updateNew.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return categoryService.save(updateNew);
	}
	@DeleteMapping("/api/category")
	public void deleteNew(@RequestBody long[] ids){
		categoryService.delete(ids);
	}
		
	
	
}
