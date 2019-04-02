package com.app.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.ResultData;
import com.app.bean.TUser;
import com.app.service.SupplierService;
import com.app.util.StringUtil;
import com.app.util.WebUtil;

@Controller
@RequestMapping("/admin/supplier")
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	@RequestMapping("/getPage")
	public ModelAndView getPage(){
		return new ModelAndView("supplier");
	}
	
	
	/**
	 * 保存供应商信息
	 * @param request
	 * @param response
	 * 
	 * 字段：
	 *　id:
	 *　update_time:
	 *　supplier_name:供应商名称
	 *　create_time:
	 *　userid:
	 *　is_delete:
	 */
	@RequestMapping("/save")
	public void save(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
	
		//若id不存在就新增
		if(StringUtil.isEmpty(params.get("id"))){
			try{
				//添加基础信息
				params.put("userid", currentUser.getUserid());
				params.put("userName", currentUser.getUsername());
				params.put("create_time",StringUtil.getCurrentDateForMysql24() );
				params.put("update_time",StringUtil.getCurrentDateForMysql24() );
				params.put("is_delete",0);
				supplierService.insert(params);
			}catch(Exception e){
				e.printStackTrace();
				data.setErrCode(-1);
				data.setErrMsg("保存失败，请联系管理员！");
				WebUtil.writeObject(response, data);
				return;
			}
			
		}else{
			//修改
			params.put("update_time",StringUtil.getCurrentDateForMysql24() ); //最后更新时间改成当前的时间戳
			data = supplierService.update(params);
		}
		
		//输出结果到页面
		WebUtil.writeObject(response, data);
		
	}
	
	
	/**
	 * 删除供应商信息
	 * @param request
	 * @param response 
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		params.put("is_delete", 1); //删除标记
		
		try{
			
			data = supplierService.update(params);
			
		}catch(Exception e){
			e.printStackTrace();
			data.setErrCode(-1);
			data.setErrMsg("保存失败，请联系管理员！");
			WebUtil.writeObject(response, data);
			return;
		}
		
		//输出结果到页面
		WebUtil.writeObject(response, data);
				
	}
	
	
	/**
	 * 模糊查询供应商信息列表
	 * @param request
	 * @param response
	 * @param page
	 * @param rows
	 */
	@RequestMapping("/list")
	public void list(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		params.put("is_delete", 0);
		data = supplierService.list(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	
	
}
