package com.app.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.TUser;
import com.app.service.UserService;

@Controller
@RequestMapping("/reg")
public class RegController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * ע���û�
	 * @param request
	 * @return
	 */
	@RequestMapping("/goReg")
	@ResponseBody
	public String gologin(HttpServletRequest request, TUser user){
		String answer = userService.addUser(user);
		
		return answer;
	}

	/**
	 * ��ȡע��ҳ��
	 * @return
	 */
	@RequestMapping("/getRegPage")
	public ModelAndView getLoginPage(){
		return new ModelAndView("reg");
	}
}
