package com.app.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminPageController {
	
	@RequestMapping("/getPage")
	public ModelAndView getPage(String page){
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping("/main")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/bmly")
	public ModelAndView bmly(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bmly");
		return mav;
	}
	
}
