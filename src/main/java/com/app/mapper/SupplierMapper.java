package com.app.mapper;

import java.util.List;
import java.util.Map;

public interface SupplierMapper {

	int insert(Map<String, Object> params);

	int update(Map<String, Object> params);

	List<Map<String, Object>> list(Map<String, Object> params);

	Integer getTotal(Map<String, Object> params);

}
