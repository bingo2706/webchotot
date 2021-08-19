package com.laptrinhjavaweb.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.UploadFileUtils;   
@RestController(value = "userAPIOfAdmin")
public class UserAPI {
	@Autowired
	private UserRepository usergoryRepository;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@PostMapping("/api/user") 
	public UserDTO createUser(@RequestBody UserDTO userDTO){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(userDTO.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+userDTO.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return userService.save(userDTO);
	}
	@PutMapping("/api/user")
	public UserDTO editUser(@RequestBody UserDTO userDTO){
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(userDTO.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+userDTO.getThumbnail());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return userService.save(userDTO);
	}	
}
