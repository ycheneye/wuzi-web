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
import com.app.service.DeptService;
import com.app.service.GoodsService;
import com.app.util.StringUtil;
import com.app.util.WebUtil;

@Controller
@RequestMapping("/admin/dept")
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/getLycxPage")
	public ModelAndView getLycxPage(){
		return new ModelAndView("lycx");
	}
	
	@RequestMapping("/getPage")
	public ModelAndView getPage(){
		return new ModelAndView("dept");
	}
	
	
	/**
	 * 保存部门信息
	 * @param request
	 * @param response
	 * 
	 * 字段：
	 *　deptid:部门ID
	 *　update_time:最后更新时间
	 *　userid:登记人
	 *　create_time:创建时间
	 *　userName:用户姓名
	 *　is_delete:是否删除？
	 *　deptname:部门名称
	 */
	@RequestMapping("/save")
	public void save(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
	
		//若id不存在就新增
		if(StringUtil.isEmpty(params.get("deptid"))){
			try{
				//添加基础信息
				params.put("userid", currentUser.getUserid());
				params.put("userName", currentUser.getUsername());
				params.put("create_time",StringUtil.getCurrentDateForMysql24() );
				params.put("update_time",StringUtil.getCurrentDateForMysql24() );
				params.put("is_delete",0);
				deptService.insert(params);
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
			data = deptService.update(params);
		}
		
		//输出结果到页面
		WebUtil.writeObject(response, data);
		
	}
	
	
	/**
	 * 删除部门信息
	 * @param request
	 * @param response 
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		params.put("is_delete", 1); //删除标记
		
		try{
			
			data = deptService.update(params);
			
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
	 * 部门领用查询
	 * 方法名：listLycx
	 * 创建人：admin 
	 * 时间：2018年4月22日-下午12:51:58 
	 * @param request
	 * @param response
	 * @param page
	 * @param rows void
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/listLycx")
	public void listLycx(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		params.put("is_delete", 0);
		data = deptService.listLycx(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	
	@RequestMapping("/listBscx")
	public void listBscx(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		params.put("is_delete", 0);
		data = deptService.listBscx(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	/**
	 * 部门借出查询
	 * 方法名：listJccx
	 * 创建人：admin 
	 * 时间：2018年4月22日-下午12:51:58 
	 * @param request
	 * @param response
	 * @param page
	 * @param rows void
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/listJccx")
	public void listJccx(HttpServletRequest request,HttpServletResponse response,Integer page,Integer rows){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		params.put("is_delete", 0);
		data = deptService.listJccx(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	
	/**
	 * 模糊查询部门信息列表
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
		data = deptService.list(params,page,rows);
		
		WebUtil.writeObject(response, data);
		
	}
	
	
	/**
	 * 部门领用物资
	 * 方法名：deptLingYong
	 * 创建人：admin 
	 * 时间：2018年4月21日-下午4:51:17  void
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/ly")
	public void deptLingYong(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
		params.put("userid", currentUser.getUserid());
		params.put("userName", currentUser.getUsername());
		params.put("create_time",StringUtil.getCurrentDateForMysql24() );
		params.put("update_time",StringUtil.getCurrentDateForMysql24() );
		params.put("is_delete",0);
		try{
			
			//先查看物资是否充足？
			int goodsid = Integer.parseInt(params.get("goodsid").toString());
			int count = goodsService.getCount(goodsid);
			
			int countForLoan = Integer.parseInt (params.get("count").toString());
			
			if(countForLoan > count){
				data.setErrCode(-1);
				data.setErrMsg("审核失败，原因是库存数量不足，无法领用！");
				WebUtil.writeObject(response, data);
				return;
			}
			
			deptService.addDeptLingYong(params);
			
			//领用成功后，部门领用物资的次数+1
			deptService.addDeptLingYongCount(params.get("deptid").toString());
			
			
			//减去库存
			goodsService.addCount(-Integer.parseInt(params.get("count").toString()), Integer.parseInt(params.get("goodsid").toString()));
			
			
		}catch(Exception e){
			data.setErrCode(-1);
			data.setErrMsg(e.toString());
		}
		
		WebUtil.writeObject(response, data);
		
		
		
	}
	
	
	
	/**
	 * 部门借出物资
	 * 方法名：deptLingYong
	 * 创建人：admin 
	 * 时间：2018年4月21日-下午4:51:17  void
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/jc")
	public void deptJiechu(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
		params.put("userid", currentUser.getUserid());
		params.put("userName", currentUser.getUsername());
		params.put("create_time",StringUtil.getCurrentDateForMysql24() );
		params.put("update_time",StringUtil.getCurrentDateForMysql24() );
		params.put("is_delete",0);
		try{
			deptService.addDeptJc(params);
			
			//领用成功后，部门借出物资的次数+1
			deptService.addDeptJcCount(params.get("deptid").toString());
			
			
			
			//减去库存
			//goodsService.addCount(-Integer.parseInt(params.get("count").toString()), Integer.parseInt(params.get("goodsid").toString()));
			
		}catch(Exception e){
			data.setErrCode(-1);
			data.setErrMsg(e.toString());
		}
		
		WebUtil.writeObject(response, data);
		
		
		
	}
	
	@RequestMapping("/bs")
	public void bs(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		TUser currentUser = (TUser) request.getSession().getAttribute("user");
		params.put("userid", currentUser.getUserid());
		params.put("userName", currentUser.getUsername());
		params.put("create_time",StringUtil.getCurrentDateForMysql24() );
		params.put("update_time",StringUtil.getCurrentDateForMysql24() );
		params.put("is_delete",0);
		try{
			
			int count = deptService.getMaxBaosun(params);
			
			if(Integer.parseInt(params.get("count").toString()) > count){
				data.setErrCode(-1);
				data.setErrMsg("报损超标！");
				WebUtil.writeObject(response, data);
				return;
				
			}
			
			deptService.addDeptBaosun(params);
			
		}catch(Exception e){
			data.setErrCode(-1);
			data.setErrMsg(e.toString());
		}
		
		WebUtil.writeObject(response, data);
		
		
		
	}
	
	
	@RequestMapping("/recession")
	public void recession(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		try{
			deptService.addDeptGh(params.get("id").toString());
			//int goodsid = Integer.parseInt(params.get("goodsid").toString());
			//int count = Integer.parseInt (params.get("count").toString());
			//goodsService.addCount(count, goodsid);
			
		}catch(Exception e){
			e.printStackTrace();
			data.setErrCode(-1);
			data.setErrMsg("审核失败，请联系管理员！");
			WebUtil.writeObject(response, data);
			return;
		}
		
		WebUtil.writeObject(response, data);
	}
	
	@RequestMapping("/recessionAudit")
	public void recessionAudit(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		try{
			deptService.addDeptGhSh(params.get("id").toString());
			int goodsid = Integer.parseInt(params.get("goodsid").toString());
			int count = Integer.parseInt (params.get("count").toString());
			goodsService.addCount(count, goodsid);
			
		}catch(Exception e){
			e.printStackTrace();
			data.setErrCode(-1);
			data.setErrMsg("审核失败，请联系管理员！");
			WebUtil.writeObject(response, data);
			return;
		}
		
		WebUtil.writeObject(response, data);
	}
	
	/**
	 * 审核借出物资
	 * @param request
	 * @param response 
	 */
	@RequestMapping("/audit")
	public void audit(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = WebUtil.getParameters(request);
		ResultData data = new ResultData();
		
		//先查看物资是否充足？
		int goodsid = Integer.parseInt(params.get("goodsid").toString());
		int count = goodsService.getCount(goodsid);
		
		int countForLoan = Integer.parseInt (params.get("count").toString());
		
		if(countForLoan > count){
			data.setErrCode(-1);
			data.setErrMsg("审核失败，原因是库存数量不足，无法借出！");
			WebUtil.writeObject(response, data);
			return;
		}
		
		try{
			
			data = deptService.updateJieChuState(params);
			//审核通过后就要去修改库存量
			goodsService.addCount(-countForLoan, goodsid);
			System.out.println("库存修改成功！");
			
		}catch(Exception e){
			e.printStackTrace();
			data.setErrCode(-1);
			data.setErrMsg("审核失败，请联系管理员！");
			WebUtil.writeObject(response, data);
			return;
		}
		
		//输出结果到页面
		WebUtil.writeObject(response, data);
				
	}
	
	
	
	
}
