package com.app.service;

import java.sql.PreparedStatement;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.PageBean;
import com.app.bean.TRole;
import com.app.bean.TRoleExample;
import com.app.bean.TRoleExample.Criteria;
import com.app.mapper.TRoleMapper;
import com.github.pagehelper.PageHelper;

import net.sf.json.JSONArray;

@Service
public class RoleService {
	
	@Autowired
	private TRoleMapper mapper;

	public List<TRole> list(PageBean pageBean, TRole role) {
		
		PageHelper.startPage(pageBean.getPage(), pageBean.getRows());
		
		TRoleExample example = new TRoleExample();
		Criteria createCriteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(role.getRolename())){
			createCriteria.andRolenameLike("%" + role.getRolename() + "%");
		}
		
		
		return mapper.selectByExample(example);
	}



	public void save(TRole tRole) {
		
		mapper.insert(tRole);
	}



	public void update(TRole tRole) {
		TRoleExample example = new TRoleExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andRoleidEqualTo(tRole.getRoleid());

		mapper.updateByPrimaryKey(tRole);
		
	}



	public void delete(List<Integer> list) {
		
		for(int id : list){
			mapper.deleteByPrimaryKey(id);
		}
		
	}



	public void updateAuth(TRole role) {
		
		TRoleExample example = new TRoleExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andRoleidEqualTo(role.getRoleid());
		
		List<TRole> selectByExample = mapper.selectByExample(example);
		TRole tRole = selectByExample.get(0);
		
		tRole.setAuthids(role.getAuthids());
		
		mapper.updateByExample(tRole, example);
		
	}

}
