<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
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

</script>
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
	
<form role="form" id="form" name="form" method="post" action="/joinResult.hang" enctype="multipart/form-data">
    <INPUT type="hidden" name="picPath" value="" />
    <INPUT type="hidden" name="picOrgName" value="" />
    <INPUT type="hidden" name="picSaveName" value="" />
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
            <input type="text" class="form-control" id="Email" name="joinId" placeholder="Email Address">
        </div>
    </div>
    
    <div class="form-group">
		<label for="idCheckMessage" class="col-sm-2 control-label">Email Confirm:</label></dt>
    	<div class="col-sm-10">
            <B><SPAN id="idCheckMessage"></SPAN></B>
        </div>
	</div>

    <div class="form-group">
        <label for="password1" class="col-sm-2 control-label">Password : </label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password1" name="pass1" placeholder="Password">
        </div>
    </div>
    
     <div class="form-group">
        <label for="password2" class="col-sm-2 control-label">Pass Confirm : </label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password2" name="pass2" placeholder="Password Confirm">
        </div>
    </div>
    
     <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Name : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" placeholder="Name">
        </div>
    </div>
    
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">Phone : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="mobile" placeholder="Phone Number" maxlength="11">
        </div>
    </div>
 
    <div class="form-group">
        <label for="optGender" class="col-sm-2 control-label">Gender : </label>
        <div class="col-sm-10">

            <label class="radio-inline">
                <input type="radio" name="gender" id="optGenderMan" value="F">
     			Female
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" id="optGenderWomen" value="M">
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
            <input type="text" class="form-control" id="question" name="question" placeholder="Question">
        </div>
    </div>
	
	<div class="form-group">
        <label for="answer" class="col-sm-2 control-label">Answer : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="answer" name="answer" placeholder="Answer">
        </div>
    </div>
    
    <div class="form-group">
		<label for="zipcode1" class="col-sm-2 control-label">Postcode :</label>
   	    <INPUT type="text" name="zipCode1" class="form-control zip1 zipcode" id="zipCode1" size="5" readonly>
      	<INPUT type="text" name="zipCode2" class="form-control zip1 zipcode" size="5" readonly>
        <INPUT type="button" value="Search" class="form-control zip1 zipcode" style="cursor:pointer" id="zipSearch">
    </div>
    
     <div class="form-group">
     <label for="addr1" class="col-sm-2 control-label"></label>
         <INPUT type="text" name="addr1"  size="40" class="form-control zip2 zipcode" readonly>
     </div>
     <div class="form-group">
     <label for="addr2" class="col-sm-2 control-label"></label>
         <INPUT type="text" name="addr2" class="form-control zip2" size="40">
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
    		<input id="image" type="file" class="input_file" name="image"onchange="InputImage()">
    		<div id="imagePreview"></div>
    	</div>
    </div>
    <div class="form-group">
        <label for="skinType" class="col-sm-2 control-label">SkinType : </label>
        <div class="col-sm-10">
            <select name="skinType" id="skinType" class="form-control">
                <option value="000">���þ���</option>
                <option value="F2003">�Ǽ�</option>
                <option value="F2002">����</option>
                <option value="F2001">��/���ռ�</option>
            </select>
        </div>
    </div>
    
    <div class="form-group">
        <label for="skintone" class="col-sm-2 control-label">SkinTone : </label>
        <div class="col-sm-10">
            <select name="skinTone" id="skinTone" class="form-control">
            	<option value="00">���þ���</option>
                <option value="13ȣ">13ȣ</option>
                <option value="21ȣ">21ȣ</option>
                <option value="23ȣ">23ȣ</option>
            </select>
        </div>
    </div>
    
    <div class="form-group">
        <label for="skintrouble" class="col-sm-2 control-label">Skin Trouble : </label>
        <div class="col-sm-10 checks">
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="F2004">
     			���帧
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="F2005">
  				�����
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="F2006">
  				���
            </label>
        </div>
        <label for="skintrouble" class="col-sm-2 control-label"> </label>
        <div class="col-sm-10 checks">
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="F2007">
  				��Ƽ����¡
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="F2008">
  				�ָ�
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="skinProblem" value="F2009">
  				ȫ��
            </label>
        </div>
    </div>
    
    <div class="form-group">
        <button type="button" class="btn pull-right" onclick="cancelBtn()">Cancel</button>
		<INPUT type="button" value="Join" id="joinButton" style="cursor:pointer" class="btn pull-right" onclick="joinBtn()">
	</div>
</form>
</div>	
</CENTER> 
</body>
</html>




