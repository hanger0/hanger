<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%@ page import="com.hanger.common.controller.SimpleLog"%>
<%@ page import="org.apache.log4j.BasicConfigurator" %>
<% 
UserVo uservo = (UserVo)request.getAttribute("user");

String userPicPath = "";
String userPicOrgName = "";
String userPicSaveName = "";
String userId = "";
String userPwd = "";
String userName = "";
String userGender = "";
String userBirth = "";
String userPhone = "";
String userQuestion = "";
String userAnswer = "";
String userAddr1 = "";
String userAddr2 = "";
String userPostCode1 = "";
String userPostCode2 = "";
String userSkinType = "";
String userSkinTone = "";
String userSkinProblem = "";


// ������� �� �� �� �� �ڸ���� ������� �Լ�
String year = "";
String month = "";
String day= "";
//

String[] userSkinTrouble = null;
String image = "";
if(uservo!=null)
{
   userPicPath = uservo.getUserPicPath();
   userPicOrgName = uservo.getUserPicOrgName();
   userPicSaveName = uservo.getUserPicSaveName();
   image = userPicPath+"\\"+userPicSaveName;
   
   userId = uservo.getUserId();
   userPwd = uservo.getUserPwd();
   userName = uservo.getUserName();
   userGender = uservo.getUserGender();
   userBirth = uservo.getUserBirth();
   userPhone = uservo.getUserPhone();
   userQuestion = uservo.getUserQuestion();
   userAnswer = uservo.getUserAnswer();
   userAddr1 = uservo.getUserAddr1();
   userAddr2 = uservo.getUserAddr2();
   userPostCode1 = uservo.getUserPostCode1();
   userPostCode2 = uservo.getUserPostCode2();
   userSkinType = uservo.getUserSkinType();
   userSkinTone = uservo.getUserSkinTone();

   System.out.println("pass: "+userPicOrgName);
   System.out.println("pass: "+userPicSaveName);

   //üũ�ڽ� �� ��� �ҷ�����
   userSkinProblem = uservo.getUserSkinProblem();
   if(userSkinProblem !=null)
   {
	   userSkinTrouble = userSkinProblem.split("\\^");
   }
   BasicConfigurator.configure();
   SimpleLog.logger.info("-----------image--------------------"+image);
 
   
   
   //������� �� �� �Ϸ� ���//
   year = userBirth.substring(0,4);
   month = userBirth.substring(4,6);
   day = userBirth.substring(6,8);
}
%>
<!DOCTYPE html>
<html>
   <head>
      <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Join</title>
      <!-- Bootstrap -->
      <link rel="stylesheet" media="screen" href="/css/bootstrap/bootstrap.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- �ΰ����� �׸� -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
      <!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
      <script src="/js/javascripts/jquery-1.11.3.min.js" type="text/javascript"></script>
      <!-- ���� js ���ϵ�-->
      <script src="/js/common/common.js" type="text/javascript"></script>
      <script src="/js/user/join.js" type="text/javascript"></script>
      
