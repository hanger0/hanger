<%@ page contentType="text/html; charset=EUC-KR"%>
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
				<TD><B>No.</B></TD>
				<TD><B>ID</A></B></TD>
				<TD><B>Pass</B></TD>
				<TD><B>이름</A></B></TD>
				<TD><B>가입일</A></B></TD>
				<TD><B>사용여부</A></B></TD>
				<TD><B>회원구분</A></B></TD>
				<TD><B>기능</B></TD>
			</TR>

		<% for(int i=0; i<5; i++) 
		{
			%>
		
			<TR align="center">
				<TD><%= i+1 %></TD>
				<TD><A href="/managerUserInfo.hang?userCode=">id</A></TD>
				<TD>pass</TD>
				<TD><A href="/managerUserServlet.mo?func=managerUser_001&sort=NAME">name</A></TD>
				<TD><A href="/managerUserServlet.mo?func=managerUser_001&sort=REG_DATE">regDate</A></TD>
				<TD><A href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">useKor</A></TD>
				<TD>userType</TD>
				<TD><input type = "button" value = "수정">&nbsp;&nbsp;&nbsp;<input type = "button" value = "삭제"></TD>
		<%
		}
		 %>
		</TABLE>
	</CENTER>
</body>