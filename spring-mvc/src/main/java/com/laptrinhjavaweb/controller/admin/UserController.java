package com.laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.IUserService;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired IRoleService roleService;
	
	@RequestMapping(value = "/admin-user", method = RequestMethod.GET)
	public ModelAndView listPage(@RequestParam("page") int page, 
            					@RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("admin/user/list");
		UserDTO models = new UserDTO();
		models.setLimit(limit);
		models.setPage(page);
		Sort sort = new Sort(Sort.Direction.ASC, "userName");
		Pageable pageable = new PageRequest(page-1, limit, sort);
		models.setListResult(userService.findAll(pageable));
	
		models.setTotalItem(userService.getTotalItem());
		models.setTotalPage((int) Math.ceil((double) models.getTotalItem() / models.getLimit()));
		mav.addObject("model",models);
		return mav;

	}
	@RequestMapping(value = "/admin-user/create", method = RequestMethod.GET)
	public ModelAndView CreatePage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/user/create");
		UserDTO model = new UserDTO();
		if( id != null){
			model = userService.findById(id);
		}
		mav.addObject("roles", roleService.findAll());
		mav.addObject("model",model);
		return mav;
	}
	
}
