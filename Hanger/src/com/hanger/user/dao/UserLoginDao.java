package com.hanger.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.hanger.user.vo.User;

public class UserLoginDao {
	//
	private JdbcTemplate jdbcTemplate;
	private String sql;
	private Object[] paramArr;
	
	public UserLoginDao()
	{ }
	
	public UserLoginDao(JdbcTemplate jdbcTemplate, String sql)
	{
		this.jdbcTemplate = jdbcTemplate;
		this.sql = sql;
	}
	
	public void setParamArr(Object[] paramArr)
	{
		this.paramArr = paramArr;
	}

	@SuppressWarnings("unchecked")
	public List executeSelect()
	{
		System.out.println("LoginDao Controller ½ÇÇà...");
		
		List uvList = jdbcTemplate.query(sql, paramArr, new RowMapper(){
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException
			{
				User uv = new User();
				uv.setUserId(rs.getString("ID"));
				uv.setUserPwd(rs.getString("PASS"));
				return uv;
			}
		});

		return uvList;
	}
}
