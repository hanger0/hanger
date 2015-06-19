package com.hanger.manager.managerPage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class ManagerUserListDao {
	private SqlMapClientTemplate smct;

	public ManagerUserListDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> selectAllUser() {
		return (ArrayList<UserVo>) smct.queryForList("managerSelectAllUser");
	}
}
