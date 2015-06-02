package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserDeleteDao {
	private SqlMapClientTemplate stmt;
	
	public UserDeleteDao(SqlMapClientTemplate stmt){
		this.stmt = stmt;
	}
	
	public int deleteUser(UserVo user){
		return stmt.update("deleteUser", user);
	}
}
