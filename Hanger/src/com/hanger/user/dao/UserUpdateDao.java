package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserUpdateDao {
	private SqlMapClientTemplate stmt;

	public UserUpdateDao(SqlMapClientTemplate stmt) {
		this.stmt = stmt;
	}
	
	public int update(UserVo user){
		return stmt.update("updateUser", user);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> selectUserInfo(String userCode){
		return  (ArrayList<UserVo>)stmt.queryForList("selectUser", userCode);
	}
}
