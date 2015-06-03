package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserSearchDao {
	//
	private SqlMapClientTemplate smct;

	public UserSearchDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> searchUser(String qt){
		return (ArrayList<UserVo>)smct.queryForList("searchUser", qt);
	}
}
