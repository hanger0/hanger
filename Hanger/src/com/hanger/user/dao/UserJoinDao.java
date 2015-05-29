package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserJoinDao {
	private SqlMapClientTemplate smct;

	public UserJoinDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	public void insertUser(UserVo user)
	{
		smct.insert("insertUser", user);
	}
}