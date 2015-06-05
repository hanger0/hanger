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

<!-- ���� -->
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
<!-- ���� �� -->
				<!-- �α��ǰ -->
				<div class="row hotitem">
					<h4 class="titles">�α��ǰ~Hot Items</h4>
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
									<B>�Ұ���</B>
								</h5>
								</P>
								<P>
								<h4>
									<B> �ȴϾ� �Ƹ޽ý�Ʈ</B>
								</h4>
								</P>
								</h5>
								<p>500��</p>
							</div>
						</div>
					</div>
					<%
}
%>
				</div>

				<!-- �α��ǰ �� -->
				<!-- ���� -->


				<div class="row reviewAndTip">
					<div class="col-md-6 review">

						<div class="row">
							<h4 class="titles">�����</h4>
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
											<B>���� ¯¯�� ���</B>
										</h5>
										</P>
										<P>
										<h5>�ȴϾ� ũ����Ż�� �Ẹ��~</h5>
									</div>
								</div>
							</div>
							<%
}
%>
						</div>
					</div>
					<!-- ���� ��  -->

					<!-- �� -->
					<div class="col-md-6 review">

						<div class="row">
							<h4 class="titles">���̴�</h4>
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
											<B>��¼�� ������ ��ũ��</B>
										</h5>
										</P>
										<P>
										<h5>�������� �ٸ��� OK!</h5>
										</P>
									</div>
								</div>
							</div>
							<%
}
%>
						</div>
					</div>
					<!-- �� �� -->
				</div>

				<!-- ��õ ����� -->
				<div class="row nominateuser">
					<div class="col-md-12">

						<div class="row">
							<h4 class="titles">��õ�޾ƶ�~</h4>
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
											<B>�����̱Ῡ��</B>
										</h6>
										<p>
											<a href="#" class="btn btn-primary" role="button">�湮�ϱ�</a>
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
				<!-- ��õ ����� �� -->
				<!-- �����̳� ���� �κ� -->
			</div></body>
</html>