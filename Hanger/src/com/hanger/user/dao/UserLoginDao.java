package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.User;

public class UserLoginDao {
	//
	private SqlMapClientTemplate smct;

	public UserLoginDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<User> getUser(User user)
	{
		return (ArrayList<User>)smct.queryForList("getUser", user);
	}
}
