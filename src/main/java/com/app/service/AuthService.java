package com.app.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.TAuth;
import com.app.bean.TAuthExample;
import com.app.bean.TRole;
import com.app.bean.TRoleExample;
import com.app.bean.TRoleExample;
import com.app.bean.TRoleExample.Criteria;
import com.app.mapper.TAuthMapper;
import com.app.mapper.TRoleMapper;
import com.app.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class AuthService {
	
	@Autowired
	private TAuthMapper tAuthMapper;
	
	@Autowired
	private TRoleMapper tRoleMapper;

	public String getAuthIdsById(Integer roleid) {
		
		TRoleExample example = new TRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andRoleidEqualTo(roleid);
		List<TRole> selectByExample = tRoleMapper.selectByExample(example);
		TRole tRole = selectByExample.get(0);
		return tRole.getAuthids();
	}

	public JSONArray getAuthsByParentId(String parentId, String authIds) {
		
		JSONArray jsonArr = this.getAuthByParentId(parentId,authIds);
//		System.out.println("权限树："+jsonArr);
		
		for (int i = 0; i < jsonArr.size(); i++) {
			JSONObject jsonObject = jsonArr.getJSONObject(i);
			if("open".equals(jsonObject.getString("state"))){
				continue;
			}else{
				jsonObject.put("children", getAuthsByParentId(jsonObject.getString("id"),authIds));
			}
		}
		
		return jsonArr;
	}

	
	
	private JSONArray getAuthByParentId(String parentId, String authIds) {
		
		JSONArray jsonArray = new JSONArray();
		
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andParentidEqualTo(Integer.parseInt(parentId));
		
		List<Integer> ids = new ArrayList<Integer>();
		
		String[] idsArr = authIds.split(",");
		for (int i = 0; i < idsArr.length; i++) {
			ids.add(Integer.parseInt(idsArr[i]));
		}
		
		
		createCriteria.andAuthidIn(ids);
		
		List<TAuth> selectByExample = tAuthMapper.selectByExample(example);
		
		for (int i = 0; i < selectByExample.size(); i++) {
			
			TAuth tAuth = selectByExample.get(i);
			
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("id", tAuth.getAuthid());
			jsonObject.put("text", tAuth.getAuthname());
			
			if(!hasChildren(tAuth.getAuthid(), authIds)){
				jsonObject.put("state", "open");
			}else{
				jsonObject.put("state", tAuth.getState());				
			}
			jsonObject.put("iconCls", tAuth.getIconcls());
			JSONObject attributeObject=new JSONObject();
			attributeObject.put("authPath", tAuth.getAuthpath());
			jsonObject.put("attributes", attributeObject);
			jsonArray.add(jsonObject);
		}
		
		
		return jsonArray;
	}

	
	
	private boolean hasChildren(Integer authid, String authIds) {
		
		
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andParentidEqualTo(authid);
		
		List<Integer> ids = new ArrayList<Integer>();
		String[] idsArr = authIds.split(",");
		for (int i = 0; i < idsArr.length; i++) {
			ids.add(Integer.parseInt(idsArr[i]));
		}
		
		
		com.app.bean.TAuthExample.Criteria andAuthidIn = createCriteria.andAuthidIn(ids);
		
		List<TAuth> selectByExample = tAuthMapper.selectByExample(example);
		
		if(selectByExample.size() < 1){
			return false;
		}
		
		return true;
	}

	public JSONArray getCheckedAuthsByParentId(String parentId, String authIds) {
		JSONArray jsonArray=this.getCheckedAuthByParentId(parentId,authIds);
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObject=jsonArray.getJSONObject(i);
			if("open".equals(jsonObject.getString("state"))){
				continue;
			}else{
				jsonObject.put("children", getCheckedAuthsByParentId(jsonObject.getString("id"),authIds));
			}
		}
		return jsonArray;
	}

	private JSONArray getCheckedAuthByParentId(String parentId, String authIds) {
		JSONArray jsonArray = new JSONArray();
		
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andParentidEqualTo(Integer.parseInt(parentId));
		
		List<TAuth> selectByExample = tAuthMapper.selectByExample(example);
		
		for (int i = 0; i < selectByExample.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			TAuth tAuth = selectByExample.get(i);
			int authId = tAuth.getAuthid();
			jsonObject.put("id", authId);
			jsonObject.put("text", tAuth.getAuthname());
			jsonObject.put("state", tAuth.getState());
			jsonObject.put("iconCls", tAuth.getIconcls());
			if(StringUtil.existStrArr(authId+"", authIds.split(","))){
				jsonObject.put("checked", true);
			}
			JSONObject attributeObject=new JSONObject();
			attributeObject.put("authPath", tAuth.getAuthpath());
			jsonObject.put("attributes", attributeObject);
			jsonArray.add(jsonObject);
			
			
		}
		
		
		return jsonArray;
	}

	
	
	public JSONArray getListByParentId(String parentId) {
		JSONArray jsonArray=this.getTreeGridAuthByParentId(parentId);
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObject=jsonArray.getJSONObject(i);
			if("open".equals(jsonObject.getString("state"))){
				continue;
			}else{
				jsonObject.put("children", getListByParentId(jsonObject.getString("id")));
			}
		}
		return jsonArray;
	}

	
	private JSONArray getTreeGridAuthByParentId(String parentId) {
		JSONArray jsonArray=new JSONArray();
		
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andParentidEqualTo(Integer.parseInt(parentId));
		
		List<TAuth> selectByExample = tAuthMapper.selectByExample(example);
		
		for (int i = 0; i < selectByExample.size(); i++) {
			TAuth tAuth = selectByExample.get(i);
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("id", tAuth.getAuthid());
			jsonObject.put("text", tAuth.getAuthname());
			jsonObject.put("state",tAuth.getState());
			jsonObject.put("iconCls", tAuth.getIconcls());
			jsonObject.put("authPath", tAuth.getAuthpath());
			jsonObject.put("authDescription", tAuth.getAuthdescription());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}

	public boolean isLeaf(Integer parentid) {
		
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andParentidEqualTo(parentid);
		
		List<TAuth> selectByExample = tAuthMapper.selectByExample(example);
		
		if(selectByExample.size() > 0){
			return false;
		}
		
		return true;
	}

	public void updateStateByAuthId(String status, Integer authId) {
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andAuthidEqualTo(authId);
		
		List<TAuth> selectByExample = tAuthMapper.selectByExample(example);
		
		TAuth tAuth = selectByExample.get(0);
		
		tAuth.setState(status);
		
		
		tAuthMapper.updateByExample(tAuth, example);
		
	}

	public void addAuth(TAuth tAuth) {
		tAuthMapper.insert(tAuth);
	}

	public int getAuthCountByParentId(String parentId) {
		
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andParentidEqualTo(Integer.parseInt(parentId));
		int countByExample = tAuthMapper.countByExample(example);
		
		
		return countByExample;
	}

	public void authDelete(String authId) {
		TAuthExample example = new TAuthExample();
		com.app.bean.TAuthExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andAuthidEqualTo(Integer.parseInt(authId));
		tAuthMapper.deleteByExample(example);
	}

	public void update(TAuth tAuth) {
		tAuthMapper.updateByPrimaryKey(tAuth);
	}

}
