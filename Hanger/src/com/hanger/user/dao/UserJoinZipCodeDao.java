package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.ZipCode;

public class UserJoinZipCodeDao {
	private SqlMapClientTemplate smct;

	public UserJoinZipCodeDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	public ArrayList<ZipCode> searchZipCode(String qt)
	{
		return (ArrayList<ZipCode>)smct.queryForList("searchZipCode", qt);
	}
}
