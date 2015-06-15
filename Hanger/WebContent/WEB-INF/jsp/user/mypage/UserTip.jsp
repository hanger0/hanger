<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<body>
	<!-- 팁 작성 시작 -->
	<div class="container" style="width:100%">
		<div class="row hotitem" style="width: 100%; display: table; margin-left: auto; margin-right: auto">
			<font size="4">
			<div class = "title" style = "width:97.7%;display:table;margin-left:auto;margin-right:auto">
				<b>MyTip</b>
				<div class = "reviewButton" style = "float:right">
					<span><input type = "button" value = "팁쓰기" style = "height:25px"></span>
				</div>
			</div>
			</font>
			<br>
			<!--  팁 작성 끝 -->
			<%
				for (int i = 0; i < 6; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail" style="margin-left: -5%; display: table; margin-left: auto; margin-right: auto">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px" style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<font size = "2">
							불가리
						</font>
						</P>
						<P>
						<font size = "3">
							<B>옴니아 아메시스트</B>
						</font>
						</P>

						<hr style="margin-bottom: 3px">
						<div class="Container-fluid" align="center">
							<span class="glyphicon glyphicon-heart">(20)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-pencil">(5)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-tag">(12)</span>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>