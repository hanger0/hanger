<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" />

<% 
   if(inputTable != null && inputTable.size() != 0)
   {
      ArrayList uploadFileList = (ArrayList)inputTable.get("uploadFile");
      Hashtable uploadTable = (Hashtable)uploadFileList.get(0);
      String path = (String)uploadTable.get("savePath");
      //System.out.println(path);	
   }
%>

<SCRIPT type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></SCRIPT>
<SCRIPT type="text/JavaScript" src="${pageContext.request.contextPath}/js/join.js"></SCRIPT>

<head>
<title>Join!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" media="all" href="/css/niceforms-default.css">
<STYLE>
.button{
   background: #167ac6;
   border-bottom: transparent 1px solid;
   border-bottom-color: #167ac6;
   border-left: transparent 1px solid;
   border-left-color: #167ac6;
   border-right: transparent 1px solid;
   border-right-color: #167ac6;
   border-top: transparent 1px solid;
   border-top-color: #167ac6;
   box-shadow: 1px 1px 2px #333;
   color: #fff;
   cursor : pointer;
   display: inline-block;
   font-family: arial, sans-serif;
   font-size: 11px;
   font-weight: bold;
   height: 20px;
   line-height: normal;
   margin: 0px;
   outline-color: invert;
   outline-style: none;
   outline-width: 0px;
   padding-bottom: 0px;
   padding-left: 10px;
   padding-right: 10px;
   padding-top: 0px;
   text-align: left;
   text-decoration: none;
   vertical-align: middle;
   white-space: nowrap;
}
.text{

   background: white;
   border-bottom: transparent 1px solid;
   border-bottom-color: #167ac6;
   border-left: transparent 1px solid;
   border-left-color: #167ac6;
   border-right: transparent 1px solid;
   border-right-color: #167ac6;
   border-top: transparent 1px solid;
   border-top-color: #167ac6;
   color: #167ac6;
   display: inline-block;
   font-family: arial, sans-serif;
   font-size: 11px;
   font-weight: bold;
   height: 20px;
   line-height: normal;
   margin: 0px;
   padding-bottom: 0px;
   padding-left: 10px;
   padding-right: 10px;
   padding-top: 0px;
   text-align: left;
   text-decoration: none;
   vertical-align: middle;
   white-space: nowrap;
}
</STYLE>
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
               alert("捞固瘤 颇老阑 诀肺靛 窍技夸"); 
               return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }

    }
            
            document.getElementById("imagePreview").src = document.getElementById("image").value;
})();


</script>
<SCRIPT>
function home()
{
  alert("${pageContext.request.contextPath}");
}
</SCRIPT>
</head>
<body>

