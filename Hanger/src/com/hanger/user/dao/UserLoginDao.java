package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserLoginDao {
	//
	private SqlMapClientTemplate smct;

	public UserLoginDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> getUser(UserVo user)
	{
		return (ArrayList<UserVo>)smct.queryForList("getUser", user);
	}
}