<script type="text/javascript">
var InputImage = (function loadImageFile() {
    if (window.FileReader) {
        var ImagePre; 
        var ImgReader = new window.FileReader();
        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

        ImgReader.onload = function (Event) {
            if (!ImagePre) {
                var newPreview = document.getElementById("imagePreview");
                ImagePre = new Image();
                ImagePre.style.width = "150px";
                ImagePre.style.height = "180px";
                newPreview.appendChild(ImagePre);
            }
            ImagePre.src = Event.target.result;
            
        };

        return function () {
           
            var img = document.getElementById("image").files;
           
            if (!fileType.test(img[0].type)) { 
               alert("�̹��� ������ ���ε� �ϼ���"); 
               return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }

    }
            
    document.getElementById("imagePreview").src = document.getElementById("image").value;
})();

$(function() {
	//input type="checkbox" name="skinProblem"
<%
	if(userSkinTrouble != null)
	{
	for (int i = 0; i < userSkinTrouble.length; i++) 
		{
%>
		var user = "<%=userSkinTrouble[i]%>";
		$("input:checkbox[value="+user+"]").prop("checked", true);
<%
		}
	}
%>

$(function(){

	var year = "<%=year%>";
	var month = "<%=month%>";
	var day = "<%=day%>";
	/*
	$("select[value="+year+"]").prop("selected", true);
	$("select[value="+month+"]").prop("selected", true);
	$("select[value="+day+"]").prop("selected", true);
	*/
	$("select[name=year]").val(year);
	$("select[name=month]").val(month);
	$("select[name=day]").val(day);

	});
});
</script>
<SCRIPT>

function cancelBtn(){
	location.href = "/main.hang";
}

function joinBtn(){
	var f = document.updateForm;

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
	var input = $('input[name=pass1]').val();
	
	f.addr2.value = trim(f.addr2.value);
	f.submit();
}

</SCRIPT>
<STYLE>
body
{
   background-color:#576767;
   
}
H4
{
   float:left;
   margin-left:50px;
   color:orange;
}
.form-horizontal
{
   width:500px;
   margin-top:50px;
   background-color:#488488;
   margin-bottom:50px;
   height:770px;
}
.form-horizontal1
{
   width:500px;
   background-color:#488488;
   height:500px;
}

.form-group
{
   width:500px;
}
.col-sm-10
{
   width:200px;
}
.col-sm-2
{
   width:300px;
}
.form-control
{
   width:250px;
}
.row
{
   width:400px;
   float:left;
}
.control-label
{
   width:150px;
}
.radio-inline
{
   width:70px;
}
.zip1
{
   float:left;
   width:50px;
   margin-left:13px;
}
.zip2
{
   width:250px;
   left:-38px;
   position:relative;
}
#zipSearch
{
   width:70px;
}
#imagePreview
{
   position:relative;
   top:5px;
   left:-10px;
}
.pull-right
{
   margin-right:5px;
}
.checks
{
   width:300px;
}
</STYLE>
</head>
<body>
<CENTER>
   <div class="form-horizontal" role="form">
   
<form role="form" id="updateForm" name="updateForm" method="POST" action="/updateUserResult.hang" enctype="multipart/form-data">
    <INPUT type="hidden" name="picPath" value="" />
    <INPUT type="hidden" name="picOrgName" value="<%= userPicOrgName %>" />
    <INPUT type="hidden" name="picSaveName" value="<%= userPicSaveName %>" />
    <INPUT type="hidden" name="picSize" value="" />
    <INPUT type="hidden" name="idCheckYn" value="N" />
   <div class="col-md-12">
      <h1>Join</h1>
      <H4>�ʼ� ����</H4>
      <BR><BR><BR>
   </div>
   
    <div class="form-group">
        <label for="Email" class="col-sm-2 control-label">Email : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="Email" name="joinId" value="<%= userId %>" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="password1" class="col-sm-2 control-label">Password : </label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password1" name="pass1" value="<%= userPwd%>">
        </div>
    </div>
    
     <div class="form-group">
        <label for="password2" class="col-sm-2 control-label">Pass Confirm : </label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password2" name="pass2" value="<%= userPwd%>">
        </div>
    </div>
    
     <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Name : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" value="<%= userName %>" readonly>
        </div>
    </div>
    
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">Phone : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="mobile" value="<%= userPhone %>" maxlength="11">
        </div>
    </div>

    <div class="form-group">
        <label for="optGender" class="col-sm-2 control-label">Gender : </label>
        <div class="col-sm-10">

            <label class="radio-inline">
                <input type="radio" name="gender" id="optGenderWomen" value="F"<%if(userGender.equals("F")){%>checked<%}%>>
              Female
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" id="optGenderMan" value="M"<%if(userGender.equals("M")){%>checked<%}%>>
              Male
            </label>

        </div>
    </div>

    <div class="form-group">
        <label for="txtBirth" class="col-sm-2 control-label">BirthDate : </label>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-3">
                    <select name="year" id="dobMonth" class="form-control" style="width:100px;">
                       <option value="0" selected="1">Year</option>
<%
   for(int i = 2015; i >= 1901; i--){
%>
                       <option value="<%= i %>"><%= i %>��</option>
<%
   }
%>
                    </select>
                </div>
                <div class="col-sm-3">
                    <select name="month" id="dobMonth" class="form-control" style="width:100px;">
                        <option value="0" selected="1">Month</option><option value="01">1��</option><option value="02">2��</option><option value="03">3��</option><option value="04">
                     4��</option><option value="05">5��</option><option value="06">6��</option><option value="07">7��</option><option value="08">8��</option><option value="09">
                     9��</option><option value="10">10��</option><option value="11">11��</option><option value="12">12��</option>
                    </select>
                </div>
                <div class="col-sm-3">
                    <select name="day" id="dobday" class="form-control" style="width:100px;">
                       <option value="0" selected="1">day</option><option value="01">1��</option><option value="02">2��</option><option value="03">3��</option><option value="04">4��</option><option value="05">5��</option><option value="06">6��</option><option value="07">7��</option><option value="08">8��</option><option value="09">9��</option><option value="10">10��</option><option value="11">11��</option><option value="12">12��</option><option value="13">13��</option><option value="14">14��</option><option value="15">15��</option><option value="16">16��</option><option value="17">17��</option><option value="18">18��</option><option value="19">19��</option><option value="20">20��</option><option value="21">21��</option><option value="22">22��</option><option value="23">23��</option><option value="24">24��</option><option value="25">25��</option><option value="26">26��</option><option value="27">27��</option><option value="28">28��</option><option value="29">29��</option><option value="30">30��</option><option value="31">31��</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
   
   <div class="form-group">
        <label for="question" class="col-sm-2 control-label">Question : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="question" name="question" value="<%=userQuestion %>">
        </div>
    </div>
   
   <div class="form-group">
        <label for="answer" class="col-sm-2 control-label">Answer : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="answer" name="answer" value="<%=userAnswer %>">
        </div>
    </div>
    
    <div class="form-group">
      <label for="zipcode1" class="col-sm-2 control-label">Postcode :</label>
          <INPUT type="text" name="zipCode1" class="form-control zip1" id="zipCode1" size="5" value="<%=userPostCode1 %>" readonly>
         <INPUT type="text" name="zipCode2" class="form-control zip1" id="zipCode2" size="5" value="<%=userPostCode2 %>" readonly>
        
        <INPUT type="button" value="Search" class="form-control zip1" style="cursor:pointer" id="zipSearch" onclick="zipcodeBtn()">
    </div>
    
     <div class="form-group">
     <label for="addr1" class="col-sm-2 control-label"></label>
         <INPUT type="text" name="addr1"  size="40" class="form-control zip2" value="<%=userAddr1 %>" readonly>
     </div>
     <div class="form-group">
     <label for="addr2" class="col-sm-2 control-label"></label>
         <INPUT type="text" name="addr2" class="form-control zip2" size="40" value="<%=userAddr2 %>">
    </div>
</div>
<div class="form-horizontal form-horizontal1" role="form">
      <div class="col-md-12">
      <H4>���� ����</H4>
      <BR><BR><BR>
   </div>
    <div class="form-group">
        <label for="image" class="col-sm-2 control-label">Image : </label>
        <div class="col-sm-10">
          <input id="image" type="file" class="input_file" name="image" onchange="InputImage()"  >
          <span id="imagePreview" ><img src ="<%= image%>" width="150" height="180"></span>
          
       </div>
    </div>
    <div class="form-group">
        <label for="skinType" class="col-sm-2 control-label">SkinType : </label>
        <div class="col-sm-10">
            <select name="skinType" id="skinType" class="form-control">
                <option value="001"<%if(userSkinType.equals("001")){%>selected<%}%>>�Ǽ�</option>
                <option value="002"<%if(userSkinType.equals("002")){%>selected<%}%>>����</option>
                <option value="003"<%if(userSkinType.equals("003")){%>selected<%}%>>�߼�</option>
                <option value="004"<%if(userSkinType.equals("004")){%>selected<%}%>>���ռ�</option>
            </select>
        </div>
    </div>
    
    <div class="form-group">
        <label for="skintone" class="col-sm-2 control-label">SkinTone : </label>
        <div class="col-sm-10">
            <select name="skinTone" id="skinTone" class="form-control">
                <option value="13"<%if(userSkinTone.equals("13")){%>selected<%}%>>13ȣ</option>
                <option value="21"<%if(userSkinTone.equals("21")){%>selected<%}%>>21ȣ</option>
                <option value="23"<%if(userSkinTone.equals("23")){%>selected<%}%>>23ȣ</option>
            </select>
        </div>
    </div>
 
    <div class="form-group">
        <label for="skintrouble" class="col-sm-2 control-label">Skin Trouble : </label>
        <div class="col-sm-10 checks">
                  <input type="checkbox" name="skinProblem" value="001" >
              ����
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="002">
              ��������
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="003">
              �ָ�����
            </label>
        </div>
        <label for="skintrouble" class="col-sm-2 control-label"> </label>
        <div class="col-sm-10 checks">
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="004">
              �Ǻι̹�
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="005">
              �Ǻκ���
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="006">
              ����
            </label>
        </div>
    </div>
    
    <div class="form-group">
        <button type="button" class="btn pull-right" onclick="cancelBtn()">Cancel</button>
      <INPUT type="button" value="����" id="modifyButton" style="cursor:pointer" class="btn pull-right" onclick="joinBtn()">
   </div>
</form>
</div>   
</CENTER> 
</body>
</html>