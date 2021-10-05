package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class UserConverter {
	public UserDTO toDto(UserEntity entity){
		UserDTO result = new UserDTO();
		result.setId(entity.getId());
		result.setFullname(entity.getFullName());
		result.setUsername(entity.getUserName());
		result.setPassword(entity.getPassword());
		result.setEmail(entity.getEmail());
		result.setPhonenumber(entity.getPhonenumber());
		result.setStatus(entity.getStatus());
		result.setDob(entity.getDob());
		result.setThumbnail(entity.getThumbnail());
		result.setUsertoken(entity.getUsertoken());
		result.setIsActiveEmail(entity.getIsActiveEmail());
		for( int i=0 ; i<entity.getRoles().size();i++){
			result.setRoleCode(entity.getRoles().get(i).getCode());
		}
		return result;
	}
	public UserEntity toEnity(UserDTO dto){
		UserEntity result = new UserEntity();
		result.setThumbnail(dto.getThumbnail());
		result.setUserName(dto.getUsername());
		result.setFullName(dto.getFullname());
		result.setPassword(dto.getPassword());
		result.setEmail(dto.getEmail());
		result.setPhonenumber(dto.getPhonenumber());
		result.setStatus(dto.getStatus());
		result.setDob(dto.getDob());
		result.setIsActiveEmail(dto.getIsActiveEmail());
		
		return result;
	}
	public UserEntity toEnity(UserEntity result,UserDTO dto){
		result.setThumbnail(dto.getThumbnail());
		result.setUserName(dto.getUsername());
		result.setFullName(dto.getFullname());	
		result.setEmail(dto.getEmail());
		result.setPhonenumber(dto.getPhonenumber());
		
		result.setUsertoken(dto.getUsertoken());
		if(dto.getStatus() !=null) result.setStatus(dto.getStatus());
	    
		
		return result;
	}
}
