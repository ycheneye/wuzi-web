package com.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.PageBean;
import com.app.bean.TUser;
import com.app.bean.TUserExample;
import com.app.bean.TUserExample.Criteria;
import com.app.mapper.TUserMapper;

@Service
public class UserService {
	@Autowired
	private TUserMapper tUserMapper;

	

	public String addUser(TUser user) {
		
		TUserExample example = new TUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		int count = tUserMapper.countByExample(example);
		if(count > 0){
			return "用户已经存在！";
		}
		
		tUserMapper.insert(user);
		
		return "0";
	}



	public List list(PageBean pageBean, TUser user) {
		TUserExample example = new TUserExample();
		Criteria criteria = example.createCriteria();
		
		if(user.getRealname() != null){
			criteria.andRealnameLike("%"+user.getRealname()+"%");
		}
		
		
		
		if(user.getRoleid() != null){
			criteria.andRoleidEqualTo(user.getRoleid());
		}
		
		
		return tUserMapper.selectByExample(example);
	}



	public void update(TUser user) {
		TUserExample example = new TUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(user.getUserid());
		TUser tUser = tUserMapper.selectByExample(example).get(0);
		tUser.setRoleid(user.getRoleid());
		
		tUserMapper.updateByPrimaryKey(tUser);
	}



	public void delete(String delIds) {
		String[] split = delIds.split(",");
		for (int i = 0; i < split.length; i++) {
			tUserMapper.deleteByPrimaryKey(Integer.parseInt(split[i]));
		}
	}



	public void updatePassword(Integer userid, String newPassword) {
		TUserExample example = new TUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		TUser tUser = tUserMapper.selectByExample(example).get(0);
		tUser.setPassword(newPassword);
		tUserMapper.updateByPrimaryKey(tUser);//example貌似无法重复使用，所以这里直接用updateByPrimaryKey
		
	}
}
