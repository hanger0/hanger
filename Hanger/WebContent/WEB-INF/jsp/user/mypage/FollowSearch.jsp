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
               <button type="button" id="goFollowingList" class="btn btn-default" style = "margin-right:2%;">�ȷ���</button>
               <button type="button" id="goFollowerList" class="btn btn-default" style = "margin-right:23%;">�ȷο�</button>
                  <input type="text" class="form-control" placeholder="ȸ���˻�" name="qt" value="<%= qt %>">
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
	           <font size = "4" style = "margin-left:1.5%"><b>���� �ȷ���</b></font>
	           <br><BR>
           </div>
<%
		for (int i = 0; i < followingList.size(); i++) {
			UserVo user = followingList.get(i);
%>
            <div class="col-sm-2" style = "width:20%" align = "center">
               <div class="unpa-card user-card followable  followed">
                  <!-- Ŭ���� ����� ������ �̵� -->
                  <a href="/myPage.hang?yourUserCode=<%= user.getUserCode() %>">
                     <div class="user-image" style="background-image: url(/images/omnia.jpg);"></div>
                     <div class="user-nickname"><%= user.getUserName() %></div>
                     <div class="user-skin-info">
                        <!-- �Ǻ� �Ǽ����� �������� -->
                        <div class="empty"><%= user.getUserSkinType() %></div>
                        <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                        <div class="empty"><%= user.getUserSkinTone() %></div>
                     </div>
                     <div class="user-count-info">
                        <div>
                           <!--  �ȷο� �� -->
                           <span class="glyphicon glyphicon-user"></span>(<%= user.getFollowerCount() %>)
                        </div>
                        <!--  �۾� �� -->
                        <div>
                           <span class="glyphicon glyphicon-pencil"></span>(<%= user.getPotingCount() %>)
                        </div>
                     </div>
                  </a>
                  <form id="deleteFollowing" name="deleteFollowing" action="/relationFollowingDelete.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
	                  <button class="user-follow-button followed" onClick="deleteFollowing()">
							�ȷο� ���
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
	           <font size = "4" style = "margin-left:1.5%"><b>���� �ȷο�</b></font>
	           <br><BR>
           </div>
<%
		for (int i = 0; i < followerList.size(); i++) {
			UserVo user = followerList.get(i);
%>
            <div class="col-sm-2" align = "center" style = "width:20%">
               <div class="unpa-card user-card followable  followed">
                  <!-- Ŭ���� ����� ������ �̵� -->
                  <a href="/myPage.hang?yourUserCode=<%= user.getUserCode() %>">
                     <div class="user-image" style="background-image: url(/images/omnia.jpg);"></div>
                     <div class="user-nickname"><%= user.getUserName() %></div>
                     <div class="user-skin-info">

                        <!-- �Ǻ� �Ǽ����� �������� -->
                        <div class="empty"><%= user.getUserSkinType() %></div>
                        <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                        <div class="empty"><%= user.getUserSkinTone() %></div>
                     </div>
                     <div class="user-count-info">
                        <div>
                           <!--  �ȷο� �� -->
                           <span class="glyphicon glyphicon-user"></span>(<%= user.getFollowerCount() %>)
                        </div>
                        <!--  �۾� �� -->
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
	                     	�ȷο� ���
	                  </button>
                </form>
<%
				} else {
%>
				<form id="insertFollower" name="insertFollower" action="/relationFollowerInsert.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
	                  <button class="user-follow-button followed" onClick="insertFollower()">
	                     	�ȷο� �α�
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
	           <font size = "4" style = "margin-left:1.5%"><b>�ȷο� �˻�</b></font>
	           <br><BR>
           </div>
<%
		for (int i = 0; i < userList.size(); i++) {
			UserVo user = userList.get(i);
%>
            <div class="col-sm-2" align = "center" style = "width:20%">
               <div class="unpa-card user-card followable  followed">
                  <!-- Ŭ���� ����� ������ �̵� -->
                  <a href="/myPage.hang?yourUserCode=<%= user.getUserCode() %>">
                     <div class="user-image" style="background-image: url(/images/omnia.jpg);"></div>
                     <div class="user-nickname"><%= user.getUserName() %></div>
                     <div class="user-skin-info">

                        <!-- �Ǻ� �Ǽ����� �������� -->
                        <div class="empty"><%= user.getUserSkinType() %></div>
                        <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                        <div class="empty"><%= user.getUserSkinTone() %></div>
                     </div>
                     <div class="user-count-info">
                        <div>
                           <!--  �ȷο� �� -->
                           <span class="glyphicon glyphicon-user"></span>(<%= user.getFollowerCount() %>)
                        </div>
                        <!--  �۾� �� -->
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
	                     	�ȷο� ���
	                  </button>
                </form>
<%
			} else {
%>
				<form id="insertSearch" name="insertSearch" action="/relationSearchInsert.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
				  	  <input type="hidden" name="insertQt" />
	                  <button class="user-follow-button followed insertSearch" qt="<%= qt %>">
	                     	�ȷο� �α�
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
		<font size = "3" style = "margin-left:4%">�ȷο��� �����ϴ�.</font>
		<BR><br><BR>
<%
	}
	if(followerList == null && followingList != null && followingList.size() == 0 && userList == null){
%>
		<font size = "3" style = "margin-left:4%">�ȷ����� �����ϴ�.</font>
		<BR><br><BR>
<%
	}
	if(followerList == null && followingList == null && userList != null && userList.size() == 0){
%>
		<font size = "3" style = "margin-left:4%">�˻� ����� �����ϴ�.</font>
		<BR><br><BR>
<%
	}
%>
            </div>
          </div>
       </div>  
      <!-- �ȷο� ���� �ۼ� �� -->
</CENTER>
</body>
