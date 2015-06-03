package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserFindPasswordDao {
	//
	private SqlMapClientTemplate scmt;
	
	public UserFindPasswordDao(SqlMapClientTemplate scmt){
		this.scmt = scmt;
	}
	
	public String selectPassword(UserVo user){
		return (String)scmt.queryForObject("selectPassword", user);
	}
}
