package com.app.bean;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

public class ResultData {

	private int total;
	private List<Map<String,Object>> rows;
	private int errCode = 0;
	private String errMsg = null;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Map<String, Object>> getRows() {
		return rows;
	}
	public void setRows(List<Map<String, Object>> rows) {
		this.rows = rows;
	}
	public int getErrCode() {
		return errCode;
	}
	public void setErrCode(int errCode) {
		this.errCode = errCode;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
	@Override
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
	
	
	
}
