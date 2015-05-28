package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.User;

public class UserJoinDao {
	private SqlMapClientTemplate smct;

	public UserJoinDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	public void insertHobby(User user)
	{
		smct.insert("insertUser", user);
	}
}