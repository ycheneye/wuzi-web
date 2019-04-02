package com.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.TUser;
import com.app.bean.TUserExample;
import com.app.bean.TUserExample.Criteria;
import com.app.mapper.TUserMapper;

@Service
public class LoginService {
	
	@Autowired
	private TUserMapper tUserMapper;

	public String checkLogin(String userName, String password, HttpServletRequest request) {

		//往sql语句里添加条件
		TUserExample example = new TUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(userName);
		criteria.andPasswordEqualTo(password);
		
		List<TUser> users = tUserMapper.selectByExample(example);
		
		if(users != null && users.size() > 0){
			request.getSession().setAttribute("user", users.get(0));
			return "0";
		}
		
		return "1";
	}

}
