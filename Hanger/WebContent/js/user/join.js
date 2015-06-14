$(function(){
	var f = document.form;

	$("#cancelBtn").click(function(){
		//location.href="/memberServlet.mo?func=member_002"; //�������� ����
		location.href="/member/MemberLogin.jsp";
	});
	
	var idInput = $('input:text[name=joinId]');
	idInput.keypress(function(event){
		if(event.keyCode == 13)
		{
			idCheckAction();
			return false;
		}
	});

	$("input:text[name=joinId]").keyup(function(key){
		// id�� üũ
		var idValue = trim(f.joinId.value);

		if(trim(f.joinId.value)!="")
		{
			if(isEmailChar(f.joinId.value))
			{
				var resultMessage = "'<FONT color='red'>�̸��� ���Ŀ� ���� �ʽ��ϴ�.</FONT>'";
				$('#idCheckMessage').html(resultMessage);
				return false;
			}
			if((f.joinId.value).indexOf("@") == -1 || (f.joinId.value).indexOf(".") == -1 || (f.joinId.value).indexOf(".")<(f.joinId.value).indexOf("@") || isNum((f.joinId.value).charAt(0)))
			{
				var resultMessage = "'<FONT color='red'>�̸��� ���Ŀ� ���� �ʽ��ϴ�.</FONT>'";
				$('#idCheckMessage').html(resultMessage);
				return false;
			}
		}
		
		$.ajax({
			type: "POST", 
			url: "/idCheck.hang",
			dataType: "text",
			data: "joinId=" + idValue, 
			success: function(text){
				var resultText = trim(text);
				var resultArr = resultText.split("^");
				var resultCode = resultArr[0];
				var resultId = resultArr[1];
				var resultMessage = "'<FONT color='red'>"+resultId + "</FONT>' �� " + resultArr[2];
				if(resultCode=="1")
				{
					$("input:hidden[name=idCheckYn]").val('Y');
				}
				else
				{
					$("input:hidden[name=idCheckYn]").val('N');
				}
				$('#idCheckMessage').html(resultMessage);
			}
		});
	});
	$(".zipcode").click(function(){
		window.open("/zipCode.hang", "zipSearchOpen", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
	});
});

function cancelBtn(){
	location.href = "/main.hang";
}

function joinBtn(){
	var f = document.form;

	// id�� üũ
	if(trim(f.joinId.value)==""){
		window.alert("���̵� �Է����ּ���.");
		return false;
	}
	if(trim(f.joinId.value)!="")
	{
		if(isEmailChar(f.joinId.value))
		{
			window.alert("���̵�� ���� �ҹ��ڿ� ����, '@', '.' ���� �Է°����մϴ�.");
			f.joinId.select();
			return false;
		}
		if((f.joinId.value).indexOf("@") == -1 || (f.joinId.value).indexOf(".") == -1 || (f.joinId.value).indexOf(".")<(f.joinId.value).indexOf("@") || isNum((f.joinId.value).charAt(0)))
		{
			window.alert("���̵� Ȯ�� �ϼ���.");
			f.joinId.select();
			return false;
		}
	}
	f.joinId.value = trim(f.joinId.value);

	// ��й�ȣ �� üũ
	if(f.pass1.value=="")
	{
		window.alert("��й�ȣ�� �Է��ϼ���.");
		f.pass1.select();
		return false;
	}
	if(f.pass1.value.length<4 || f.pass1.value.length>21)
	{
		window.alert("��й�ȣ�� 4�� �̻� 20�� ���Ϸ� �Է��ϼ���.");
		f.pass1.select();
		return false;
	}
	if(isEngNum(f.pass1.value))
	{
		window.alert("��й�ȣ�� ���� �Ǵ� ���� �ҹ��ڸ� �����մϴ�.");
		f.pass1.select();
		return false;
	}
	if(f.pass1.value != f.pass2.value)
	{
		window.alert("��й�ȣ�� Ȯ���Ͽ� �ֽʽÿ�.");
		f.pass2.select();
		return false;
	}
	f.pass1.value = trim(f.pass1.value);

	//�̸� üũ
	if(f.name.value ==""){
		window.alert("�̸��� Ȯ���Ͽ� �ֽʽÿ�.");
		return false;
	}

	//������� üũ
	if(f.year.value == "0" || f.month.value == "0" || f.day.value == "0"){
		window.alert("��������� �Է����ּ���.");
		return false;
	}

	// ��ȭ��ȣ üũ
	var phone = f.mobile.value;
	if(phone==""){
		window.alert("��ȭ��ȣ�� �Է��ϼ���.");
		return false;
	}
	if(!isNum(phone)){
		window.alert("��ȭ��ȣ�� ���ڸ� �Է°����մϴ�.");
		return false;
	}
	if(phone.substring(0, 3) != "010"){
		window.alert("��ȭ��ȣ�� Ȯ�����ּ���.");
		return false;
	}

	//���� üũ
	var gendercheck = 2;
	if(!f.gender[0].checked){
		gendercheck--;
	}
	if(!f.gender[1].checked){
		gendercheck--;
	}
	if(gendercheck == 0){
		window.alert("������ üũ���ּ���");
		return false;
	}

	// �����ȣ üũ
	if(f.zipCode1.value=="")
	{
		window.alert("�����ȣ�� �˻��Ͽ� �Է��ϼ���.");
		return false;
	}

	// �ּ� üũ
	if(trim(f.addr2.value)=="")
	{
		window.alert("���ּҸ� �Է��ϼ���.");
		f.addr2.select();
		return false;
	}

	if($("input:hidden[name=idCheckYn]").val()=="N")
	{
		window.alert("�ߺ��� ���̵� �Դϴ�.");
		return false;
	}
	
	window.alert("ȸ�������� ���ϵ帳�ϴ�.\n �α��� �� �̿��ϼ���.");
	f.addr2.value = trim(f.addr2.value);
	f.submit();
}
