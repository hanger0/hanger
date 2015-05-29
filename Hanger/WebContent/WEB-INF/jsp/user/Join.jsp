<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Join</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" media="screen" href="/css/bootstrap/bootstrap.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="/js/javascripts/jquery-1.11.3.min.js" type="text/javascript"></script>
		<!-- 기존 js 파일들-->
		<script src="/js/user/join.js" type="text/javascript"></script>
		<script src="/js/common/common.js" type="text/javascript"></script>
		
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
               alert("이미지 파일을 업로드 하세요"); 
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
	
<form role="form" id="joinForm" name="joinForm" method="post" action="/joinResult.hang" enctype="multipart/form-data">
	<INPUT type="hidden" name="func" value="member_008">
    <INPUT type="hidden" name="picPath" value="">
    <INPUT type="hidden" name="picOrgName" value="">
    <INPUT type="hidden" name="picSaveName" value="">
    <INPUT type="hidden" name="picSize" value="">
    <INPUT type="hidden" name="checkId" value="">
	<div class="col-md-12">
		<h1>Join</h1>
		<H4>필수 정보</H4>
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
            <input type="text" class="form-control" id="pass1" name="pass1" placeholder="Password">
        </div>
    </div>
    
     <div class="form-group">
        <label for="password2" class="col-sm-2 control-label">Pass Confirm : </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="pass2" name="pass2" placeholder="Password Confirm">
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
            <input type="text" class="form-control" id="phone" name="mobile" placeholder="Phone Number">
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
                        <option value="0" selected="1">Year</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option>
                    </select>
                </div>
                <div class="col-sm-3">
                    <select name="month" id="dobMonth" class="form-control" style="width:100px;">
                        <option value="0" selected="1">Month</option><option value="01">1월</option><option value="02">2월</option><option value="03">3월</option><option value="04">
		         		4월</option><option value="05">5월</option><option value="06">6월</option><option value="07">7월</option><option value="08">8월</option><option value="09">
		         		9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>
                    </select>
                </div>
                <div class="col-sm-3">
                    <select name="day" id="dobday" class="form-control" style="width:100px;">
                       <option value="0" selected="1">day</option><option value="01">1일</option><option value="02">2일</option><option value="03">3일</option><option value="04">4일</option><option value="05">5일</option><option value="06">6일</option><option value="07">7일</option><option value="08">8일</option><option value="09">9일</option><option value="10">10일</option><option value="11">11일</option><option value="12">12일</option><option value="13">13일</option><option value="14">14일</option><option value="15">15일</option><option value="16">16일</option><option value="17">17일</option><option value="18">18일</option><option value="19">19일</option><option value="20">20일</option><option value="21">21일</option><option value="22">22일</option><option value="23">23일</option><option value="24">24일</option><option value="25">25일</option><option value="26">26일</option><option value="27">27일</option><option value="28">28일</option><option value="29">29일</option><option value="30">30일</option><option value="31">31일</option>
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
   	    <INPUT type="text" name="zipCode1" class="form-control zip1" id="zipCode1" size="5" readonly>
      	<INPUT type="text" name="zipCode2" class="form-control zip1" size="5" readonly>
        <INPUT type="button" value="Search" class="form-control zip1" style="cursor:pointer" id="zipSearch"onclick="zipcodeBtn()">
    </div>
    
     <div class="form-group">
     <label for="addr1" class="col-sm-2 control-label"></label>
         <INPUT type="text" name="addr1"  size="40" class="form-control zip2" readonly>
     </div>
     <div class="form-group">
     <label for="addr2" class="col-sm-2 control-label"></label>
         <INPUT type="text" name="addr2" class="form-control zip2" size="40">
    </div>
</div>
<div class="form-horizontal form-horizontal1" role="form">
   	<div class="col-md-12">
		<H4>선택 정보</H4>
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
        <label for="skintype" class="col-sm-2 control-label">SkinType : </label>
        <div class="col-sm-10">
            <select name="ctl00$MainContent$lstCountry" id="skintype" class="form-control">
                <option value="1">건성</option>
                <option value="2">지성</option>
                <option value="3">중성</option>
                <option value="4">복합성</option>

            </select>
        </div>
    </div>
    
    <div class="form-group">
        <label for="skintone" class="col-sm-2 control-label">SkinTone : </label>
        <div class="col-sm-10">
            <select name="ctl00$MainContent$lstCountry" id="skintone" class="form-control">
                <option value="1">흰색</option>
                <option value="2">황색</option>
                <option value="3">검정색</option>
                <option value="4">태닝한피부</option>
            </select>
        </div>
    </div>
    
    <div class="form-group">
        <label for="skintrouble" class="col-sm-2 control-label">Skin Trouble : </label>
        <div class="col-sm-10 checks">

            <label class="checkbox-inline">
                <input type="checkbox" name="optGender" id="optGenderMan" value="F">
     			피지
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="optGender" id="optGenderWomen" value="M">
  				각질제거
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="optGender" id="optGenderWomen" value="M">
  				주름개선
            </label>
        </div>
        <label for="skintrouble" class="col-sm-2 control-label"> </label>
        <div class="col-sm-10 checks">
         
            <label class="checkbox-inline">
                <input type="checkbox" name="optGender" id="optGenderWomen" value="M">
  				피부미백
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="optGender" id="optGenderWomen" value="M">
  				피부보습
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="optGender" id="optGenderWomen" value="M">
  				보습
            </label>
        </div>
    </div>
    
    <div class="form-group">
        <button type="button" class="btn pull-right">Cancel</button>
		<INPUT type="button" value="Join" id="joinButton" style="cursor:pointer" class="btn pull-right" onclick="joinBtn()">
	</div>
</form>
</div>	
</CENTER> 
</body>
</html>




