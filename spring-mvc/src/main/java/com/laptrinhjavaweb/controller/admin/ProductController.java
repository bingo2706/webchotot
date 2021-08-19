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

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.ProductImageDTO;
import com.laptrinhjavaweb.dto.SlideDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.ISlideService;
import com.laptrinhjavaweb.service.IUserService;

@Controller(value = "newControllerOfAdmin")
public class ProductController {
    
	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ISlideService slideService;
	
	@RequestMapping(value = "/admin-new", method = RequestMethod.GET)
	public ModelAndView listPage(@RequestParam("page") int page, 
			                     @RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("admin/new/list");
		ProductDTO models = new ProductDTO();
		models.setLimit(limit);
		models.setPage(page);
		Sort sort = new Sort(Sort.Direction.ASC, "title");
		Pageable pageable = new PageRequest(page-1, limit, sort);
		models.setListResult(newService.findAll(pageable));
	
		models.setTotalItem(newService.getTotalItem());
		models.setTotalPage((int) Math.ceil((double) models.getTotalItem() / models.getLimit()));
		mav.addObject("model",models);
		return mav;
	}
	
	@RequestMapping(value = "/admin-new/detail", method = RequestMethod.GET)
	public ModelAndView detailProductAdminPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/new/detail");
		ProductDTO productDto = newService.findById(id);
		productDto.setListDetail(newService.findListProductDetailByProduct(id));
		mav.addObject("model",productDto);
		return mav;
	}
	@RequestMapping(value = "/admin-new/detail/create", method = RequestMethod.GET)
	public ModelAndView createdetailProductAdminPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/new/createDetail");
		return mav;
	}
	@RequestMapping(value = "/admin-new/detail/update", method = RequestMethod.GET)
	public ModelAndView updatedetailProductAdminPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/new/updateDetail");
		ProductDetailDTO dto = newService.findDetailByID(id);
		mav.addObject("model",dto);
		
		return mav;
	}
	
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
	
	@RequestMapping(value = "/admin-new/create", method = RequestMethod.GET)
	public ModelAndView CreatePage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/new/create");
		ProductDTO model = new ProductDTO();
		if( id != null){
			model = newService.findById(id);
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model",model);
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
	@RequestMapping(value = "/admin-new/addImg", method = RequestMethod.GET)
	public ModelAndView addImgPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/new/addimg");	
		return mav;
	}
	@RequestMapping(value = "/product/detail", method = RequestMethod.GET)
	public ModelAndView detailProductPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/product/detail");
		ProductDTO model = new ProductDTO();
		CommentDTO cmtModel = new CommentDTO();
		UserDTO userModel = new UserDTO();
		cmtModel.setListResult(commentService.findAllByProductId(id));
		model = newService.findById(id);
		model.setListDetail(newService.findListProductDetailByProduct(id));
		userModel = userService.findByUserNameAndStatus(model.getCreatedBy());
	//	model.setListImg(newService.findListImgageByProduct(id));
		mav.addObject("model",model);
		mav.addObject("cmt",cmtModel);
		mav.addObject("userModel",userModel);
		return mav;
	}
	@RequestMapping(value = "/admin-slide", method = RequestMethod.GET)
	public ModelAndView slidePage(@RequestParam("page") int page, 
			                     @RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("admin/slide/list");
		SlideDTO models = new SlideDTO();
		models.setLimit(limit);
		models.setPage(page);
		Sort sort = new Sort(Sort.Direction.ASC, "name");
		Pageable pageable = new PageRequest(page-1, limit, sort);
		models.setListResult(slideService.findAll(pageable));
	
		models.setTotalItem(slideService.getTotalItem());
		models.setTotalPage((int) Math.ceil((double) models.getTotalItem() / models.getLimit()));
		mav.addObject("model",models);
		return mav;
	}
	@RequestMapping(value = "/admin-slide/create", method = RequestMethod.GET)
	public ModelAndView CreateSlide(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/slide/create");
		
		return mav;
	}

	
}
