package com.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.ResultData;
import com.app.mapper.GoodsMapper;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	
	/**
	 * 根据物资编号获取领用数量
	 * 方法名：getLyCount
	 * 创建人：admin 
	 * 时间：2018年4月26日-上午11:13:56 
	 * @param goodsid
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public int getLyCount(int goodsid){
		return goodsMapper.getLyCount(goodsid);
	}
	
	public int getCount(int goodsid){
		return goodsMapper.getCount(goodsid);
	}
	
	
	public void addCount(int count,int goodsid){
		
		goodsMapper.addCount(count,goodsid);
	}

	public ResultData insert(Map<String, Object> params) {
		ResultData data = new ResultData();
		goodsMapper.insert(params);
		return data;
	}

	public ResultData update(Map<String, Object> params) {
		ResultData data = new ResultData();
		goodsMapper.update(params);
		return data;
	}

	public ResultData list(Map<String, Object> params, Integer page, Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = goodsMapper.list(params);
		
		Integer total = goodsMapper.getTotal(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

	public ResultData wzpd(Map<String, Object> params, Integer page,
			Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = goodsMapper.wzpd(params);
		
		Integer total = goodsMapper.getTotal_wzpd(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

}
