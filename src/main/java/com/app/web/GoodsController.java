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
import com.app.service.GoodsService;
import com.app.util.StringUtil;
import com.app.util.WebUtil;

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/getPage")
	public ModelAndView getPage(){
		return new ModelAndView("goods");
	}
	
	/**
	 * 物资盘点
	 * 方法名：wzpd
	 * 创建人：admin 
	 * 时间：2018年5月3日-下午6:49:48  void
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/wzpd")
	public void wzpd(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		if(StringUtil.isNotEmpty(params.get("goodsName"))) params.put("goodsName", "%" + params.get("goodsName") + "%");
		
		data = goodsService.wzpd(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
		
	}
	
	
	/**
	 * 保存物资信息
	 * @param request
	 * @param response
	 * 
	 * 字段：
	 * id:主键
	 * goodsName：物资名称 
	 * userid：登记人
	 * userName：登记人姓名
	 * create_time：创建时间
	 * update_time：最后更新时间
	 * is_delete：是否删除？
	 * 
	 */
	@RequestMapping("/save")
	public void save(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
		
		//进行必要的非空判断
		if(StringUtil.isEmpty(params.get("goodsName"))){
			data.setErrCode(-1);
			data.setErrMsg("物资名称不能为空！");
			WebUtil.writeObject(response, data);
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
				goodsService.insert(params);
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
			data = goodsService.update(params);
		}
		
		//输出结果到页面
		WebUtil.writeObject(response, data);
		
	}
	
	
	/**
	 * 删除物资信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		params.put("is_delete", 1); //删除标记
		
		try{
			
			data = goodsService.update(params);
			
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
	 * 模糊查询物资信息列表
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
		data = goodsService.list(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	
	
}
