<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hanger.user.vo.*"%>
<%
	String myName = "";
	if (session != null && session.getAttribute("loginYn") != null
			&& ((String) session.getAttribute("loginYn")).equals("Y")) {
		myName = (String) session.getAttribute("myUserName");
	}
	
	ArrayList<UserVo> followerList = (ArrayList<UserVo>)request.getAttribute("followerList");
	ArrayList<UserVo> followingList = (ArrayList<UserVo>)request.getAttribute("followingList");
	ArrayList<UserVo> userList = (ArrayList<UserVo>)request.getAttribute("userList");
	
	String qt = "";
	if((String)request.getAttribute("qt") != null && ((String)request.getAttribute("qt")).length() > 0){
		qt = (String)request.getAttribute("qt");
	}
%>

<script type="text/javascript" src="js/common/common.js"></SCRIPT>
<SCRIPT>
   function searchLoock() {
      location.href = "/userSearch.hang?qt=<%=qt%>";
   }
</SCRIPT>
<SCRIPT>
$(function() {
	// 알림을 뿌리기 위한 Ajax
	$.ajax({
		type : "POST",
		url : "/searchNotification.hang",
		dataType : "text",
		success : function(text){
			var resultText = trim(text);
			var resultMessage = "<FONT color='blue' >" + resultText + "</FONT>";
			$('#notification').empty();
			$('#notification').append(resultMessage);
		}
	});
	
	$("#searchText").keyup(function(key) {
		var ftext = trim($("#searchText").val());
		if (ftext != null) {
			$.ajax({
				type : "POST",
				url : "/userMiniSearch.hang",
				dataType : "text",
				data : "searchText=" + ftext,
				success : function(text) {
				   var supertext = trim(text);
				   var resultMessage = "<FONT color='blue' >"
				         + supertext + "</FONT>";
				   $('#friendSearchMessage').empty();
				   $('#friendSearchMessage').append(resultMessage);
				},
				error : function(request, status, error) {
				   alert("code:" + request.status + "\n"
				         + "message:" + request.responseText
				         + "\n" + "error:" + error);
				}
			});
		} else {
		   alert("검색어를 입력해주세요");
		   false;
		}
	});
});
</SCRIPT>
<style>
/* 블로그메뉴 */
div, ul, li {
   margin: 0;
   padding: 0;
}

#blogMenu {
   float: left;
   width: 50%;
   heigth: 200px;
   background-color: #5c5c5c;
}

#blogMenu ul li {
   float: left;
   list-style-type: none;
}

#blogMenu a {
   height: 16px;
   color: #f1f1f1;
   font-family: arial;
   font-size: 12px;
   padding: 0 10px 0 10px;
   text-decoration: none;
}

#blogMenu a:hover {
   color: #D4F4FA;
   border-bottom: 3px solid #FAED7D;
}

#blogMenu ul ul {
   display: none;
   position: absolute;
   background-color: #5c5c5c;
}

#blogMenu ul li:hover ul {
   display: block;
}

