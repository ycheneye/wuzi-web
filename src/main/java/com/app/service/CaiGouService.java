package com.app.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.ResultData;
import com.app.mapper.CaiGouMapper;
import com.app.mapper.TAuthMapper;

@Service
public class CaiGouService {
	
	@Autowired
	private CaiGouMapper caiGouMapper;

	public ResultData insert(Map<String, Object> params) {
		return null;
	}

	public ResultData update(Map<String, Object> params) {
		return null;
	}

}
