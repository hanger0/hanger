package dao;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// iBatis 설정 파일을 로딩하여 중요한 SqlMapClient 객체를 생성한는 클래스 이다.
// Singleton Design Pattern으로 만들어져 있으며, 다른 곳에서 호출하면, sqlMapclient 객체를 return하여 준다.
public class SqlMapFactory
{
	private static SqlMapClient sqlMap;

	// static 블럭으로서 class가 처음 로딩될때 한번만 실행된다.
	// 주로 static 변수를 초기화할 때 사용한다.
	// iBatis 관련 설정 파일들을 읽어 들여 SqlMapClient 객체를 생성하여 static 변수로 가지고 있다가
	// 다른 곳에서 요구하면 return 하여 준다.
	static
	{
		try
		{
			String resource = "config/sqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("Error while initializing SqlMapClient : " + e);
		}
	}

	private SqlMapFactory()
	{}

	public static SqlMapClient getInstance()
	{
		return sqlMap;
	}
}