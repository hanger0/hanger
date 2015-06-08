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
<!-- 날짜 입력 관련 START -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
</head>
<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});
</script>
<div class="container">
	<CENTER>
		<span><h1>회원 구매내역</h1></span> <br> <br> <br> <br>
		<p>
			조회기간: <input type="text" id="datepicker1"> ~ <input
				type="text" id="datepicker2"> 
			회원아이디: <input type="text" id=""> <input type="button"
				value="확인" />
		</p>
		<TABLE class="table table-hover table-bordered">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="150"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">아이디(이름)</A></B></TD>
				<TD width="150"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=JUMIN">상품 이름</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">구매방법</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">가격</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">적용 마일리지</A></B></TD>
			</TR>

			<%
				for (int i = 1; i < 5; i++) {
			%>

			<TR align="center">
				<TD>i+1</TD>
				<TD><A href="javascript:goDetailInfo('asdf')">id + 이름</A></TD>
				<TD>잭필드 3종세트</TD>
				<TD>카드</TD>
				<TD>39,900 원</TD>
				<TD>500</TD>
				<%
					}
				%>
			
		</TABLE>

	</CENTER>
</div>