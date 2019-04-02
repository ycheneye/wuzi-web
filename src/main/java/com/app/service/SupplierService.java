package com.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.ResultData;
import com.app.mapper.SupplierMapper;

@Service
public class SupplierService {
	
	@Autowired
	private SupplierMapper supplierMapper;

	public ResultData insert(Map<String, Object> params) {
		ResultData data = new ResultData();
		supplierMapper.insert(params);
		return data;
	}

	public ResultData update(Map<String, Object> params) {
		ResultData data = new ResultData();
		supplierMapper.update(params);
		return data;
	}

	public ResultData list(Map<String, Object> params, Integer page, Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = supplierMapper.list(params);
		
		Integer total = supplierMapper.getTotal(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

}
