package com.app.mapper;

import java.util.List;
import java.util.Map;

public interface DeptMapper {

	int insert(Map<String, Object> params);

	int update(Map<String, Object> params);

	List<Map<String, Object>> list(Map<String, Object> params);

	Integer getTotal(Map<String, Object> params);

	void addDeptLingYong(Map<String, Object> params);

	List<Map<String, Object>> listLycx(Map<String, Object> params);

	Integer getTotal_lycx(Map<String, Object> params);

	void addDeptLingYongCount(String deptid);

	List<Map<String, Object>> listJccx(Map<String, Object> params);

	Integer getTotal_jccx(Map<String, Object> params);

	void addDeptJc(Map<String, Object> params);

	void addDeptJcCount(String deptid);

	void updateJieChuState(Map<String, Object> params);

	void addDeptGh(String id);

	void addDeptGhSh(String goodsid);

	List<Map<String, Object>> listBscx(Map<String, Object> params);

	Integer getTotal_bscx(Map<String, Object> params);

	void addDeptBaosun(Map<String, Object> params);

	List<Map<String, Object>> listbscx(Map<String, Object> params);

	Integer getMaxBaosun(Map<String, Object> params);

}