#blogMenu ul ul li {
   float: left;
   display: inline;
   width: 150px;
   height: 40px;
}
</style>
<header id="header">
   <!--기본페이지에는 이거보임-->
   <div style="width: 100%;" class="hidden-xs navbar navbar-default navbar-fixed-top navbar HOME" role="navigation">

      <div class="navbar-header" style="margin-left:11%;margin-top:0.5%;background-color:yellow">
         <a href = "/">
         	<img src="images/14.jpg" id="brand-icon" width = "80px;" height = "40px"/>
		</a>
      </div>
	
	<div class = "search" style = "background-color:yellow;margin-left:40%">
      <form class="navbar-form navbar-left"  role="search" method="get" action="/itemSearch.hang" >
         <div>
            <input type="text" name="keyWord" class="form-control" placeholder="Search" style="width: 200px">
            <button type="submit" class="btn btn-default">검색</button>
         </div>
      </form>
     </div>
      
      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav navbar-right unpa-navbar-right" style="margin-right: 8%; width: 20%">
            <li></li>
            <%
               if (session != null && session.getAttribute("loginYn") != null
                     && ((String) session.getAttribute("loginYn")).equals("Y")
                     && session.getAttribute("adminYn") != null
                     && ((String) session.getAttribute("adminYn")).equals("N")) {
            %>
            <!-- 마이페이지 시작 -->
            <li class="headli">
            	<a href="/myPage.hang">
            		<span class="glyphicon glyphicon-user" style="font-size: 24px;"></span>
            	</a>
            </li>
            <!-- 마이페이지 끝 -->
           <!-- 알람시작 -->
            <li class="headli">
            	<ul class="nav">
                  <li class="dropdown headli">
                  <span class="dropdown-toggle"  data-toggle="dropdown" aria-expanded="true" style="width: 50; height: 54">
                     <span class="glyphicon glyphicon-bullhorn" style="font-size: 24px; margin-top: 14px; margin-left: 7px; cursor: pointer;"></span>
                  </span>
                     <ul class="dropdown-menu" role="menu">
                        <form class="navbar-form navbar-left" role="search" id="searchFriendForm" name="searchFriendForm" style="width: 290px">
	                        <div id="notification"></div>
                        </form>
                        <div class="message" width="100%">
							<div style="margin-bottom: -20px">
                            	<button style="width: 100%;" class="btn btn-default notificationLoog">더보기</button>
                       		</div>
                        </div>
                     </ul>
                  </li>
               </ul>
            </li>
            <!-- 알람 끝 -->
			<!-- 카트 시작 -->
            <li class="headli">
            	<a href="/cart.hang">
            		<span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px"></span>
            	</a>
            </li>
			<!-- 카트 끝 -->
			<!-- 친구 검색 시작 -->
            <li>
               <ul class="nav">
                  <li class="dropdown headli">
                  <span class="dropdown-toggle"  data-toggle="dropdown" aria-expanded="true" style="width: 50; height: 54">
                     <span class="glyphicon glyphicon-search" style="font-size: 24px; margin-top: 14px; margin-left: 7px; cursor: pointer;"></span>
                  </span>
                     <ul class="dropdown-menu" role="menu">
                        <form class="navbar-form navbar-left" role="search" id="searchFriendForm" name="searchFriendForm" style="width: 290px">
                           <div class="form-group">
                              <input type="text" class="form-control" id="searchText" name="searchText" placeholder="친구검색">
                           </div>
                        </form>
                        <div class="user searchFriend" id="friendSearchMessage"></div>
                        <div class="message" width="100%">
							<div style="margin-bottom:-20px">
								<button style="width:100%;" class="btn btn-default" onclick="searchLoock()">
										더보기
								</button>
							</div>	
						</div>
                     </ul>
                  </li>
               </ul>
            </li>
            <!-- 친구 검색 끝 -->
			<script>
				function logout() {
					location.href = "/logout.hang";
				}
				function upDateUser() {
					location.href = "/updateUser.hang"
				}
			</script>
			
			<!-- 로그아웃 -->
            <li class="logoutMenu">
            	<a href="#">
            	<span class="dropdown-toggle"  data-toggle="dropdown" aria-expanded="true" style="width:50px; height: 54px">
            		<span class="glyphicon glyphicon-menu-right" style="font-size: 24px"></span>
            	</span>
            		<ul class="dropdown-menu" role="menu" style = "width:30px;height:125px;">
                          <div class="logoutGroup" style = "width:100px;height:100px;display:table;margin-left:auto;margin-right:auto">
                          <p>
                            <font size = "2" >고객 센터</font><p>
                            <div class = "upDateUser" style = "width:100px;" onClick = "upDateUser()">
                            	<font size = "2">정보 수정</font><p>
                            </div>
                            <font size = "2">설정</font><p>
                            <hr style = "margin-top:-5px;margin-bottom:5px;">
                            	<div class = "logout"  style = "width:100px" onClick = "logout()">
                            		<font size = "2" >로그아웃</font>
                          		</div>
                          </div>
                     </ul>
            	</a>
            </li>
            <!-- 로그아웃 끝 -->
            <%
               } else if (session.getAttribute("adminYn") != null
                     && ((String) session.getAttribute("adminYn")).equals("Y")) {
            %>
            <li class="headli" style="margin-left: 35%; margin-right: 5%">
               <a href="/managerPageMain.hang">
               		<span class="glyphicon glyphicon-plus" style="font-size: 18px;"></span>
            	</a>
            </li>

            <li class="headli">
            	<a href="/logout.hang">
            		<span class="glyphicon glyphicon-remove" style="font-size: 18px"></span>
            	</a>
            </li>
            <%
               } else {
            %>
            <li style="margin-left: 30%; margin-right: 5%"><a
               href="/login.hang" class="remove-border" style="width: 75px">로그인</a>
            </li>
            <li><a href="/join.hang" class="remove-border">회원가입</a></li>
            <%
               }
            %>
         </ul>
      </div>
   </div>
    <div class = "menu"  id = "menu" style = "display:none;background-color:yellow;width:100px;height:100px;"></div>
   <div
      class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      style="width: 100%; position: fixed; z-index: 1000; height: 30px; background-color: yellow">
      <!-- 띄어쓰기 -->
      <p>
         <br> <br>
      <p>
      <div id="blogMenu" style="height: 35px; float: left">
         <p style="margin-top: -0.5%">
         <ul>
            <li style="margin-left: 23%">
            	<a href = "#">
            		<font size="4"><b>SHOP</b></font>
               	</a>
               <ul>
                  <br>
                  <li><a href="/itemSearch.hang?cateCode=C1001"><font size = "3">· 메이크업</font></a></li>
                  <li><a href="/itemSearch.hang?cateCode=C1002"><font size = "3">· 스킨케어</font></a></li>
                  <li><a href="/itemSearch.hang?cateCode=C1003"><font size = "3">· 헤어 & 바디</font></a></li>
                  <li><a href="/itemSearch.hang?cateCode=C1004"><font size = "3">· 향수</font></a></li>
                  <li><a href="/itemSearch.hang?cateCode=C1005"><font size = "3">· 도구기기</font></a></li>
                  <p>
                  <li><a href="/itemSearch.hang?cateCode=C2001">&nbsp;&nbsp;&nbsp;페이스 메이크업</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2004">&nbsp;&nbsp;&nbsp;클렌징</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2008">&nbsp;&nbsp;&nbsp;헤어</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2013">&nbsp;&nbsp;&nbsp;여성향수</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2016">&nbsp;&nbsp;&nbsp;뷰티기기</a></li>
                  <p>
                  <li><a href="/itemSearch.hang?cateCode=C2002">&nbsp;&nbsp;&nbsp;아이 메이크업</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2005">&nbsp;&nbsp;&nbsp;모이스쳐</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2009">&nbsp;&nbsp;&nbsp;바디</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2014">&nbsp;&nbsp;&nbsp;남성향수</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2017">&nbsp;&nbsp;&nbsp;바디기기</a></li>
                  <p>
                  <li><a href="/itemSearch.hang?cateCode=C2003">&nbsp;&nbsp;&nbsp;립 메이크업</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2006">&nbsp;&nbsp;&nbsp;팩 & 패치</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2010">&nbsp;&nbsp;&nbsp;핸드 & 풋</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2015">&nbsp;&nbsp;&nbsp;캔들 & 디퓨저</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2018">&nbsp;&nbsp;&nbsp;도구</a></li>
                  <p>
                  <li></li>
                  <li><a href="/itemSearch.hang?cateCode=C2007">&nbsp;&nbsp;&nbsp;선케어</a></li>
                  <li><a href="/itemSearch.hang?cateCode=C2011">&nbsp;&nbsp;&nbsp;다이어트</a></li>
                  <li></li>
                  <li></li>
                  <p>
                  <li></li>
                  <li></li>
                  <li><a href="/itemSearch.hang?cateCode=C2012">&nbsp;&nbsp;&nbsp;생활뷰티</a></li>
                  <li></li>
                  <li></li>
                  <p>
               </ul>
               
            <li class="brand" style="margin-left: 10%">
            	<a href="/brand.hang">
            		<font size="4"><b>BRANDS</b></font>
            	</a>

               <ul align="center">
                  <BR>
                  <li style="width: 50px;"><a href="#">A</a></li>
                  <li style="width: 50px;"><a href="#">B</a></li>
                  <li style="width: 50px;"><a href="#">C</a></li>
                  <li style="width: 50px;"><a href="#">D</a></li>
                  <li style="width: 50px;"><a href="#">E</a></li>
                  <li style="width: 50px;"><a href="#">F</a></li>
                  <li style="width: 50px;"><a href="#">G</a></li>
                  <li style="width: 50px;"><a href="#">H</a></li>
                  <li style="width: 50px;"><a href="#">I</a></li>
                  <li style="width: 50px;"><a href="#">J</a></li>

                  <p>
                  <li style="width: 50px;"><a href="#">K</a></li>
                  <li style="width: 50px;"><a href="#">L</a></li>
                  <li style="width: 50px;"><a href="#">M</a></li>
                  <li style="width: 50px;"><a href="#">N</a></li>
                  <li style="width: 50px;"><a href="#">O</a></li>
                  <li style="width: 50px;"><a href="#">P</a></li>
                  <li style="width: 50px;"><a href="#">Q</a></li>
                  <li style="width: 50px;"><a href="#">R</a></li>
                  <li style="width: 50px;"><a href="#">S</a></li>
                  <li style="width: 50px;"><a href="#">T</a></li>

                  <p>
                  <li style="width: 50px;"><a href="#">U</a></li>
                  <li style="width: 50px;"><a href="#">V</a></li>
                  <li style="width: 50px;"><a href="#">W</a></li>
                  <li style="width: 50px;"><a href="#">X</a></li>
                  <li style="width: 50px;"><a href="#">Y</a></li>
                  <li style="width: 50px;"><a href="#">Z</a></li>

                  <p>
               </ul></li>
            <li style="margin-left: 10%"><a href="#"><font size="4"><b>TYPES</b></font></a></li>
         </ul>
      </div>

      <div id="blogMenu"
         style="height: 35px; float: right; background-color: #5A8DF3">
         <p style="margin-top: -0.5%">
         <ul>
            <li style="margin-left: 20%">
            	<a href="/reviewList.hang">
            		<font size="4"><b>REVIEWS</b></font>
            	</a>
            </li>
            <li class="brand" style="margin-left: 10%">
            	<a href="/tipList.hang">
            		<font size="4"><b>TIPS</b></font>
            	</a>
            </li>
            <li style="margin-left: 10%">
            	<a href="/hangOutList.hang">
            		<font size="4"><b>HANGOUT</b></font>
            	</a>
            </li>
         </ul>
      </div>
   </div>
  
</header>