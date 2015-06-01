package com.hanger.user.dao;

import java.util.ArrayList;

import org.apache.struts.apps.mailreader.dao.User;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class UserIdCheckDao {
	//
	private SqlMapClientTemplate stmt;

	public UserIdCheckDao(SqlMapClientTemplate stmt) {
		this.stmt = stmt;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<User> idCheck(String userId){
		return (ArrayList<User>)stmt.queryForList("idCheck", userId);
	}
}
