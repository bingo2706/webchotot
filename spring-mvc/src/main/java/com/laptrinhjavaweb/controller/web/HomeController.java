package com.laptrinhjavaweb.controller.web;

import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.SlideDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.repository.SlideRepository;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.ISlideService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.FormUtil;
import com.laptrinhjavaweb.util.UploadFileUtils;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private ISlideService slideService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired 
	private IRoleService roleService;
	
	@Autowired
	MailSender mailSender;
	
	@Autowired
	private SlideRepository slideRepository;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam("page") int page, 
            						@RequestParam("limit") int limit) {
		ModelAndView mav = new ModelAndView("web/home");
		ProductDTO models = new ProductDTO();
		CategoryDTO categoryModel = new CategoryDTO();
		SlideDTO slideModel = new SlideDTO();
		models.setLimit(limit);
		models.setPage(page);
		Sort sort = new Sort(Sort.Direction.ASC, "title");
		Pageable pageable = new PageRequest(page-1, limit, sort);
		models.setListResult(newService.findAll(pageable));
		models.setTotalItem(newService.getTotalItem());
		models.setTotalPage((int) Math.ceil((double) models.getTotalItem() / models.getLimit()));
		
		Pageable pageable1 = new PageRequest(0,20);
	
		// category
		categoryModel.setListResult(categoryService.findAllList(pageable1));
		slideModel.setListResult(slideService.findAll(pageable1));
		mav.addObject("model",models);
		mav.addObject("categories",categoryModel);
		mav.addObject("slides",slideModel);
		
//		sendEmail("dotanthanhvlog@gmail.com", "bongrovn123@gmail.com", "Hello", "Xin chao");
		
		
		return mav;
	}
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	@RequestMapping(value = "/dang-ki", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu?page=1&limit=10");
	}
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
	
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
	@RequestMapping(value = "/user/dang-tin", method = RequestMethod.GET)
	public ModelAndView createProduct(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/product/create");
		ProductDTO model = new ProductDTO();
		if( id != null){
			model = newService.findById(id);
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model",model);
		return mav;
	}
	@RequestMapping(value = "/user/productdetail/create", method = RequestMethod.GET)
	public ModelAndView createProductDetailPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/product/createDetail");

		return mav;
	}
	@RequestMapping(value = "/user/info", method = RequestMethod.GET)
	public ModelAndView infoUserPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/user/user");
		UserDTO userDto = userService.findById(id);
		mav.addObject("model",userDto);
		return mav;
	}
	@RequestMapping(value = "/user/edit", method = RequestMethod.GET)
	public ModelAndView editPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/user/create");
		UserDTO userDto = userService.findById(id);
		mav.addObject("roles", roleService.findAll());
		mav.addObject("model",userDto);
		return mav;
	}
	@RequestMapping(value = "/user/product", method = RequestMethod.GET)
	public ModelAndView productPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/user/list");
		ProductDTO dto = new ProductDTO();
		dto.setListResult(newService.findListProductByUserID(id));
		mav.addObject("model",dto);
		return mav;
	}
	@RequestMapping(value = "/product/userproduct", method = RequestMethod.GET)
	public ModelAndView userproductPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/product/userproduct");
		ProductDTO dto = new ProductDTO();
		dto.setListResult(newService.findListProductByUserID(id));
		mav.addObject("model",dto);
		return mav;
	}
	@RequestMapping(value = "/user/product/detail", method = RequestMethod.GET)
	public ModelAndView productDetailPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/user/productdetail");
		ProductDTO productDto = newService.findById(id);
		productDto.setListDetail(newService.findListProductDetailByProduct(id));
		mav.addObject("model",productDto);
		return mav;
	}
	@RequestMapping(value = "/user/product/addImg", method = RequestMethod.GET)
	public ModelAndView AddImgproductDetailPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/product/addImg");
		
		return mav;
	}
	@RequestMapping(value = "/user/productdetail/update", method = RequestMethod.GET)
	public ModelAndView UpdateproductDetailPage(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("web/product/updateDetail");
		ProductDetailDTO dto = newService.findDetailByID(id);
		mav.addObject("model",dto);
		return mav;
	}
	@RequestMapping(value = "/product-index", method = RequestMethod.GET)
	public ModelAndView ProductPage(@RequestParam(value = "categoryID",required = false)Long id,
						@RequestParam(value = "title",required = false)String title,
						@RequestParam(value = "address",required = false)String address,
						@RequestParam(value = "price-min",required = false)Float min,
						@RequestParam(value = "price-max",required = false)Float max
						
	) {
		ModelAndView mav = new ModelAndView("web/product/homeProduct");
		ProductDTO models = new ProductDTO();
		CategoryDTO categoryModel = new CategoryDTO();
		Pageable pageable1 = new PageRequest(0,20);
		categoryModel.setListResult(categoryService.findAllList(pageable1));
		models.setListResult(newService.findAllByFilter(id, title,address,min,max));
		mav.addObject("model",models);
		mav.addObject("categories",categoryModel);
		return mav;
	}
	public void sendEmail(String from, String to, String subject, String content){
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom(from);
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(content);
		mailSender.send(mailMessage);
	}
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public ModelAndView forgotPasswordPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("forgotPassword");	
		return mav;
	}
	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public ModelAndView changepassword(HttpServletRequest request) {

		return new ModelAndView("redirect:/trang-chu?page=1&limit=10");
	}
	
}
