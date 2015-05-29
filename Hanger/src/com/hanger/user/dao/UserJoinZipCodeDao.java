package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.ZipCodeVo;

public class UserJoinZipCodeDao {
	private SqlMapClientTemplate smct;

	public UserJoinZipCodeDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<ZipCodeVo> searchZipCode(String qt)
	{
		System.out.println("qt   :   " + qt);
		return (ArrayList<ZipCodeVo>)smct.queryForList("searchZipCode", qt);
	}
}
