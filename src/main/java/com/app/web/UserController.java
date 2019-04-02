package com.app.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.PageBean;
import com.app.bean.TUser;
import com.app.service.UserService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/getPage")
	public ModelAndView getPage(){
		return new ModelAndView("user");
	}
	
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.getSession().invalidate();
		response.sendRedirect("/login/getLoginPage.do");
	}
	
	@RequestMapping("/modifyPassword")
	@ResponseBody
	public JSONObject modifyPassword(String newPassword,Integer userid){
		JSONObject result = new JSONObject();
		
		try{
			userService.updatePassword(userid,newPassword);
		}catch(Exception e){
			result.put("errMsg", e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public JSONObject delete(String delIds){
		JSONObject result = new JSONObject();
		
		try{
			userService.delete(delIds);
		}catch(Exception e){
			result.put("errMsg", e.getMessage());
		}
		
		return result;
	}
	
	
	@RequestMapping("/save")
	@ResponseBody
	public JSONObject save(TUser user){
		JSONObject result = new JSONObject();
		
		try{
			userService.update(user);
		}catch(Exception e){
			result.put("errMsg", e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public List list(Integer page,Integer rows,String s_userRealName,Integer s_roleId,HttpServletRequest request){
		
		PageBean pageBean = new PageBean(page, rows);
		
		TUser user = new TUser();
		user.setRealname(s_userRealName); 
		user.setRoleid(s_roleId);
		
		return userService.list(pageBean,user);
		
	}
	
}
