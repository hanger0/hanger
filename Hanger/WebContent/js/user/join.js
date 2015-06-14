$(function(){
	var f = document.form;

	$("#cancelBtn").click(function(){
		//location.href="/memberServlet.mo?func=member_002"; //메인으로 가짐
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
		// id값 체크
		var idValue = trim(f.joinId.value);

		if(trim(f.joinId.value)!="")
		{
			if(isEmailChar(f.joinId.value))
			{
				var resultMessage = "'<FONT color='red'>이메일 형식에 맞지 않습니다.</FONT>'";
				$('#idCheckMessage').html(resultMessage);
				return false;
			}
			if((f.joinId.value).indexOf("@") == -1 || (f.joinId.value).indexOf(".") == -1 || (f.joinId.value).indexOf(".")<(f.joinId.value).indexOf("@") || isNum((f.joinId.value).charAt(0)))
			{
				var resultMessage = "'<FONT color='red'>이메일 형식에 맞지 않습니다.</FONT>'";
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
				var resultMessage = "'<FONT color='red'>"+resultId + "</FONT>' 는 " + resultArr[2];
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

	// id값 체크
	if(trim(f.joinId.value)==""){
		window.alert("아이디를 입력해주세요.");
		return false;
	}
	if(trim(f.joinId.value)!="")
	{
		if(isEmailChar(f.joinId.value))
		{
			window.alert("아이디는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
			f.joinId.select();
			return false;
		}
		if((f.joinId.value).indexOf("@") == -1 || (f.joinId.value).indexOf(".") == -1 || (f.joinId.value).indexOf(".")<(f.joinId.value).indexOf("@") || isNum((f.joinId.value).charAt(0)))
		{
			window.alert("아이디를 확인 하세요.");
			f.joinId.select();
			return false;
		}
	}
	f.joinId.value = trim(f.joinId.value);

	// 비밀번호 값 체크
	if(f.pass1.value=="")
	{
		window.alert("비밀번호를 입력하세요.");
		f.pass1.select();
		return false;
	}
	if(f.pass1.value.length<4 || f.pass1.value.length>21)
	{
		window.alert("비밀번호는 4자 이상 20자 이하로 입력하세요.");
		f.pass1.select();
		return false;
	}
	if(isEngNum(f.pass1.value))
	{
		window.alert("비밀번호는 숫자 또는 영문 소문자만 가능합니다.");
		f.pass1.select();
		return false;
	}
	if(f.pass1.value != f.pass2.value)
	{
		window.alert("비밀번호를 확인하여 주십시오.");
		f.pass2.select();
		return false;
	}
	f.pass1.value = trim(f.pass1.value);

	//이름 체크
	if(f.name.value ==""){
		window.alert("이름을 확인하여 주십시오.");
		return false;
	}

	//생년월일 체크
	if(f.year.value == "0" || f.month.value == "0" || f.day.value == "0"){
		window.alert("생년월일을 입력해주세요.");
		return false;
	}

	// 전화번호 체크
	var phone = f.mobile.value;
	if(phone==""){
		window.alert("전화번호를 입력하세요.");
		return false;
	}
	if(!isNum(phone)){
		window.alert("전화번호는 숫자만 입력가능합니다.");
		return false;
	}
	if(phone.substring(0, 3) != "010"){
		window.alert("전화번호를 확인해주세요.");
		return false;
	}

	//성별 체크
	var gendercheck = 2;
	if(!f.gender[0].checked){
		gendercheck--;
	}
	if(!f.gender[1].checked){
		gendercheck--;
	}
	if(gendercheck == 0){
		window.alert("성별을 체크해주세요");
		return false;
	}

	// 우편번호 체크
	if(f.zipCode1.value=="")
	{
		window.alert("우편번호를 검색하여 입력하세요.");
		return false;
	}

	// 주소 체크
	if(trim(f.addr2.value)=="")
	{
		window.alert("상세주소를 입력하세요.");
		f.addr2.select();
		return false;
	}

	if($("input:hidden[name=idCheckYn]").val()=="N")
	{
		window.alert("중복된 아이디 입니다.");
		return false;
	}
	
	window.alert("회원가입을 축하드립니다.\n 로그인 후 이용하세요.");
	f.addr2.value = trim(f.addr2.value);
	f.submit();
}
