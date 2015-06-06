package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserSelectDao {
	//
	private SqlMapClientTemplate smct;
	public UserSelectDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public UserVo selectUser(String userCode){
		return (UserVo)smct.queryForObject("selectUser", userCode);
	}
}
