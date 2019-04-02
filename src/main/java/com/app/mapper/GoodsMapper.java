package com.app.mapper;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {

	int insert(Map<String, Object> params);

	int update(Map<String, Object> params);

	List<Map<String, Object>> list(Map<String, Object> params);

	Integer getTotal(Map<String, Object> params);

	void addCount(int count, int goodsid);

	int getCount(int goodsid);

	int getLyCount(int goodsid);

	List<Map<String, Object>> wzpd(Map<String, Object> params);

	Integer getTotal_wzpd(Map<String, Object> params);

}
