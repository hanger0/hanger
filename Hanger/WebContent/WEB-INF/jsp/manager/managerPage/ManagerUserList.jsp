<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "com.hanger.user.vo.UserVo" %>
<%@ page import="java.util.*" %>

<%
	ArrayList<UserVo> userList = (ArrayList<UserVo>)request.getAttribute("userList");
%>
<script>
	function userDelete() {
		var alert = confirm("정말 삭제하시겠습니까?");
		
		if(alert) {
			location.href = "#";
		} else {
			return false ;
		}
	}
</script>
<body>
	<CENTER>
	 <br>
		<center>
			<form class="navbar-form" role="search">
				<div class="form-group">
					<select >
					<option value = "아이디">아이디</option>
					<option value = "이름">이름</option>
					</select>
					<input type="text" class="form-control" placeholder="회원검색"
						style="width: 300px">

					<button type="submit" class="btn btn-default">검색</button>
				</div>
			</form>
		</center>

		<br> <br>
		<TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px">
			<TR bgcolor="#CFDDFA" align="center">
				<TD><font size = "2"><B>No.</B></font></TD>
				<TD><font size = "2"><B>ID</B></font></TD>
				<TD><font size = "2"><B>이름</B></font></TD>
				<TD><font size = "2"><B>나이</B></font></TD>
				<TD><font size = "2"><B>성별</B></font></TD>
				<TD><font size = "2"><B>지역</B></font></TD>
				<TD><font size = "2"><B>가입일</B></font></TD>
				<TD><font size = "2"><B>사용여부</B></font></TD>
				<TD><font size = "2"><B>회원구분</B></font></TD>
				<TD><font size = "2"><B>수정 / 삭제</B></font></TD>
			</TR>

		<% 
				for (int i=0; i < userList.size(); i++) {
					if(userList != null) {
						UserVo userVo = userList.get(i);
						String userId = userVo.getUserId();
						String userPwd = userVo.getUserPwd();
						String userName = userVo.getUserName();
						String userRegDate = userVo.getRegDate();
						String userUseYn = userVo.getUserUseYn();
						String userAdminYn = userVo.getUserAdminYn();
						String userBirthDate = userVo.getUserBirth();
						String userGender = userVo.getUserGender();
						
						int userYear = 0 ;
						if(userBirthDate !=null){
							String Year = userBirthDate.substring(0,4);
							userYear = 2016 - Integer.parseInt(Year);
						}
						
						String userAddr = userVo.getUserAddr1();
						if(userAddr != null) {
							userAddr = userAddr.substring(0,7);
						}
	
			%>
		
			<TR align="center">
				<TD>
					<font size = "2"><%= i+1 %></font>
				</TD>
				<TD>
					<font size = "2"><A href="/managerUserInfo.hang?userCode="><%= userId %></A></font>
				</TD>
				<TD>
					<font size = "2"><A href="/managerUserServlet.mo?func=managerUser_001&sort=NAME"><%= userName %></A></font>
				</TD>
				<TD>
					<font size = "2"><%=userYear%>세</font>
				</TD>
				<TD>
					<font size = "2"><%=userGender%></font>
				</TD>
				<TD>
					<font size = "2"><%=userAddr%></font>
				</TD>
				<TD>
					<font size = "2"><%= userRegDate %></font>
				</TD>
				<TD>
					<font size = "2"><%= userUseYn %></font>
				</TD>
				<TD>
					<font size = "2"><%=userAdminYn %></font>
				</TD>
				<TD>
					<font size = "2">
						<input type = "button" value = "수정" onClick = ""> &nbsp;&nbsp;&nbsp;
						<input type = "button" value = "삭제" onClick = "userDelete()">
					</font>
				</TD>
		<%
					}
				}
		 %>
		</TABLE>
	</CENTER>
</body>