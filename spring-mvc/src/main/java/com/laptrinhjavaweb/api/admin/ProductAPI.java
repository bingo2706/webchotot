package com.laptrinhjavaweb.api.admin;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.ProductImageDTO;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.UploadFileUtils;   
@RestController(value = "newAPIOfAdmin")
public class ProductAPI {
	@Autowired
	private ProductRepository newRepository;
	
	@Autowired
	private INewService newService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@Autowired
	private ICommentService commentService;
	
	@PostMapping("/api/new") 
	public ProductDTO createNew(@RequestBody ProductDTO newDTO){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(newDTO.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+newDTO.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return newService.save(newDTO);
	}
	@PutMapping("/api/new") 
	public ProductDTO updateNew(@RequestBody ProductDTO updateNew){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(updateNew.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+updateNew.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return newService.save(updateNew);
	}
	@PostMapping("/api/img") 
	public ProductImageDTO addImg(@RequestBody ProductImageDTO dto){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+dto.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return newService.saveImg(dto);
	}
	@DeleteMapping("/api/img")
	public void deleteIMG(@RequestBody long[] ids){
		newService.deleteImg(ids);
	}
	@DeleteMapping("/api/new")
	public void deleteNew(@RequestBody long[] ids){
		newService.delete(ids);
	}
	@PostMapping("/api/comment") 
	@ResponseBody
	public CommentDTO createCmt(@RequestBody CommentDTO dto){
		
		return commentService.save(dto);
	}
	@DeleteMapping("/api/comment") 
	public void deleteComment(@RequestBody Long id){
	      commentService.delete(id);
	}
	@PostMapping("/api/detail") 
	public ProductDetailDTO addDetail(@RequestBody ProductDetailDTO dto){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+dto.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return newService.saveDetail(dto);
	}
	@DeleteMapping("/api/detail")
	public void deleteDetail(@RequestBody long[] ids){
		newService.deleteDetail(ids);
	}
	@PutMapping("/api/detail") 
	public ProductDetailDTO updateDetail(@RequestBody ProductDetailDTO updateDetail){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(updateDetail.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+updateDetail.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return newService.saveDetail(updateDetail);
	}
}
