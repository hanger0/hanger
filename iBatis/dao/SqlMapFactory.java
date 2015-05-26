package dao;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

// iBatis ���� ������ �ε��Ͽ� �߿��� SqlMapClient ��ü�� �����Ѵ� Ŭ���� �̴�.
// Singleton Design Pattern���� ������� ������, �ٸ� ������ ȣ���ϸ�, sqlMapclient ��ü�� return�Ͽ� �ش�.
public class SqlMapFactory
{
	private static SqlMapClient sqlMap;

	// static �����μ� class�� ó�� �ε��ɶ� �ѹ��� ����ȴ�.
	// �ַ� static ������ �ʱ�ȭ�� �� ����Ѵ�.
	// iBatis ���� ���� ���ϵ��� �о� �鿩 SqlMapClient ��ü�� �����Ͽ� static ������ ������ �ִٰ�
	// �ٸ� ������ �䱸�ϸ� return �Ͽ� �ش�.
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