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
      <!-- �ȷο� ���� �ۼ� ���� -->
       <div class="thumbnail" style="width:100%;background-color:white;display:table;margin-left:auto;margin-right:auto">      
         <div class="col-sm-4 infos" style="width:15%;margin-left:5%">
            <img src="images/yebin.jpg" alt="����¥��" class="img-circle" style = "width:100px;height:100px;">
         </div>
         <div class="col-sm-4 infos" style="width:13%;height:100px;background-color:yellow">
            �̸� : ������
            <BR>��¥ : 2015.6.3
            <BR>�Ǻ�Ÿ�� : �Ǽ�
         </div>
         <div class="col-sm-4 infos" style="width:50%;background-color:orange">
            <div style="width:100%;">
               <h5>����ó���ۺ�</h3>
               <h3>���� ���� ������� �����̴� ��������</h3>
            </div>
         </div>
   </div>
         <div class="thumbnail" >
            <div class = "menubar" style = "width:100%;height:40px;">
            <ul class="nav nav-pills" style="display:table;margin-left:auto;margin-right:auto" align = "center">
               <li role="presentation" class="" style="width: 120px; height: 100px;">
                  <a href="MyReview.jsp">����</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="MyWrite.jsp">��</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="#">�Խù�</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="Flow.jsp">�ȷο�</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="OrderPage.jsp">���</a></li>
               <li role="presentation" class="" style="width: 120px; height: 100px">
                  <a href="#">���ϸ���</a></li>
            </ul>
            </div>
         </div>

         <div class="thumbnail" style = "height:80px;">
            <form class="navbar-form navbar" style="width:100%;height:40px;" action="/userSearch.hang" method="post">
               <div class="form-group" style = "display:table;margin-left:auto;margin-right:auto;margin-top:8px;width:100%">
               <button type="button" class="btn btn-default" style = "margin-right:2%;" onclick="goFollowingList()">�ȷ���</button>
               <button type="button" class="btn btn-default" style = "margin-right:23%;" onclick="goFollowerList()">�ȷο�</button>
                  <input type="text" class="form-control" placeholder="ȸ���˻�" name="qt" value="<%= qt %>">
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
           <h4 class="titles" style = "margin-left:40px"><font size = "4"><b>���� �ȷ���</b></font></h4><br>
<%
		for (int i = 0; i < followingList.size(); i++) {
			UserVo user = followingList.get(i);
%>
            <div class="col-sm-3" style="display:table;">
               <div class="unpa-card user-card followable  followed" style = " width:170px;display:table;margin-left:auto;margin-right:auto;">
                  <!-- Ŭ���� ����� ������ �̵� -->
                  <a href="#">
                     <div class="unpa-user-labels"></div>
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
                           <i class="ion-person"></i>�ȷο� �� : <%= user.getFollowerCount() %>
                        </div>
                        <!--  �۾� �� -->
                        <div>
                           <i class="ion-edit"></i>�۾� �� : <%= user.getPotingCount() %>
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
        <h4 class="titles" style = "margin-left:40px"><font size = "4"><b>���� �ȷο�</b></font></h4><br>
<%
		for (int i = 0; i < followerList.size(); i++) {
			UserVo user = followerList.get(i);
%>
            <div class="col-sm-3" style="display:table;">
               <div class="unpa-card user-card followable  followed" style = " width:170px;display:table;margin-left:auto;margin-right:auto;">
                  <!-- Ŭ���� ����� ������ �̵� -->
                  <a href="#">
                     <div class="unpa-user-labels"></div>
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
                           <i class="ion-person"></i>�ȷο� �� : <%= user.getFollowerCount() %>
                        </div>
                        <!--  �۾� �� -->
                        <div>
                           <i class="ion-edit"></i>�۾� �� : <%= user.getPotingCount() %>
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
        <h4 class="titles" style = "margin-left:40px"><font size = "4"><b>�ȷο� �˻�</b></font></h4><br>
<%
		for (int i = 0; i < userList.size(); i++) {
			UserVo user = userList.get(i);
%>
            <div class="col-sm-3" style="display:table;">
               <div class="unpa-card user-card followable  followed" style = " width:170px;display:table;margin-left:auto;margin-right:auto;">
                  <!-- Ŭ���� ����� ������ �̵� -->
                  <a href="#">
                     <div class="unpa-user-labels"></div>
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
                           <i class="ion-person"></i>�ȷο� �� : <%= user.getFollowerCount() %>
                        </div>
                        <!--  �۾� �� -->
                        <div>
                           <i class="ion-edit"></i>�۾� �� : <%= user.getPotingCount() %>
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
	                     	�ȷο� ���
	                  </button>
                </form>
<%
			} else {
%>
				<form name="insertSearch" action="/relationSearchInsert.hang" method="POST">
				  	  <input type="hidden" name="userCode" value="<%= user.getUserCode() %>"/>
				  	  <input type="hidden" name="insertQt" />
	                  <button class="user-follow-button followed" onClick="insertSearch()">
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
%>
            </div>
          </div>
       </div>  
      <!-- �ȷο� ���� �ۼ� �� -->
</CENTER>
</body>
</html>