package com.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.ResultData;
import com.app.mapper.Procurement_registrationMapper;

@Service
public class Procurement_registrationService {
	
	@Autowired
	private Procurement_registrationMapper procurement_registrationMapper;

	public ResultData insert(Map<String, Object> params) {
		ResultData data = new ResultData();
		procurement_registrationMapper.insert(params);
		return data;
	}

	public ResultData update(Map<String, Object> params) {
		ResultData data = new ResultData();
		procurement_registrationMapper.update(params);
		return data;
	}

	public ResultData list(Map<String, Object> params, Integer page, Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = procurement_registrationMapper.list(params);
		
		Integer total = procurement_registrationMapper.getTotal(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

}
