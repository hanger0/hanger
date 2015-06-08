<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">

	<!-- 페이지 시작 -->
	<div class="container" style="width: 100%; height: 100%">
		<!-- left menu -->
		<div class="thumbnail"
			style="width: 16%; height: 100%; float: left; margin-left: 3%;">
			<div class="leftmenu" style="width: 100%; height: 100%;">
				<div class="productname">
					<span style="margin-bottom: 5px;"><font size="1"><b>A
								~ Z > Olive Young</b></font></span>
					<hr style="border: solid 1px; margin-bottom: 5px;">
					<font size="3">경로 적어주기</font>
					<hr style="border: solid 1px; margin-top: 5px;">
				</div>

				<hr>

				<%
					for (int i = 0; i < 5; i++) {
				%>
				<div class="dc1" style="margin-top: -7%;">
					<font size="3" style="margin-left: 3%"><b>1차 </b></font>
					<p>
						<%
							for (int j = 0; j < 5; j++) {
						%>
						<!-- 글을 눌렀을때 체크하려면 라베일의 for 이름과 체크박스 id,name이 같아야 적용됨 
				<label for = "face<%=j%>" style = "width:100%">
		        </label>
		       	-->
						<label style="width: 100%;"> <input type="checkbox"
							id="face" name="face" value="페이스 메이크업" style="margin-left: 3%">
							&nbsp;<font size="2">2차</font><br>
						</label>
						<%
				}
%>
					
					<hr style="margin-top: -1%">
				</div>
				<%
					}
				%>
			</div>
		</div>
		<!-- left menu 끝-->

		<!-- 리뷰 작성 시작 -->
		<div class="thumbnail"
			style="width: 75%; height: 100%; float: right; margin-right: 4%;">
			<br>
			<div class="select" style="margin-left: 3%; margin-top: 10px">
				<p>
					<span class="glyphicon glyphicon-home">&nbsp;HOME&nbsp;</span>>&nbsp;
					<select>
						<option value="최신순">최신순</option>
						<option value="인기순">인기순</option>
						<option value="낮은가격순">낮은가격순</option>
						<option value="높은가격순">높은가격순</option>
						<option value="팔로잉초이스">팔로잉초이스</option>
						<option value="할인율">할인율</option>
						<option value="리뷰개수">리뷰개수</option>
						<option value="평점순">평점순</option>
					</select>
			</div>
			<!-- 우측 상단 테이블 -->
			<div class="dc3"
				style="background-color: #EBEBEB; width: 93%; margin-left: 3%">
				<table
					style="width: 100%; height: 100px; display: table; margin-left: auto; margin-right: auto;">
					<tr>
						<td><a href="#">- 전체보기</a></td>
						<%
							for (int i = 0; i < 20; i++) {
						%>
						<td><a href="#">- 클렌징 폼</a></td>
						<%
							if (i == 5) {
						%>
					</tr>
					<tr>
						<%
							} else if (i > 6 && i == 12) {
						%>
					</tr>
					<tr>
						<%
							}
							}
						%>
					</tr>
				</table>
			</div>
			<!-- 간격 -->
			<hr>
			<!-- 인기상품 -->
			<div class="row hotitem" style="margin-left: 1%">
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<div class="col-sm-6 col-md-2"
					style="display: table; margin-left: 3px;">
					<div class="thumbnail" style="width: 205px">
						<img src="images/wonbin.PNG">
						<div class="caption">
							<font size="2"><b>이니스프리</b></font>
							<p>
							<p>
								<font size="3"><font color="orange"><b>미네랄
											모이스처 파운데이션 C2호 핑크 내추럴 베이지</b></font></font>
							</p>
							<p>★★★★★
							<p>가격 &nbsp;&nbsp;27,7000
							<hr style="margin-bottom: 3px">
							<div
								style="display: table; margin-left: auto; margin-right: auto;">
								<span class="glyphicon glyphicon-heart" aria-hidden="true"></span><span
									class="badge">87</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span><span
									class="badge">20</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
									class="glyphicon glyphicon-bookmark" aria-hidden="true"></span><span
									class="badge">30</span>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<!--  리뷰 작성 끝 -->
		</div>
	</div>
</body>
