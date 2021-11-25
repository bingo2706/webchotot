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
import com.laptrinhjavaweb.dto.SlideDTO;
import com.laptrinhjavaweb.service.ISlideService;
import com.laptrinhjavaweb.util.FormUtil;
import com.laptrinhjavaweb.util.UploadFileUtils;

@Controller(value = "SlideController")
public class SlideController {
	
	@Autowired
	private ISlideService slideService;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	
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
	@RequestMapping(value = "/admin-slide/edit", method = RequestMethod.GET)
	public ModelAndView EditSlide(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/slide/edit");
		SlideDTO model = new SlideDTO();
		if( id != null){
			model = slideService.findById(id);
		}
		
		mav.addObject("model",model);
		return mav;
	}
	@RequestMapping(value = "/admin-slide/create", method = RequestMethod.GET)
	public ModelAndView CreateSlide(@RequestParam(value = "id",required = false)Long id) {
		ModelAndView mav = new ModelAndView("admin/slide/create");
		
		return mav;
	}
	//============= SLIDE ================
		@RequestMapping(value = "/api/createSlide", method = RequestMethod.POST)
		public ModelAndView createSlide(HttpServletRequest request) throws InterruptedException {
			SlideDTO slideDTO = FormUtil.toModel(SlideDTO.class, request);
			 try {
		            byte[] decodeBase64 = Base64.getDecoder().decode(slideDTO.getBase64().getBytes());
		            uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/"+slideDTO.getThumbnail());
		          
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
			 Thread.sleep(4500);
			 slideDTO = slideService.save(slideDTO);
			
			 return new ModelAndView("redirect:/admin-slide?page=1&limit=5");
		}
		@SuppressWarnings("null")
		@RequestMapping(value = "/api/deleteSlide", method = RequestMethod.POST)
		public ModelAndView deleteSlide(HttpServletRequest request) {
			  String []a = request.getParameter("ids").split(",");
			  int size = a.length;
		      long [] arr = new long [size];
		      for(int i=0; i<size; i++) {
		         arr[i] = Long.parseLong(a[i]);
		      }		
			  slideService.delete(arr);
			 return new ModelAndView("redirect:/admin-slide?page=1&limit=5");
		}
}
