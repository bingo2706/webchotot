package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CommentDTO;

public interface ICommentService {
	CommentDTO save(CommentDTO dto);
	List<CommentDTO> findAllByProductId(Long product_id);
	void delete(Long id);
}
