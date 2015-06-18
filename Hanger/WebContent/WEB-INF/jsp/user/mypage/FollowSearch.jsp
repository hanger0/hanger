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
<link rel="stylesheet" href="css/Follow/follow.css" />

<script>
$(function(){
	$('#goFollowerList').click(function(){
		location.href="/relationFollowerSearch.hang";
	});
	$('#goFollowingList').click(function(){
		location.href="/relationFollowingSearch.hang";
	});
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
	$('.insertSearch').click(function(){
		var f = document.insertSearch;
		
		var s = $(this).attr("qt");
		$("input:hidden[name=insertQt]").attr("value", s);
		
		f.submit();
	});
	$('.deleteSearch').click(function(){
		var f = document.deleteSearch;
		
		var s = $(this).attr("qt");
		$("input:hidden[name=deleteQt]").attr("value", s);
		
		f.submit();
	});
});
</script>

<body>
   <div class="container" style="width:97.7%;">
         <div class="thumbnail" style = "height:80px;">
            <form class="navbar-form navbar" style="width:100%;height:40px;" action="/userSearch.hang" method="post">
               <div class="form-group" style = "display:table;margin-left:auto;margin-right:auto;margin-top:8px;width:100%">
               <button type="button" id="goFollowingList" class="btn btn-default" style = "margin-right:2%;">팔로잉</button>
               <button type="button" id="goFollowerList" class="btn btn-default" style = "margin-right:23%;">팔로워</button>
                  <input type="text" class="form-control" placeholder="회원검색" name="qt" value="<%= qt %>">
               <button type="submit" class="btn btn-default" style = "margin-left:10px;">Submit</button>
               </div>
            </form>
            <p><br>
         </div>
         
       <div class="row row-flex-height-md" style = "width:100%">
<%
	if(followingList != null){
%>
           <div class="title">
	           <font size = "4" style = "margin-left:1.5%"><b>마이 팔로잉</b></font>
	           <br><BR>
           </div>
<%
		for (int i = 0; i < followingList.size(); i++) {
			UserVo user = followingList.get(i);
%>
            <div class="col-sm-2" style = "width:20%" align = "center">
               <div class="unpa-card user-card followable  followed">
                  <!-- 클릭시 사용자 정보로 이동 -->
                  <a href="/myPage.hang?yourUserCode=<%= user.getUserCode() %>">
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
                           <span class="glyphicon glyphicon-user"></span>(<%= user.getFollowerCount() %>)
                        </div>
                        <!--  글쓴 수 -->
                        <div>
                           <span class="glyphicon glyphicon-pencil"></span>(<%= user.getPotingCount() %>)
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
        <div class="title">
	           <font size = "4" style = "margin-left:1.5%"><b>마이 팔로워</b></font>
	           <br><BR>
           </div>
<%
		for (int i = 0; i < followerList.size(); i++) {
			UserVo user = followerList.get(i);
%>
            <div class="col-sm-2" align = "center" style = "width:20%">
               <div class="unpa-card user-card followable  followed">
                  <!-- 클릭시 사용자 정보로 이동 -->
                  <a href="/myPage.hang?yourUserCode=<%= user.getUserCode() %>">
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
                           <span class="glyphicon glyphicon-user"></span>(<%= user.getFollowerCount() %>)
                        </div>
                        <!--  글쓴 수 -->
                        <div>
                           <span class="glyphicon glyphicon-pencil"></span>(<%= user.getPotingCount() %>)
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
        <div class="title">
	           <font size = "4" style = "margin-left:1.5%"><b>팔로워 검색</b></font>
	           <br><BR>
           </div>
<%
		for (int i = 0; i < userList.size(); i++) {
			UserVo user = userList.get(i);
%>
            <div class="col-sm-2" align = "center" style = "width:20%">
               <div class="unpa-card user-card followable  followed">
                  <!-- 클릭시 사용자 정보로 이동 -->
                  <a href="/myPage.hang?yourUserCode=<%= user.getUserCode() %>">
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
                           <span class="glyphicon glyphicon-user"></span>(<%= user.getFollowerCount() %>)
                        </div>
                        <!--  글쓴 수 -->
                        <div>
                           <span class="glyphicon glyphicon-pencil"></span>(<%= user.getPotingCount() %>)
                        </div>
                     </div>
                  </a>
<%
			if(user.getRelationFollowing() != null){
%>
				<form id="deleteSearch" name="deleteSearch" action="/relationSearchDelete.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
				  	  <input type="hidden" name="deleteQt" />
	                  <button class="user-follow-button followed deleteSearch" qt="<%= qt %>">
	                     	팔로우 취소
	                  </button>
                </form>
<%
			} else {
%>
				<form id="insertSearch" name="insertSearch" action="/relationSearchInsert.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
				  	  <input type="hidden" name="insertQt" />
	                  <button class="user-follow-button followed insertSearch" qt="<%= qt %>">
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
	if(followerList != null && followerList.size() == 0 && followingList == null && userList == null){
%>
		<font size = "3" style = "margin-left:4%">팔로워가 없습니다.</font>
		<BR><br><BR>
<%
	}
	if(followerList == null && followingList != null && followingList.size() == 0 && userList == null){
%>
		<font size = "3" style = "margin-left:4%">팔로잉이 없습니다.</font>
		<BR><br><BR>
<%
	}
	if(followerList == null && followingList == null && userList != null && userList.size() == 0){
%>
		<font size = "3" style = "margin-left:4%">검색 결과가 없습니다.</font>
		<BR><br><BR>
<%
	}
%>
            </div>
          </div>
       </div>  
      <!-- 팔로우 리뷰 작성 끝 -->
</CENTER>
</body>
