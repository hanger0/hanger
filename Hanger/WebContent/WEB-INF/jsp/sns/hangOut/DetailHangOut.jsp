<%@ page contentType="text/html; charset=EUC-KR"%>

<STYLE>
body
{
	background-color:#EBEBEB;
}
.container
{
	width:100%;
}
.row
{
	margin-top:5px;
	margin-bottom:5px;
	background-color:white;
}
.headimg
{
	width:100%;
	height:80px;
}
.left
{
	background-color:red;
	width:200px;
	height:150px;
}
.right
{
	background-color:white;
	
}
.headimg
{
	margin-left:-8px;
}
.head
{
	margin-left:-25px;
}
.mainimg
{
	width:70%;
	height:200px
}
.heads
{
	height:90px;
}
.reimgs
{
	margin-left:-6px;
	width:70px;
	height:70px;
}

.replymain
{
	height:80px;
	padding:3px;
}
.replylist 
{
	width:100%;
	height:90px;
}

.replybutton
{
	width:100%;
	height:70px;
	
}
.rewriteimg
{
	width:70px;
	height:70px;
	margin-top:10px;
	margin-left:-6px;
}
.replybutton
{
	margin-top:10px;
}
.recomment
{
	margin-left:20px;
	margin-right:10px;
}
.reheadname
{
	margin-left:20px;
	margin-right:10px;
}
.replyrow
{
	width:100%;
	height:90px;
}
.mainrow
{
	height:500px;
}
</STYLE>

<body>
	<div class="container">
	<p>
				<div class="row mainrow" style = "display:table;margin-left:auto;margin-right:auto;">
					<p>			
							<div class="col-sm-2 heads" style = "width:15%;margin-left:1%">
								<img src="images/yebin.jpg" alt="예빈짜응" class="img-circle headimg">
							</div>
							<div class="col-sm-3 head heads">
								<div>
									<h5><B>박상욱</B></h5> <font size="1">2015년 6월 3일</font>
								</div>
							</div>
							<div class="col-sm-7 heads"></div>
							
							<div class="main col-sm-12">
								<h5>
									뻘글을 쓰려고 합니당!
								</h5>
							<HR>
							<CENTER>
								<img src="images/yebin.jpg" alt="예빈짜응" class="img-rounded mainimg">
							</CENTER>
								<HR>
								<h5>
								집에 가고 싶다 집에 가고 싶다 집에 가고 싶다 집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다
								집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다
								집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다집에 가고 싶다
								</h5>
							</div>
			
					
				</div>
				<div class="row" style = "display:table;margin-left:auto;margin-right:auto;">
					<div class="replyhead" >
						<div class="reheadcon" style="margin:auto; padding:1px;margin-left:2%">
						<BR>
						<span class="glyphicon glyphicon-comment" aria-hidden="true" style="font-size:20px;"><B><font size="5">댓글(4)</font></B></span>
						</div>
					<HR>
					</div>
<%
for(int i=0;i<4;i++) {
%>					
					<div class="replylist" >
						<div class="replyimg col-sm-1" style = "margin-left:2%">
							<img src="images/yebin.jpg" alt="예빈짜응" class="img-circle reimgs">
						</div>
						<div class="replymain col-sm-10">	
								<div class="reheadname"><B>박상욱</B> <font size="1">2015년 6월 3일</font></div>
								<div class="recomment">
									저도 이 제품 평이 좋아서 써봤는데 한 통 거의 다 쓸 때까지도 그닥 큰 효과는 보지 못했어요.. 재구입은 안 할 생각이에요!
									ㅇ러ㅏ노마ㅓ로저도 이 제품 평이 좋아서 써봤는데 한 통 거의 다 쓸 때까지도 그닥
								</div>
						</div>
						<div class="col-sm-1"></div>
					</div>
					
<%
}
%>						
				</div>
					
				<div class="row replyrow" style = "display:table;margin-left:auto;margin-right:auto;">
					<div class="replywrite">
						<div class="replyimg col-sm-1">
							<CENTER>
								<img src="images/wonbin.PNG" alt="예빈짜응" class="img-circle rewriteimg">
							</CENTER>
						</div>
						<div class="replyinsert col-sm-10">
							<textarea class="form-control insert" rows="2" style="resize:none;height:70px"></textarea>
						</div>
						<div class="replybtn col-sm-1" style = "margin-left:-10px">
							<button type="button" class="btn btn-default replybutton" style = "height:70px;width:60px">
  								<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
  							</button>
						</div>
					</div>			
				</div>	
<!-- container 종료 시점-->
	<p>
	</div>
<!-- container 종료 시점-->	
</body>
