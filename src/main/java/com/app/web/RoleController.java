package com.app.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.PageBean;
import com.app.bean.TRole;
import com.app.service.RoleService;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/delete")
	@ResponseBody
	public JSONObject delete(String delIds){
		JSONObject json = new JSONObject();
		json.put("success", true);
		
		String[] arr = delIds.split(",");
		
		List<Integer> list = new ArrayList<Integer>();
		
		for (int i = 0; i < arr.length; i++) {
			list.add(Integer.parseInt(arr[i]) );
		}
		
		try{
			roleService.delete(list);
		}catch(Exception e){
			json.put("success", false);
		}
		
		
		return json;
		
	}
	
	
	@RequestMapping("/save")
	@ResponseBody
	public JSONObject save(TRole tRole){
		JSONObject json = new JSONObject();
		try{
			if(tRole.getRoleid() != null){
				roleService.update(tRole);
			}else{
				roleService.save(tRole);
			}
		}catch(Exception e){
			json.put("errorMsg", e.toString());
		}
		return json;
		
	}
	
	@RequestMapping("/auth")
	@ResponseBody
	public JSONObject auth(String authIds,String roleid){
		JSONObject json = new JSONObject();
		
		json.put("success", true);
		
		TRole role = new TRole();
		role.setAuthids(authIds);
		role.setRoleid(Integer.parseInt(roleid));
		
		try{
			
			roleService.updateAuth(role);
			
		}catch(Exception e){
			e.printStackTrace();
			json.put("success", false);
		}
		return json;
		
	}
	
	/**
	 * @return
	 */
	@RequestMapping("/getRolePage")
	public ModelAndView getRolePage(){
		return new ModelAndView("role");
	}
	
	/**
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public JSONObject list(String page,String rows,String s_roleName){
		
		TRole role = new TRole();
		
		role.setRolename(s_roleName);
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		
		List<TRole> list = roleService.list(pageBean,role);
		
		PageInfo pageInfo = new PageInfo(list);
		
		JSONObject json = new JSONObject();
		
		json.put("rows", list);
		json.put("total", pageInfo.getTotal());
		
		return json;
	}
	
	/**
	 * @return
	 */
	@RequestMapping("/comBoList")
	@ResponseBody
	public List comBoList(){
		
		PageBean pageBean = new PageBean(1, 100);
		
		List<TRole> list = roleService.list(pageBean,new TRole());
		
		return list;
		
	}

}
