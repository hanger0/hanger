<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.user.vo.*" %>
<%
	ArrayList<UserVo> followerList = (ArrayList<UserVo>)request.getAttribute("followerList");
	ArrayList<UserVo> followingList = (ArrayList<UserVo>)request.getAttribute("followingList");
	ArrayList<UserVo> userList = (ArrayList<UserVo>)request.getAttribute("userList");
	
	String qt = "";
	if((String)request.getAttribute("qt") != null && ((String)request.getAttribute("qt")).length() > 0){
		qt = (String)request.getAttribute("qt");
	}
%>
<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet" href="css/Follow/follow.css" />

<STYLE>
.reviewhead2
{
   margin-top:3px;
}
.infos
{
   width:150px;
   margin:3px 0px 3px;
}
.img-circle
{
   width:100%;
   height:80%;
}
.row
{
   width:100%;
   background-color:white;
   display:table;
   margin-left:auto;
   margin-right:auto;
   margin-top:3px;
   
}
.follows
{
   margin-left:3px;
   margin-right:3px;
}
.title
{
   display:table;
   margin-left:auto;
   margin-right:auto;
   background-color:yellow;
}
</STYLE>
<script>
$(function(){
	function goFollowerList(){
		location.href="/relationFollowerSearch.hang";
	}
	function goFollowingList(){
		location.href="/relationFollowingSearch.hang";
	}
	function deleteFollowing(){
		var f = document.deleteFollowing;
		
		f.submit();
	}
	function insertFollower(){
		var f = document.insertFollower;

		f.submit();
	}
	function deleteFollower(){
		var f = document.deleteFollower;
		
		f.submit();
	}
	$('#insertSearch').click(function(){
		var f = document.insertSearch;
		
		var s = $('input:text[name=qt]').val();
		var i = $('input:hidden[name=insertQt]').val(s);
		
		f.submit();
	});
	$('#deleteSearch').click(function(){
		var f = document.deleteSearch;
		
		var s = $('input:text[name=qt]').val();
		var i = $('input:hidden[name=deleteQt]').val(s);
		
		f.submit();
	});
});
</script>
</head>
<body style="background-color: #EBEBEB">
   <div class="container" style="width:80%;margin-top:100px;">
      <!-- 팔로우 리뷰 작성 시작 -->
       <div class="thumbnail" style="width:100%;background-color:white;display:table;margin-left:auto;margin-right:auto">      
         <div class="col-sm-4 infos" style="width:15%;margin-left:5%">
            <img src="images/yebin.jpg" alt="예빈짜응" class="img-circle" style = "width:100px;height:100px;">
         </div>
         <div class="col-sm-4 infos" style="width:13%;height:100px;background-color:yellow">
            이름 : 예빈이
            <BR>날짜 : 2015.6.3
            <BR>피부타입 : 건성
         </div>
         <div class="col-sm-4 infos" style="width:50%;background-color:orange">
            <div style="width:100%;">
               <h5>네이처리퍼블릭</h3>
               <h3>존나 좋은 모공제거 코팩이다 헤헤헤헤</h3>
            </div>
         </div>
   </div>
         <div class="thumbnail" >
            <div class = "menubar" style = "width:100%;height:40px;">
            <ul class="nav nav-pills" style="display:table;margin-left:auto;margin-right:auto" align = "center">
               <li role="presentation" class="" style="width: 120px; height: 100px;">
                  <a href="MyReview.jsp">리뷰</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="MyWrite.jsp">팁</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="#">게시물</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="Flow.jsp">팔로우</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="OrderPage.jsp">모더</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="#">마일리지</a></li>
            </ul>
            </div>
         </div>

         <div class="thumbnail" style = "height:80px;">
            <form class="navbar-form navbar" style="width:100%;height:40px;" action="/userSearch.hang" method="post">
               <div class="form-group" style = "display:table;margin-left:auto;margin-right:auto;margin-top:8px;width:100%">
               <button type="button" class="btn btn-default" style = "margin-right:2%;" onclick="goFollowingList()">팔로잉</button>
               <button type="button" class="btn btn-default" style = "margin-right:23%;" onclick="goFollowerList()">팔로워</button>
                  <input type="text" class="form-control" placeholder="회원검색" name="qt" value="<%= qt %>">
               <button type="submit" class="btn btn-default" style = "margin-left:10px;">Submit</button>
               </div>
            </form>
            <p><br>
         </div>
         
       <div class = "thumbnail" style = "display:table;margin-left:auto;margin-right:auto">
       <div class="row unpa-card-row row-flex-height-md">
