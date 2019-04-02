package com.app.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.TAuth;
import com.app.bean.TUser;
import com.app.service.AuthService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private AuthService authService;
	
	@RequestMapping("/listIcons")
	@ResponseBody
	public JSONArray listIcons(HttpServletRequest request){
		JSONArray arr = new JSONArray();
		
		JSONObject json = new JSONObject();
		json.put("icon","<div class=\"icon-home\">&nbsp;</div>");
		json.put("id", "icon-home");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-add\">&nbsp;</div>");
		json.put("id", "icon-add");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-edit\">&nbsp;</div>");
		json.put("id", "icon-edit");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-cancel\">&nbsp;</div>");
		json.put("id", "icon-cancel");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-save\">&nbsp;</div>");
		json.put("id", "icon-save");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-ok\">&nbsp;</div>");
		json.put("id", "icon-ok");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-no\">&nbsp;</div>");
		json.put("id", "icon-no");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-reload\">&nbsp;</div>");
		json.put("id", "icon-reload");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-search\">&nbsp;</div>");
		json.put("id", "icon-search");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-print\">&nbsp;</div>");
		json.put("id", "icon-print");
		arr.add(json);
		
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-undo\">&nbsp;</div>");
		json.put("id", "icon-undo");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-redo\">&nbsp;</div>");
		json.put("id", "icon-redo");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-back\">&nbsp;</div>");
		json.put("id", "icon-back");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-permission\">&nbsp;</div>");
		json.put("id", "icon-permission");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-student\">&nbsp;</div>");
		json.put("id", "icon-student");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-course\">&nbsp;</div>");
		json.put("id", "icon-course");
		arr.add(json);
		
		json = new JSONObject();
		json.put("icon", "<div class=\"icon-email\">&nbsp;</div>");
		json.put("id", "icon-email");
		arr.add(json);
		
		return arr;
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public JSONObject deleteAuth(String authId,String parentId){
		JSONObject result=new JSONObject();
		result.put("success", true);
		int sonNum = -1;
		
		try{
			if(!authService.isLeaf(Integer.parseInt(authId))){
				result.put("success", false);
				result.put("errorMsg", "删除失败！");
			}else{
				sonNum = authService.getAuthCountByParentId(parentId);
				if(sonNum==1){
					authService.updateStateByAuthId("open", Integer.parseInt(parentId));
					authService.authDelete(authId);
			
				}else{
					authService.authDelete(authId);
				}
				
			}
		}catch(Exception e){
			result.put("success", false);
			result.put("errorMsg", e.getMessage());
		}
		return result;
		
	}
	
	
	
	
	@RequestMapping("/saveAuth")
	@ResponseBody
	public JSONObject saveAuth(TAuth tAuth,Integer parentid,String authid){
		
		JSONObject json = new JSONObject();
		
		
		boolean isLeaf = false; //�Ƿ���Ҷ�ӽڵ�
		
		try{
		if(tAuth.getAuthid() != null){
			//�޸Ľڵ�
			isLeaf = authService.isLeaf(tAuth.getAuthid());
			if(isLeaf){
				tAuth.setState("open");
			}else{
				tAuth.setState("closed");
			}
			
			tAuth.setParentid(parentid);
			authService.update(tAuth);
			
			
		}else{
			//�����ڵ�
			isLeaf = authService.isLeaf(tAuth.getParentid());
			
			if(isLeaf){
				authService.updateStateByAuthId("closed", tAuth.getParentid());
				tAuth.setState("open");
				authService.addAuth(tAuth);
			}else{
				tAuth.setState("open");
				authService.addAuth(tAuth);
			}
		}
		
		}catch(Exception e){
			json.put("errorMsg", e.getMessage());
			
		}
		

		
		return json;
	}
	
	@RequestMapping("/authTreeGridMenu")
	@ResponseBody
	public JSONArray authTreeGridMenu(String parentId){
		return authService.getListByParentId(parentId);
	}
	
	@RequestMapping("/getMenuPage")
	public ModelAndView getMenuPage(){
		return new ModelAndView("menu");
	}
	
	@RequestMapping("/getAuthMenu")
	@ResponseBody
	public JSONArray getAuthMenu(String parentId,String roleId,HttpServletRequest request){
		JSONArray arr = null;
		
		String authIds = authService.getAuthIdsById(Integer.parseInt(roleId));
		arr = authService.getCheckedAuthsByParentId(parentId,authIds);
		
		return arr;
		
	}

	@RequestMapping("/getlist")
	@ResponseBody
	public List getlist(String parentId,HttpServletRequest request){
		
		HttpSession session=request.getSession();
		TUser currentUser = (TUser)session.getAttribute("user");
		Integer roleid = currentUser.getRoleid();
		
		String authIds = authService.getAuthIdsById(roleid);//获得对应角色下的所有权限id
		
		JSONArray jsonArray = authService.getAuthsByParentId(parentId,authIds);
//		System.out.println("权限树："+jsonArray);
		return jsonArray;
	}
	
}
