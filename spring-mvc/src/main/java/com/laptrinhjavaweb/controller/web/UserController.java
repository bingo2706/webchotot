package com.laptrinhjavaweb.controller.web;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.OrderRoomDTO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IOrderRoomService;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.FormUtil;

@Controller(value = "UserController")
public class UserController {
	
	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired 
	private IRoleService roleService;
	
	@Autowired
	private IOrderRoomService orderService;
	
	@Autowired
	MailSender mailSender;
	
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
	@RequestMapping(value = "/user/changepassword", method = RequestMethod.GET)
	public ModelAndView changepasswordview(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("changePassword");	
		return mav;
	}
	@RequestMapping(value = "/api/changepassword", method = RequestMethod.POST)
	public ModelAndView changepassword(HttpServletRequest request) {
		
		String oldPassword = request.getParameter("oldpassword");
	
		String newpassword = request.getParameter("password");
		Long userid =  Long.parseLong(request.getParameter("id"));
		String type = request.getParameter("type");
		UserDTO user = userService.findById(userid);
		if(!BCrypt.checkpw(oldPassword, user.getPassword())){
			ModelAndView mav1 = new ModelAndView("redirect:/user/changepassword");
			mav1.addObject("message","Mật khẩu cũ không đúng");
			 return mav1;
		}
		user.setPassword(newpassword);
		user.setType(type);
		userService.save(user);
		String url = "redirect:/user/info?id=" + request.getParameter("id");
		ModelAndView mav = new ModelAndView(url);
		mav.addObject("message","Đổi mật khẩu thành công");
		return mav;
	}
	@RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
	public ModelAndView resetpasswordview(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("resetpassword");	
		return mav;
	}
	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public ModelAndView resetpassword(HttpServletRequest request) {
		String password = request.getParameter("password");	
		String usertoken = request.getParameter("usertoken");
		String type = request.getParameter("type");
		UserDTO user = userService.findByUserToken(usertoken);
		if(user ==null){
			ModelAndView mav1 = new ModelAndView("redirect:/forgotpassword");
			mav1.addObject("message","Token không đúng");
			 return mav1;
		}
		user.setPassword(password);
		user.setUsertoken("");
		user.setType(type);
		userService.save(user);
		ModelAndView mav = new ModelAndView("redirect:/dang-nhap");
		mav.addObject("message","Lấy lại mật khẩu thành công");
		return mav;
	}
	@RequestMapping(value = "/user/active-email", method = RequestMethod.GET)
	public ModelAndView activeEmailview(HttpServletRequest request) {
		String email = request.getParameter("email");
		UserDTO user = userService.findByEmail(email);
		String usertoken = randomString();
		user.setUsertoken(usertoken);
		userService.save(user);
		String url = "http://localhost:8080/active-email?id="+usertoken;
		String content = "Xin hãy nhấn vào link này \n "+url;
		sendEmail("dotanthanhvlog@gmail.com", email, "PTITSTAY Kích hoạt email", content);
		String urlChuyenhuong = "redirect:/user/info?id=" + user.getId();
		ModelAndView mav = new ModelAndView(urlChuyenhuong);
		mav.addObject("message","Xin vui lòng kiểm tra email!");
		return mav;
	}
	@RequestMapping(value = "/active-email", method = RequestMethod.GET)
	public ModelAndView activeEmail(HttpServletRequest request) {
		String usertoken = request.getParameter("id");
		ModelAndView mav = new ModelAndView("redirect:/dang-nhap");
		
		UserDTO user = userService.findByUserToken(usertoken);
		if(user ==null){
			
			mav.addObject("message","Token không đúng");
			 return mav;
		}
		user.setUsertoken("");
		user.setIsActiveEmail("1");
		user.setType("activeEmail");
		userService.save(user);
		String url = "redirect:/user/info?id=" + user.getId();
		ModelAndView mav1 = new ModelAndView(url);
		mav1.addObject("message","Kích hoạt email thành công");
		
		return mav1;
	}
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public ModelAndView orderRoom(HttpServletRequest request) {
		OrderRoomDTO orderDto = FormUtil.toModel(OrderRoomDTO.class, request);
		String url = "redirect:/product/detail?id=" + orderDto.getProductId();
		orderDto = orderService.save(orderDto);
		
		ModelAndView mav = new ModelAndView(url);
		mav.addObject("message","Đặt phòng thành công");
		return mav;
	}
	@RequestMapping(value = "/user/list-order", method = RequestMethod.GET)
	public ModelAndView listOrder(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/user/listorder");
		Long id = Long.parseLong(request.getParameter("id")) ;
		
		List<OrderRoomDTO> models = orderService.findListOrderByUserId(id);
		mav.addObject("model",models);
		return mav;
	}
	@RequestMapping(value = "/user/active-order", method = RequestMethod.GET)
	public ModelAndView activeOrder(HttpServletRequest request) {
		Long id = Long.parseLong(request.getParameter("id"));
		Long iduser = Long.parseLong(request.getParameter("userId"));
		orderService.activeOrder(id);
		String url = "redirect:/user/list-order?id=" + iduser;
		ModelAndView mav = new ModelAndView(url);
		mav.addObject("message","Chuyển trạng thái đơn hàng thành công");
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
	public String randomString(){
		String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    StringBuilder sb = new StringBuilder();
	    Random random = new Random();
	    int length = 15;
	    for(int i = 0; i < length; i++) {	     
	      int index = random.nextInt(alphabet.length());
	      char randomChar = alphabet.charAt(index);
	      sb.append(randomChar);
	    }
	    String randomString = sb.toString();
	    return randomString;
	}
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
	public ModelAndView forgotPassword(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		UserDTO user = userService.findByEmail(email);
		ModelAndView mav1 = new ModelAndView("redirect:/forgotpassword");
		ModelAndView mav = new ModelAndView("redirect:/dang-nhap");
		if(user == null){
			
			mav1.addObject("message","Email không tồn tại");
			return mav1;
		}
		if(user.getIsActiveEmail().equals("0")){
			
			mav1.addObject("message","Email chưa được kích hoạt");
			return mav1;
		}
		String usertoken = randomString();
		user.setUsertoken(usertoken);
		userService.save(user);
		String url = "http://localhost:8080/resetpassword?id="+usertoken;
		String content = "Xin hãy nhấn vào link này \n "+url;
		sendEmail("dotanthanhvlog@gmail.com", email, "PTITSTAY Quên mật khẩu", content);
		
		mav.addObject("message","Xin vui lòng kiểm tra email");
		return mav;
	}
}
