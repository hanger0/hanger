package dao;

import java.sql.*;
import java.util.*;

import vo.Hobby;

import com.ibatis.sqlmap.client.SqlMapClient;

// 직접 DB에 접근하여 DB와의 일을 처리하는 클래스 이다.
// SqlMapFactory 로 부터 받아온 SqlMapClient 객체를 이용해서 DB 쿼리 실행 메소드를 실행한다.
public class HobbyDao
{

	private static SqlMapClient sqlMap = SqlMapFactory.getInstance();

	// 취미 목록을 받아온다.
	public ArrayList getHobbyList() throws SQLException
	{
		return (ArrayList)sqlMap.queryForList("getHobbyList");
	}

	// 취미를 추가한다.
	public void insertHobby(Hobby hobby) throws SQLException
	{
		sqlMap.insert("insertHobby", hobby);
	}

	// 취미를 수정한다.
	public void updateHobby(Hobby hobby) throws SQLException
	{
		sqlMap.update("updateHobby", hobby);
	}

	// 취미를 삭제한다.
	public void deleteHobby(Hobby hobby) throws SQLException
	{
		sqlMap.delete("deleteHobby", hobby);
	}

	// 조건에 맞는 취미 객체 하나만을 가져온다.
	public Hobby getHobby(String id) throws SQLException
	{
		return (Hobby)sqlMap.queryForObject("getHobby", id);
	}
}