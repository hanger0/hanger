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

	@SuppressWarnings("unchecked")
	public ArrayList<ZipCode> searchZipCode(String qt)
	{
		System.out.println("qt   :   " + qt);
		return (ArrayList<ZipCode>)smct.queryForList("searchZipCode", qt);
	}
}
