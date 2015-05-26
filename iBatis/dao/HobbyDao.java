package dao;

import java.sql.*;
import java.util.*;

import vo.Hobby;

import com.ibatis.sqlmap.client.SqlMapClient;

// ���� DB�� �����Ͽ� DB���� ���� ó���ϴ� Ŭ���� �̴�.
// SqlMapFactory �� ���� �޾ƿ� SqlMapClient ��ü�� �̿��ؼ� DB ���� ���� �޼ҵ带 �����Ѵ�.
public class HobbyDao
{

	private static SqlMapClient sqlMap = SqlMapFactory.getInstance();

	// ��� ����� �޾ƿ´�.
	public ArrayList getHobbyList() throws SQLException
	{
		return (ArrayList)sqlMap.queryForList("getHobbyList");
	}

	// ��̸� �߰��Ѵ�.
	public void insertHobby(Hobby hobby) throws SQLException
	{
		sqlMap.insert("insertHobby", hobby);
	}

	// ��̸� �����Ѵ�.
	public void updateHobby(Hobby hobby) throws SQLException
	{
		sqlMap.update("updateHobby", hobby);
	}

	// ��̸� �����Ѵ�.
	public void deleteHobby(Hobby hobby) throws SQLException
	{
		sqlMap.delete("deleteHobby", hobby);
	}

	// ���ǿ� �´� ��� ��ü �ϳ����� �����´�.
	public Hobby getHobby(String id) throws SQLException
	{
		return (Hobby)sqlMap.queryForObject("getHobby", id);
	}
}