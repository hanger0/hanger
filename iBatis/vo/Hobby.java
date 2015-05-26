package vo;

// VO 로 사용되는 클래스
// Data Table의 각 컬럼에 대응하는 변수와 set/get 메소드가 선언되어 있다.
public class Hobby
{
	private String code;
	private String name;
	private String regId;
	private String regDate;
	private String regIp;
	private String updId;
	private String updDate;
	private String updIp;
	private String useYn;

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getRegId()
	{
		return regId;
	}

	public void setRegId(String regId)
	{
		this.regId = regId;
	}

	public String getRegDate()
	{
		return regDate;
	}

	public void setRegDate(String regDate)
	{
		this.regDate = regDate;
	}

	public String getRegIp()
	{
		return regIp;
	}

	public void setRegIp(String regIp)
	{
		this.regIp = regIp;
	}

	public String getUpdId()
	{
		return updId;
	}

	public void setUpdId(String updId)
	{
		this.updId = updId;
	}

	public String getUpdDate()
	{
		return updDate;
	}

	public void setUpdDate(String updDate)
	{
		this.updDate = updDate;
	}

	public String getUpdIp()
	{
		return updIp;
	}

	public void setUpdIp(String updIp)
	{
		this.updIp = updIp;
	}

	public String getUseYn()
	{
		return useYn;
	}

	public void setUseYn(String useYn)
	{
		this.useYn = useYn;
	}

	public String toString() {
		return "CODE = " + code + ", NAME = " + name + ", REG_ID = " + regId + ", REG_DATE = " + regDate + ", REG_IP = " + regIp + ", UPD_ID = " + updId + ", UPD_DATE = " + updDate + ", UPD_IP = " + updIp + ", USEYN = " + useYn;
	}
}