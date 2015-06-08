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
<!-- 날짜 입력 관련 END -->
</head>

<body style="background-color: #EBEBEB">
	<!-- 
	<div class="container">
		<BR>


		<div class="thumbnail"
			style="width: 1000px; display: table; margin-left: auto; margin-right: auto;">
			<div class="panel panel-default"
				style="width: 900px; height: auto; margin-left: 45px; margin-top: 45px">
				<BR>
				<BR>
				<p>
					조회기간: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">
					<input type="button" value="확인"/>
				</p>
				
				
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<!-- <td align = "center" style = "border-right:1px solid gray;border-bottom:2px solid gray;width:30px"><input type = "checkbox"></td> -->
	<!-- 		<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>날짜</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품금액</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>수량</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>합계</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>비
								고</B></td>
					</tr>
					<%for (int i = 1; i < 20; i++) {%>
					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">2015-05-05</td>

						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px"><img src="/images/14.jpg" width="80px"
							height="80px" style="margin-left: -20px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>올리브 영 아쿠아 수분 크림</b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">19,000원</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">20</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">380,000 원</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2">1. A타입(로레알파리 루센트 매직 비비에센스 01호 내츄럴 베이지+워터프루프 젤펜슬
								아이라이너+립 컬러 스틱)</font></td>
					</tr>
					<%}%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>일계:2015-05-05 총 판매금액 : 201,504,402원</b>
						</font></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
	 -->
	<div class="container">
		<BR>


		<div class="thumbnail"
			style="width: 1000px; display: table; margin-left: auto; margin-right: auto;">
			<div class="panel panel-default"
				style="width: 900px; height: auto; margin-left: 45px; margin-top: 45px">
				<BR> <BR>
				<p>
					조회기간: <input type="text" id="datepicker1"> ~ <input
						type="text" id="datepicker2"> <input type="button"
						value="확인" />
				</p>

				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<!-- <td align = "center" style = "border-right:1px solid gray;border-bottom:2px solid gray;width:30px"><input type = "checkbox"></td> -->
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>날짜</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품금액</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>수량</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>합계</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>비
								고</B></td>
					</tr>
					<%
						for (int i = 1; i < 20; i++) {
					%>
					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">2015-05-05</td>

						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px"><img src="/images/14.jpg" width="80px"
							height="80px" style="margin-left: -20px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>올리브 영 아쿠아 수분 크림</b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">19,000원</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">20</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">380,000 원</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2">1. A타입(로레알파리 루센트 매직 비비에센스 01호 내츄럴 베이지+워터프루프 젤펜슬
								아이라이너+립 컬러 스틱)</font></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>일계:2015-05-05 총 판매금액 : 201,504,402원</b>
						</font></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>