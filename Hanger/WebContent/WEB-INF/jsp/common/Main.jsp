<%@ page language="java" contentType="text/html; charset=euc-kr"
   pageEncoding="euc-kr"%>
<!DOCTYPE html>

<html>
<head>
<title>Main Page</title>
<STYLE>
body
{
	background-color:#EBEBEB;
}
.container
{
	width:90%;
	background-color:#EBEBEB;
}
.advertise
{
	margin-top:20px;
	background-color:red;
	width:100%;
	height:200px;
}
.item
{
	width:100%;
	height:200px;
}
.adimg
{
	width:100%;
	height:200px;
}
.hotitem
{
	/*background-color:skyblue;*/
	margin-top:20px;
}
.titles
{
	margin-left:20px;
}
.reviewAndTip
{
	/*background-color:yellow;*/
}
.review
{
	/*background-color:pink;*/
}
.tip
{
	/*background-color:black;*/
}
.thumbnail
{
	height:280px;
}
.hotimages
{
	width:100%;
	height:165px;
}
.img-thumbnail
{

	width:100%;
	height:165px;
	/*background-color:black;*/
	
}
.rat
{
	margin-left:0px;
}
.rats
{
	height:250px;
}
.nominateuser
{
	/*background-color:gray;*/
}
.nomithumb
{
	height:200px;
}
.image
{
	width:100%;
	height:165px;
	text-align:center;
}
.caption
{
	margin-top:0px;
}
.peopleimage
{
	width:100%;
	height:165px;
}

</STYLE>
</head>
<body>
<div class="container">

<!-- 광고 -->
		<div class="advertise">

			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/wide1.jpg" alt="..." class="adimg">
						<div class="carousel-caption">wide1.jpg</div>
					</div>
					<div class="item">
						<img src="images/wide2.jpg" alt="..." class="adimg">
						<div class="carousel-caption">wide2.jpg</div>
					</div>
					<div class="item">
						<img src="images/wide3.jpg" alt="..." class="adimg">
						<div class="carousel-caption">wide3.jpg</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>


		</div>
<!-- 광고 끝 -->
				<!-- 인기상품 -->
				<div class="row hotitem">
					<h4 class="titles">인기상품~Hot Items</h4>
					<%
for(int i=0; i<4; i++)
{
%>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail">
							<div class="image">
								<img src="images/omnia.jpg" alt="..." class="hotimages">
							</div>
							<div class="caption">
								<P>
								<h5>
									<B>불가리</B>
								</h5>
								</P>
								<P>
								<h4>
									<B> 옴니아 아메시스트</B>
								</h4>
								</P>
								</h5>
								<p>500원</p>
							</div>
						</div>
					</div>
					<%
}
%>
				</div>

				<!-- 인기상품 끝 -->
				<!-- 리뷰 -->


				<div class="row reviewAndTip">
					<div class="col-md-6 review">

						<div class="row">
							<h4 class="titles">리뷰다</h4>
							<% 
for(int i=0; i<2; i++)
{
%>
							<div class="col-md-6 rat">

								<div class="thumbnail rats">
									<div class="image">
										<img src="images/cristalyn.jpg" alt="..." class="hotimages">
									</div>
									<div class="caption">
										<P>
										<h5>
											<B>존나 짱짱맨 향수</B>
										</h5>
										</P>
										<P>
										<h5>옴니아 크리스탈린 써보쇼~</h5>
									</div>
								</div>
							</div>
							<%
}
%>
						</div>
					</div>
					<!-- 리뷰 끝  -->

					<!-- 팁 -->
					<div class="col-md-6 review">

						<div class="row">
							<h4 class="titles">팁이다</h4>
							<% 
for(int i=0; i<2; i++)
{
%>
							<div class="col-md-6 rat">
								<div class="thumbnail rats">
									<div class="image">
										<img src="images/hommesun.jpg" alt="..." class="hotimages">
									</div>
									<div class="caption">
										<P>
										<h5>
											<B>개쩌는 남성용 썬크림</B>
										</h5>
										</P>
										<P>
										<h5>덕지덕지 바르면 OK!</h5>
										</P>
									</div>
								</div>
							</div>
							<%
}
%>
						</div>
					</div>
					<!-- 팁 끝 -->
				</div>

				<!-- 추천 사용자 -->
				<div class="row nominateuser">
					<div class="col-md-12">

						<div class="row">
							<h4 class="titles">추천받아라~</h4>
							<% 
for(int i=0; i<6; i++)
{
%>
							<div class="col-md-2">
								<div class="thumbnail rats">
									<div class="peopleimage">
										<img src="images/yebin.jpg" alt="..." class="hotimages">
									</div>
									<CENTER>
									<div class="caption">
										<h6>
											<B>예빈이긔여워</B>
										</h6>
										<p>
											<a href="#" class="btn btn-primary" role="button">방문하기</a>
										</p>
									</div>
									</CENTER>
								</div>
							</div>
							<%
}
%>
						</div>
					</div>
				</div>
				<!-- 추천 사용자 끝 -->
				<!-- 컨테이너 종료 부분 -->
			</div></body>
</html>