package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.UserDTO;

public interface IUserService {
	List<UserDTO> findAll(Pageable pageable);
	UserDTO save(UserDTO dto);
	UserDTO findById(Long id);
	UserDTO findByEmail(String email);
	UserDTO findByUserToken(String usertoken);
	UserDTO findByUserNameAndStatus (String username);
	int getTotalItem();
	void delete(long[] ids);
}
