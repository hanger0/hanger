package com.hanger.user.dao;

import org.apache.struts.apps.mailreader.dao.User;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class UserUpdateDao {
	private SqlMapClientTemplate stmt;

	public UserUpdateDao(SqlMapClientTemplate stmt) {
		this.stmt = stmt;
	}
	
	public int update(User user){
		return stmt.update("updateUser", user);
	}
}
