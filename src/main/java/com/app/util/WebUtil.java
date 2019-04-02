package com.app.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 通用Web工具类
 * WebUtil
 * 时间：2017年5月11日-下午5:05:36 
 * @version 1.0.0
 */
public class WebUtil {
	
	/**
	 * 将Request中带的参数转换称HashMap
	 * 方法名：getParameters
	 * 时间：2017年2月15日-上午9:42:15 
	 * @param request
	 * @return Map<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	public static Map<String,Object> getParameters(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration<String> names = request.getParameterNames();
		
		while(names.hasMoreElements()){
			String key = names.nextElement(); 			//获取key值
			String value = request.getParameter(key);   //获取对应的value
			map.put(key, value);
		}
		
		return map;
	}
	
	/**
	 * 通过IO流的方式向前端输出一个Java对象
	 * 方法名：writeObject
	 * 时间：2017年5月11日-下午5:04:40 
	 * @param response
	 * @param o void
	 * @exception 
	 * @since  1.0.0
	 */
	public static void writeObject(HttpServletResponse response,Object o){
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println(o.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
	}
}
