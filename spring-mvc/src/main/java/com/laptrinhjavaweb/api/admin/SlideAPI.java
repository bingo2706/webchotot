package com.laptrinhjavaweb.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.SlideDTO;
import com.laptrinhjavaweb.repository.SlideRepository;
import com.laptrinhjavaweb.service.ISlideService;
import com.laptrinhjavaweb.util.UploadFileUtils;   
@RestController(value = "slideAPIOfAdmin")
public class SlideAPI {
	@Autowired
	private SlideRepository slideRepository;
	
	@Autowired
	private ISlideService slideService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@PostMapping("/api/slide") 
	public SlideDTO createSlide(@RequestBody SlideDTO slideDTO){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(slideDTO.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+slideDTO.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return slideService.save(slideDTO);
	}
	@PutMapping("/api/slide") 
	public SlideDTO updateSlide(@RequestBody SlideDTO updateSlide){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(updateSlide.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+updateSlide.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return slideService.save(updateSlide);
	}
	@DeleteMapping("/api/slide")
	public void deleteNew(@RequestBody long[] ids){
		slideService.delete(ids);
	}
}