<%
	if(followingList != null){
%>
           <h4 class="titles" style = "margin-left:40px"><font size = "4"><b>마이 팔로잉</b></font></h4><br>
<%
		for (int i = 0; i < followingList.size(); i++) {
			UserVo user = followingList.get(i);
%>
            <div class="col-sm-3" style="display:table;">
               <div class="unpa-card user-card followable  followed" style = " width:170px;display:table;margin-left:auto;margin-right:auto;">
                  <!-- 클릭시 사용자 정보로 이동 -->
                  <a href="#">
                     <div class="unpa-user-labels"></div>
                     <div class="user-image" style="background-image: url(/images/omnia.jpg);"></div>
                     <div class="user-nickname"><%= user.getUserName() %></div>
                     <div class="user-skin-info">

                        <!-- 피부 건성인지 지성인지 -->
                        <div class="empty"><%= user.getUserSkinType() %></div>
                        <!-- 피부 몇호인지 ex 23호 -->
                        <div class="empty"><%= user.getUserSkinTone() %></div>
                     </div>
                     <div class="user-count-info">
                        <div>
                           <!--  팔로우 수 -->
                           <i class="ion-person"></i>팔로우 수 : <%= user.getFollowerCount() %>
                        </div>
                        <!--  글쓴 수 -->
                        <div>
                           <i class="ion-edit"></i>글쓴 수 : <%= user.getPotingCount() %>
                        </div>
                     </div>
                  </a>
                  <form id="deleteFollowing" name="deleteFollowing" action="/relationFollowingDelete.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
	                  <button class="user-follow-button followed" onClick="deleteFollowing()">
							팔로우 취소
	                  </button>
                  </form>
               </div>
            </div>
<%
		}
	}

	if(followerList != null){
%>
        <h4 class="titles" style = "margin-left:40px"><font size = "4"><b>마이 팔로워</b></font></h4><br>
<%
		for (int i = 0; i < followerList.size(); i++) {
			UserVo user = followerList.get(i);
%>
            <div class="col-sm-3" style="display:table;">
               <div class="unpa-card user-card followable  followed" style = " width:170px;display:table;margin-left:auto;margin-right:auto;">
                  <!-- 클릭시 사용자 정보로 이동 -->
                  <a href="#">
                     <div class="unpa-user-labels"></div>
                     <div class="user-image" style="background-image: url(/images/omnia.jpg);"></div>
                     <div class="user-nickname"><%= user.getUserName() %></div>
                     <div class="user-skin-info">

                        <!-- 피부 건성인지 지성인지 -->
                        <div class="empty"><%= user.getUserSkinType() %></div>
                        <!-- 피부 몇호인지 ex 23호 -->
                        <div class="empty"><%= user.getUserSkinTone() %></div>
                     </div>
                     <div class="user-count-info">
                        <div>
                           <!--  팔로우 수 -->
                           <i class="ion-person"></i>팔로우 수 : <%= user.getFollowerCount() %>
                        </div>
                        <!--  글쓴 수 -->
                        <div>
                           <i class="ion-edit"></i>글쓴 수 : <%= user.getPotingCount() %>
                        </div>
                     </div>
                  </a>
<%
				if(user.getRelationFollowing() != null){
%>
				<form id="deleteFollower" name="deleteFollower" action="/relationFollowerDelete.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
	                  <button class="user-follow-button followed" onClick="deleteFollower()">
	                     	팔로우 취소
	                  </button>
                </form>
<%
				} else {
%>
				<form id="insertFollower" name="insertFollower" action="/relationFollowerInsert.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
	                  <button class="user-follow-button followed" onClick="insertFollower()">
	                     	팔로우 맺기
	                  </button>
				</form>
<%
				}
%>
               </div>
            </div>
<%
		}
	}
	if(userList != null){
%>
        <h4 class="titles" style = "margin-left:40px"><font size = "4"><b>팔로워 검색</b></font></h4><br>
<%
		for (int i = 0; i < userList.size(); i++) {
			UserVo user = userList.get(i);
%>
            <div class="col-sm-3" style="display:table;">
               <div class="unpa-card user-card followable  followed" style = " width:170px;display:table;margin-left:auto;margin-right:auto;">
                  <!-- 클릭시 사용자 정보로 이동 -->
                  <a href="#">
                     <div class="unpa-user-labels"></div>
                     <div class="user-image" style="background-image: url(/images/omnia.jpg);"></div>
                     <div class="user-nickname"><%= user.getUserName() %></div>
                     <div class="user-skin-info">

                        <!-- 피부 건성인지 지성인지 -->
                        <div class="empty"><%= user.getUserSkinType() %></div>
                        <!-- 피부 몇호인지 ex 23호 -->
                        <div class="empty"><%= user.getUserSkinTone() %></div>
                     </div>
                     <div class="user-count-info">
                        <div>
                           <!--  팔로우 수 -->
                           <i class="ion-person"></i>팔로우 수 : <%= user.getFollowerCount() %>
                        </div>
                        <!--  글쓴 수 -->
                        <div>
                           <i class="ion-edit"></i>글쓴 수 : <%= user.getPotingCount() %>
                        </div>
                     </div>
                  </a>
<%
			if(user.getRelationFollowing() != null){
%>
				<form name="deleteSearch" action="/relationSearchDelete.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
				  	  <input type="hidden" name="deleteQt" />
	                  <button class="user-follow-button followed" onClick="deleteSearch()">
	                     	팔로우 취소
	                  </button>
                </form>
<%
			} else {
%>
				<form name="insertSearch" action="/relationSearchInsert.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
				  	  <input type="hidden" name="insertQt" />
	                  <button class="user-follow-button followed" onClick="insertSearch()">
	                     	팔로우 맺기
	                  </button>
                </form>
<%
			}
%>
               </div>
            </div>
<%
		}
	}
%>
            </div>
          </div>
       </div>  
      <!-- 팔로우 리뷰 작성 끝 -->
</CENTER>
</body>
</html>