package com.laptrinhjavaweb.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

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

import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.UploadFileUtils;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired IRoleService roleService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
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
	@RequestMapping(value = "/api/createUser", method = RequestMethod.POST)
	public ModelAndView createUser(HttpServletRequest request) throws InterruptedException {
		UserDTO user = new UserDTO();
		user.setFullname(request.getParameter("fullname"));
		user.setEmail(request.getParameter("email"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setPhonenumber(request.getParameter("phonenumber"));
		user.setThumbnail(request.getParameter("thumbnail"));
		user.setBase64(request.getParameter("base64"));
		user.setRoleCode(request.getParameter("roleCode"));
		
		String date = request.getParameter("dob");
		if(request.getParameter("id") == null){
			 Date dob = null;
				try {
					dob = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"));
					 user.setDob(dob);
					 user.setStatus(Integer.parseInt(request.getParameter("status")));
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}  
				
		}else{
			user.setId(Long.parseLong(request.getParameter("id")));
		}
		
		 try {
	            byte[] decodeBase64 = Base64.getDecoder().decode(user.getBase64().getBytes());
	            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+user.getThumbnail());
	           
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 Thread.sleep(4500);
		 user = userService.save(user);
		 if(request.getParameter("type").equals("edit")){
			 String url = "redirect:/user/info?id=" + request.getParameter("id");
			 return new ModelAndView(url);
		 }
		 if(request.getParameter("type").equals("create")){
			 return new ModelAndView("redirect:/dang-nhap");
		 }

		 return new ModelAndView("redirect:/admin-user?page=1&limit=5");
	}
	@SuppressWarnings("null")
	@RequestMapping(value = "/api/deleteUser", method = RequestMethod.POST)
	public ModelAndView deleteSlide(HttpServletRequest request) {
		  String []a = request.getParameter("ids").split(",");
		  int size = a.length;
	      long [] arr = new long [size];
	      for(int i=0; i<size; i++) {
	         arr[i] = Long.parseLong(a[i]);
	      }		
		  userService.delete(arr);
		 return new ModelAndView("redirect:/admin-user?page=1&limit=5");
	}
	@RequestMapping(value = "/admin-user/activeUser", method = RequestMethod.GET)
	public ModelAndView activeUser(HttpServletRequest request) {
		  long id =  Long.parseLong(request.getParameter("id")); 
		  userService.activeUser(id);
		 return new ModelAndView("redirect:/admin-user?page=1&limit=5");
	}
}
