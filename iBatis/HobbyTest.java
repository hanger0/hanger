import java.util.*;

import dao.HobbyDao;
import vo.Hobby;

public class HobbyTest
{
	public static void main(String[] args) throws Exception
	{
		// VO�� ����ϴ� ��ü�μ� Data�� �߰��� �����ϱ� ���ؼ� �����Ѵ�.
		Hobby h = new Hobby();
		h.setName("��");
		h.setRegId("admin");
		h.setRegIp("127.0.0.1");
		h.setUpdId("admin");
		h.setUpdIp("127.0.0.1");
		h.setUseYn("Y");

		// Data�� ��ȸ�ϱ� ���� ���� ��̸� �ϳ� �߰��Ѵ�.
		HobbyDao hd = new HobbyDao();
		hd.insertHobby(h);

		// Data�� ��ȸ�ϰ� ����Ѵ�.
		ArrayList hobbyList = hd.getHobbyList();
		for(int i=0; i<hobbyList.size(); i++)
		{
			System.out.println(hobbyList.get(i));
		}
	}
}