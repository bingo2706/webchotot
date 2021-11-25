package com.laptrinhjavaweb.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.util.FormUtil;

@Controller(value = "CommentController")
public class CommentController {
	@Autowired
	private ICommentService commentService;
	
	
	//====================== COMMENT =========================
		@RequestMapping(value = "/api/createCMT", method = RequestMethod.POST)
		public ModelAndView createCMT(HttpServletRequest request) {
			CommentDTO cmt = FormUtil.toModel(CommentDTO.class, request);
			
			cmt = commentService.save(cmt);
			String url = "redirect:/product/detail/?id=" + request.getParameter("productId");
			 return new ModelAndView(url);
		}
		@RequestMapping(value = "/api/deleteCMT", method = RequestMethod.POST)
		public ModelAndView deleteCMT(HttpServletRequest request) {
			Long id = Long.parseLong(request.getParameter("id"));
			String url = "redirect:/product/detail/?id=" + request.getParameter("productId");
			commentService.delete(id);
			 return new ModelAndView(url);
		}
}