<FORM id="joinForm" name="joinForm" action="/result.do" method="post" enctype="multipart/form-data">
<div id="container">
   <fieldset>
         <INPUT type="hidden" name="func" value="member_008">
         <INPUT type="hidden" name="picPath" value="">
         <INPUT type="hidden" name="picOrgName" value="">
         <INPUT type="hidden" name="picSaveName" value="">
         <INPUT type="hidden" name="picSize" value="">
         <INPUT type="hidden" name="checkId" value="">
       <legend>Personal Info</legend>
        <dl>
           <dt><label for="email">Email Address:</label></dt>
            <dd><INPUT class = "text" type="text" name="joinId" maxlength="20" id="email">
            <INPUT class = "button" type="button" value="Confirm" style="cursor:pointer" id="idCheckBtn"></dd>
         <!--<input type="text" name="email" id="email" size="32" maxlength="128" /></dd> ****盔夯***-->
        </dl>
      <dl>
         <dt><label for="email">Email Confirm:</label></dt>
         <dd>
            <B><SPAN id="idCheckMessage"></SPAN></B>
         </dd>
      </dl>
        <dl>
           <dt><label for="password">Password:</label></dt>
            <dd><input class = "text" type="password" name="pass1" id="password" size="32" maxlength="32" /></dd>
        </dl>
      <dl>
           <dt><label for="password">Pass Confirm:</label></dt>
            <dd><input class = "text" type="password" name="pass2" id="password" size="32" maxlength="32" /></dd>
        </dl>
       <dl>
           <dt><label for="email">Name:</label></dt>
            <dd><INPUT class = "text" type="text" name="name" maxlength="20"></dd>
        </dl>
    
        <dl>
           <dt><label for="dobMonth">Date of Birth:</label></dt>
            <dd>
         <select class = "text" name="year" id="dobYear" size="1"><option value="0" selected="1">Year</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option>
         </select>

         <select class = "text" name="month" id="dobMonth" size="1"><option value="0" selected="1">Month</option><option value="01">1岿</option><option value="02">2岿</option><option value="03">3岿</option><option value="04">4岿</option><option value="05">5岿</option><option value="06">6岿</option><option value="07">7岿</option><option value="08">8岿</option><option value="09">9岿</option><option value="10">10岿</option><option value="11">11岿</option><option value="12">12岿</option></select>

         <select class = "text" name="day" id="dobDay" size="1"><option value="0" selected="1">day</option><option value="01">1老</option><option value="02">2老</option><option value="03">3老</option><option value="04">4老</option><option value="05">5老</option><option value="06">6老</option><option value="07">7老</option><option value="08">8老</option><option value="09">9老</option><option value="10">10老</option><option value="11">11老</option><option value="12">12老</option><option value="13">13老</option><option value="14">14老</option><option value="15">15老</option><option value="16">16老</option><option value="17">17老</option><option value="18">18老</option><option value="19">19老</option><option value="20">20老</option><option value="21">21老</option><option value="22">22老</option><option value="23">23老</option><option value="24">24老</option><option value="25">25老</option><option value="26">26老</option><option value="27">27老</option><option value="28">28老</option><option value="29">29老</option><option value="30">30老</option><option value="31">31老</option></select>         
            </dd>
        </dl>
      <dl>
         <dt><label for="color">Phone Num:</label></dt>
         <dd>
            <INPUT class = "text" type="text" name="mobile" maxlength="11" size="13">
         </dd>
      </dl>
      <dl>
         <dt><label for="color">Question:</label></dt>
         <dd>
            <INPUT class = "text" type="text" name="question" maxlength="20"></TD>
         </dd>
      </dl>
      <dl>
         <dt><label for="color">Answer:</label></dt>
         <dd>
            <INPUT class = "text" type="text" name="answer" maxlength="20"></TD>
         </dd>
      </dl>
      <dl>
      
           <dt><label for="color">Gender:</label></dt>
            <dd>
               <input  type="radio" name="gender" id="colorBlue" value="F" /><label for="colorRed" class="opt">Female</label>
                <input  type="radio" name="gender" id="colorRed" value="M" /><label for="colorBlue" class="opt">Male</label>
            </dd>
        </dl>
      <dl>
         <dt><label for="color">Postcode:</label></dt>
         <dd>
            <INPUT class = "text"  type="text" name="zipCode1" class="searchZipClass" size="5" readonly>
             <INPUT  class = "text" type="text" name="zipCode2" class="searchZipClass" size="5" readonly>
               <INPUT  class = "button" type="button" value="快祈锅龋八祸" class="searchZipClass" style="cursor:pointer" onclick="zipcodeBtn()">
               <BR>
               <INPUT  class = "text" type="text" name="addr1"  size="40" class="searchZipClass" readonly> (青沥备开) <BR>
            
               <INPUT  class = "text" type="text" name="addr2" size="40"> (锅瘤 棺 惑技林家)
         </dd>
      </dl>
   </fieldset>
    <fieldset>
   <legend>UpLoad File</legend>
        <dl>
           <dt><label for="test">Uploaded Image:</label></dt>
         <dd><input class = "button" id="image" name = "image" type="file" onchange="InputImage()">
         <div id="imagePreview"></div>
         </dd>
        </dl>
        </fieldset>
      <fieldset class="action">
         <!--<input type="submit" name="submit" id="joinBtn" value="Submit"/>
         <button type="button" name="test" id="cancelBtn">Cancel</button> 泪瘪林籍-->
         <INPUT class = "button" type="Submit" value="雀盔啊涝"  name ="Submit" id="joinButton" style="cursor:pointer" onclick="joinBtn()">
            
         <INPUT class = "button" type="button" value="秒家" name = "cancelBtn" style="cursor:pointer" name="test" onClick = "home()">
      </fieldset>
</div>
</form>
</body>
</html>