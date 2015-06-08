<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>WisiList</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<div class="container">
	<CENTER>
		<span><h1>회원목록</h1></span> <br> <br>

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
		<TABLE class="table table-hover table-bordered">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="85"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">ID</A></B></TD>
				<TD width="85"><B>Pass</B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=JUMIN">주민번호</A></B></TD>
				<TD width="70"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=NAME">이름</A></B></TD>
				<TD width="80"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=REG_DATE">가입일</A></B></TD>
				<TD width="70"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">사용여부</A></B></TD>
				<TD width="75"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ADMINYN">회원구분</A></B></TD>
				<TD width="100"><B>기능</B></TD>
			</TR>

			<!--  	for(int i=0; i<userList.size(); i++)
    	{
		Hashtable userTable = (Hashtable)userList.get(i);
		String id = (String)userTable.get("ID");
		String pass = (String)userTable.get("PASS");
		String name = (String)userTable.get("NAME");
		String jumin = (String)userTable.get("JUMIN");
		String regDate = (String)userTable.get("REG_DATE");
		String useYn = (String)userTable.get("USEYN");
		String adminYn = (String)userTable.get("ADMINYN");

		String bgcolor = "#FFFFFF";
		String useKor = "사용중";
		if(useYn.equals("N"))
		{
			bgcolor = "#E0E0E0";
			useKor = "중지";
		}

		String userType = "일반회원";
		if(adminYn.equals("Y"))
		{
			bgcolor = "#C9E7F8";
			userType = "관리자";
		} 
-->
		<% for(int i=1; i<5; i++) 
		{
			%>
		
			<TR align="center">
				<TD>i+1</TD>
				<TD><A href="javascript:goDetailInfo('asdf')">id</A></TD>
				<TD>pass</TD>
				<TD>jumin</TD>
				<TD>name</TD>
				<TD>regDate</TD>
				<TD>useKor</TD>
				<TD>userType</TD>
				<TD>수정,삭제</TD>
		<%
		}
		 %>
				<!-- 
			<TD>
				<IMG src="/images/button/sbut_update.gif" class="userUpdateClass" align="absmiddle" border="0" style="cursor:pointer" alt="">

				<IMG src="/images/button/sbut_delete.gif" class="useYnClass" align="absmiddle" border="0" style="cursor:pointer" alt="" title="N">

				<IMG src="/images/button/sbut_use.gif" class="useYnClass" align="absmiddle" border="0" style="cursor:pointer" alt="" title="Y">
		</TD>
		</TR>
 -->
		</TABLE>

	</CENTER>
</div>