$(function(){
	var f = document.joinForm;

	$("#cancelBtn").click(function(){
		//location.href="/memberServlet.mo?func=member_002"; //�������� ����
		location.href="/member/MemberLogin.jsp";
	});

	$('#idCheckBtn').click(function(){
		idCheckAction();
	});

	var idInput = $('input:text[name=joinId]');
	idInput.keypress(function(event){
		if(event.keyCode == 13)
		{
			idCheckAction();
			return false;
		}
	});

	function idCheckAction(){
		// id�� üũ
		var idValue = trim(f.joinId.value);

		if(trim(idValue)==""){
			window.alert("���̵� �Է����ּ���.");
			return false;
		}
		if(trim(idValue)!="")
		{
			if(isEmailChar(idValue))
			{
				window.alert("���̵�� ���� �ҹ��ڿ� ����, '@', '.' ���� �Է°����մϴ�.");
				f.joinId.select();
				return false;
			}
			if((idValue).indexOf("@") == -1 || (idValue).indexOf(".") == -1 || (idValue).indexOf(".")<(idValue).indexOf("@") || isNum((idValue).charAt(0)))
			{
				window.alert("���̵� Ȯ�� �ϼ���.");
				f.joinId.select();
				return false;
			}
		}

		$.ajax({
			type: "POST", 
			url: "/memberServlet.mo",
			dataType: "text",
			data: "func=member_009&joinId=" + idValue, 
			success: function(text){
				var resultText = trim(text);
				var resultArr = resultText.split("^");
				var resultCode = resultArr[0];
				var resultId = resultArr[1];
				var resultMessage = "'<FONT color='red'>"+resultId + "</FONT>' �� " + resultArr[2];
				if(resultCode=="1")
				{
					$("input:hidden[name=idCheckYn]").val('Y');
					$("input:hidden[name=checkId]").val(idValue);
				}
				else
				{
					$("input:hidden[name=idCheckYn]").val('N');
					$("input:hidden[name=checkId]").val('');
				}
				$('#idCheckMessage').html(resultMessage);
			}
		});
	}
});
function joinBtn(){
	var f = document.joinForm;


	window.alert("ȸ�������� ���ϵ帳�ϴ�.\n �α��� �� �̿��ϼ���.");
	f.addr2.value = trim(f.addr2.value);
	f.submit();
}

function zipcodeBtn(){
	window.open("/commonServlet.mo?func=common_001", "zipSearchOpen", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
}
