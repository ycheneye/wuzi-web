package com.app.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.ResultData;
import com.app.bean.TUser;
import com.app.service.GoodsService;
import com.app.service.Procurement_registrationService;
import com.app.util.StringUtil;
import com.app.util.WebUtil;

@Controller
@RequestMapping("/admin/procurement_registration")
public class Procurement_registrationController {
	
	@Autowired
	private Procurement_registrationService procurement_registrationService;
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/getPage")
	public ModelAndView getPage(){
		return new ModelAndView("caigou");
	}
	
	
	/**
	 * 保存采购信息
	 * @param request
	 * @param response
	 * 
	 * 字段：
	 *　id:
	 *　goodsid:物资编号
	 *　update_time:
	 *　state:状态：0：已登记，1：采购完成，2：采购失败
	 *　userid:登记人
	 *　create_time:创建时间
	 *　is_delete:是否删除？
	 *　goodsName:物资名称
	 *　note:备注（如果采购失败，请务必加上备注）
	 */
	@RequestMapping("/save")
	public void save(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
		
		String goodsid = params.get("goodsid").toString();
		
		//根据物资编号获取物资名称
		
		try{
			Map map = new HashMap();
			map.put("id", goodsid);
			ResultData list = goodsService.list(map, 1, 10);
			String goodsName= (String) list.getRows().get(0).get("goodsName");
			
			params.put("goodsName", goodsName);
		}catch(Exception e){
			
			WebUtil.writeObject(response, "<h2 style='color:red'>物资不存在！</h2>");
			return;
		}
		
		//若id不存在就新增
		if(StringUtil.isEmpty(params.get("id"))){
			try{
				//添加基础信息
				params.put("userid", currentUser.getUserid());
				params.put("userName", currentUser.getUsername());
				params.put("create_time",StringUtil.getCurrentDateForMysql24() );
				params.put("update_time",StringUtil.getCurrentDateForMysql24() );
				params.put("is_delete",0);
				params.put("state",0);
				procurement_registrationService.insert(params);
				
				//去更新物资的库存
				goodsService.addCount(Integer.parseInt(params.get("count")+""), Integer.parseInt(params.get("goodsid")+""));
				
				
			}catch(Exception e){
				e.printStackTrace();
				WebUtil.writeObject(response, "<h2 style='color:red'>提交失败！</h2>");
				return;
			}
			
		}else{
			//修改
			params.put("update_time",StringUtil.getCurrentDateForMysql24() ); //最后更新时间改成当前的时间戳
			data = procurement_registrationService.update(params);
		}
		
		//输出结果到页面
		WebUtil.writeObject(response, "<h2 style='color:green'>采购单完成登记！</h2>");
		
	}
	
	
	/**
	 * 删除采购信息
	 * @param request
	 * @param response 
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		params.put("is_delete", 1); //删除标记
		
		try{
			
			data = procurement_registrationService.update(params);
			
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
	 * 模糊查询采购信息列表
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
		data = procurement_registrationService.list(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	
	
}
