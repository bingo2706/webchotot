package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;

@Service
public class UserService implements IUserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired UserConverter userConverter;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public List<UserDTO> findAll(Pageable pageable) {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> entities = userRepository.findAll(pageable).getContent();
		for(UserEntity item: entities){
			UserDTO newDTO = userConverter.toDto(item);
			models.add(newDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		return (int) userRepository.count();
	}

	@Override
	public UserDTO save(UserDTO dto) {
		
		RoleEntity roleEntity = roleRepository.findOneByCode(dto.getRoleCode());
		List<RoleEntity> listRole = new ArrayList<>();
		listRole.add(roleEntity);
		
		UserEntity entity = new UserEntity();
		if(dto.getId() != null){
			
			UserEntity oldUser = userRepository.findOne(dto.getId());
			if(dto.getType()!=null){
				if(dto.getType().equals("password")){
					oldUser.setPassword(BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt(10)));
				}
				if(dto.getType().equals("activeEmail"))
				{
					oldUser.setIsActiveEmail(dto.getIsActiveEmail());
				}
				
			}
			oldUser.setRoles(listRole);
			entity = userConverter.toEnity(oldUser, dto);
		}else{
			dto.setPassword(BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt(10)));
			dto.setIsActiveEmail("0");
			entity = userConverter.toEnity(dto);
			entity.setRoles(listRole);
		}
		return userConverter.toDto(userRepository.save(entity));
	}

	@Override
	public UserDTO findById(Long id) {
		UserEntity entity = userRepository.findOne(id);
		return userConverter.toDto(entity);
	}

	@Override
	public UserDTO findByUserNameAndStatus(String username) {
		UserEntity entity = userRepository.findOneByUserNameAndStatus(username, 1);
		return userConverter.toDto(entity);
	}

	@Override
	public void delete(long[] ids) {
		
		
	}

	@Override
	public UserDTO findByEmail(String email) {
		UserEntity entity = userRepository.findOneByEmail(email);
		if(entity ==null){
			UserDTO dto = null;
			return dto;
		}
		return userConverter.toDto(entity);
	}

	@Override
	public UserDTO findByUserToken(String usertoken) {
		UserEntity entity = userRepository.findOneByUsertoken(usertoken);
		if(entity ==null){
			UserDTO dto = null;
			return dto;
		}
		return userConverter.toDto(entity);
	}

}
