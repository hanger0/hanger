import java.util.*;

import dao.HobbyDao;
import vo.Hobby;

public class HobbyTest
{
	public static void main(String[] args) throws Exception
	{
		// VO로 사용하는 객체로서 Data의 추가를 실행하기 위해서 생성한다.
		Hobby h = new Hobby();
		h.setName("농구");
		h.setRegId("admin");
		h.setRegIp("127.0.0.1");
		h.setUpdId("admin");
		h.setUpdIp("127.0.0.1");
		h.setUseYn("Y");

		// Data를 조회하기 전에 먼저 취미를 하나 추가한다.
		HobbyDao hd = new HobbyDao();
		hd.insertHobby(h);

		// Data를 조회하고 출력한다.
		ArrayList hobbyList = hd.getHobbyList();
		for(int i=0; i<hobbyList.size(); i++)
		{
			System.out.println(hobbyList.get(i));
		}
	}
}