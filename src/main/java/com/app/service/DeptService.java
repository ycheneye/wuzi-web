package com.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.ResultData;
import com.app.mapper.DeptMapper;

@Service
public class DeptService {
	
	@Autowired
	private DeptMapper deptMapper;

	public ResultData insert(Map<String, Object> params) {
		ResultData data = new ResultData();
		deptMapper.insert(params);
		return data;
	}

	public ResultData update(Map<String, Object> params) {
		ResultData data = new ResultData();
		deptMapper.update(params);
		return data;
	}

	public ResultData list(Map<String, Object> params, Integer page, Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = deptMapper.list(params);
		
		Integer total = deptMapper.getTotal(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

	public void addDeptLingYong(Map<String, Object> params) {
		
		deptMapper.addDeptLingYong(params);
		
	}

	public ResultData listLycx(Map<String, Object> params, Integer page,
			Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = deptMapper.listLycx(params);
		
		Integer total = deptMapper.getTotal_lycx(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

	public void addDeptLingYongCount(String deptid) {
		
		deptMapper.addDeptLingYongCount(deptid);
	}

	public ResultData listJccx(Map<String, Object> params, Integer page,
			Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = deptMapper.listJccx(params);
		
		Integer total = deptMapper.getTotal_jccx(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

	public void addDeptJc(Map<String, Object> params) {
		deptMapper.addDeptJc(params);
	}

	public void addDeptJcCount(String deptid) {
		deptMapper.addDeptJcCount(deptid);
	}

	public ResultData updateJieChuState(Map<String, Object> params) {
		ResultData data = new ResultData();
		deptMapper.updateJieChuState(params);
		return data;
	}

	public void addDeptGh(String id) {
		
		deptMapper.addDeptGh(id);
	}

	public void addDeptGhSh(String goodsid) {
		deptMapper.addDeptGhSh(goodsid);
	}

	public ResultData listBscx(Map<String, Object> params, Integer page,
			Integer rows) {
		ResultData data = new ResultData();
		
		params.put("start", (page-1)*rows);
		
		params.put("end", rows);
		
		List<Map<String,Object>> list = deptMapper.listbscx(params);
		
		Integer total = deptMapper.getTotal_bscx(params);
		
		data.setRows(list);
		data.setTotal(total);
		
		return data;
	}

	public void addDeptBaosun(Map<String, Object> params) {
		deptMapper.addDeptBaosun(params);
	}

	public int getMaxBaosun(Map<String, Object> params) {
		return deptMapper.getMaxBaosun(params);
	}

}
