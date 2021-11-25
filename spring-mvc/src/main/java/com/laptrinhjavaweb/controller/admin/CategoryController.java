package com.laptrinhjavaweb.controller.admin;

import java.util.Base64;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.FormUtil;
import com.laptrinhjavaweb.util.UploadFileUtils;

@Controller(value = "CategoryController")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@RequestMapping(value = "/admin-category", method = RequestMethod.GET)
	public ModelAndView categoryPage(@RequestParam("page") int page, 
			                     @RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("admin/category/list");
		CategoryDTO models = new CategoryDTO();
		models.setLimit(limit);
		models.setPage(page);
		Sort sort = new Sort(Sort.Direction.ASC, "name");
		Pageable pageable = new PageRequest(page-1, limit, sort);
		models.setListResult(categoryService.findAllList(pageable));
		models.setTotalItem(categoryService.getTotalItem());
		models.setTotalPage((int) Math.ceil((double) models.getTotalItem() / models.getLimit()));
		mav.addObject("model",models);
		return mav;
	}
	@RequestMapping(value = "/admin-category/create", method = RequestMethod.GET)
	public ModelAndView CreateCategoryPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/category/create");
		CategoryDTO model = new CategoryDTO();
		if( id != null){
			model = categoryService.findById(id);
		}
		
		mav.addObject("model",model);
		return mav;
	}
	@RequestMapping(value = "/api/createCategory", method = RequestMethod.POST)
	public ModelAndView createCategory(HttpServletRequest request) throws InterruptedException {
		CategoryDTO category = FormUtil.toModel(CategoryDTO.class, request);
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(category.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+category.getThumbnail());
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 Thread.sleep(4500);
		 category = categoryService.save(category);
		 return new ModelAndView("redirect:/admin-category?page=1&limit=5");
	}
	@SuppressWarnings("null")
	@RequestMapping(value = "/api/deleteCategory", method = RequestMethod.POST)
	public ModelAndView deleteCategory(HttpServletRequest request) {
		  String []a = request.getParameter("ids").split(",");
		  int size = a.length;
	      long [] arr = new long [size];
	      for(int i=0; i<size; i++) {
	         arr[i] = Long.parseLong(a[i]);
	      }		
	      categoryService.delete(arr);
		 return new ModelAndView("redirect:/admin-category?page=1&limit=5");
	}
}
