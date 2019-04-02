package com.app.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/gologin")
	public ModelAndView gologin(HttpServletRequest request, String userName,String password){
		ModelAndView modelAndView = new ModelAndView("login");
		String answer = loginService.checkLogin(userName,password,request);
		
		if(!"0".equals(answer)){
			modelAndView.addObject("error", "登录失败，用户名或者密码错误！");
			return modelAndView;
		}
		
		modelAndView.setViewName("success"); 
		
		return modelAndView;
	}

	@RequestMapping("/getLoginPage")
	public ModelAndView getLoginPage(){
		return new ModelAndView("login");
	}
}
