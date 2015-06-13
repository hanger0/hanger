<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.hanger.reply.vo.ReplyVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<ReplyVo> replyList = (ArrayList<ReplyVo>)request.getAttribute("replyList");
%>

<link rel="stylesheet" href="css/Follow/follow.css" />

<style>
.myicon
{
	font-size:30px;
	color:gray;
}
.col1
{
	width:9%;
	padding-top:7px;
	padding-left:30px;
	
}
.rebtn
{
	font-size:30px;
}
.headinfo
{
	width:100%;
	height:auto;
}
.headinfotext
{
	text-align:center;
	height:50px;
	padding-top:13px;
	padding-bottom:13px;
	padding-left:15px;
	padding-right:15px;
}
.headconf
{
	margin-left:20px;
}
.uki
{
	margin-left:-50px;
}
</style>
<script>
$(function(){
	$("#replyBtnName").click(function(e){
		
/*******************************************TRIM**************************************/
		function trim(str)
		{
			var count = str.length;
			var len = count;
			var st = 0;

			while ((st < len) && (str.charAt(st) <= ' '))
			{
				st++;
			}
			while ((st < len) && (str.charAt(len - 1) <= ' '))
			{
				len--;
			}
			return ((st > 0) || (len < count)) ? str.substring(st, len) : str ;
		}	
/**************************************TRIM 종료****************************************/
		
/***************************************AJAX 시작****************************************/
		var f = document.replyForm;
		var postingCodeVal = trim(f.postingCode.value);
		var replyContentVal = trim(f.replyContent.value);
		
		
		alert("AJAX ㄱㄱ");
		$.ajax({
			type: "POST", 
			url: "/replyInsert.hang",
			dataType: "text",
			data: "postingCode=" + postingCodeVal + "&replyContent=" + replyContentVal, 
			success: function(text){
				alert("Ajax Success");
				var result = trim(text);
				$('#ajaxReviewList').html(result);
				
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});	
		//alert("AJAX END");
		e.preventDefault();
	});	
	
});

		
		

</script>
<body style = "background-color:#EBEBEB">
<br><BR><br>	
   <!-- 페이지 시작 -->
        <div class="container" style = "width:100%;">
    
	
    <!-- 리뷰 작성 시작 -->
        <div class="thumbnail" style = "width:75%;display:table;margin-left:auto;margin-right:auto;"><br>
        	<div class = "select" style = "margin-top:10px" align = "center"><p>
				<div class = "top" style ="width:930px;height:50px">
					
					<span class = "glyphicon glyphicon-heart myicon" style = "margin-right:150px">
						<font size = "6" color="black">좋아요(25)</font>
					</span>
					<span class = "glyphicon glyphicon-pencil myicon" >
						<font size = "6"color="black">댓글(15)</font>
					</span>
					<span class = "glyphicon glyphicon-tag myicon" style = "margin-left:150px">
						<font size = "6"color="black">스크랩(5)</font>
					</span>
					<br>		
				</div>
        	</div>
			<!-- 간격 -->
			<hr>
				<div class = "info" style = "width:94%;margin-left:3%;margin-top:10px;" align = "center">
					<div class = "title" style = "width:100%;height:auto;">
						<div class = "brandinfo" >
							<font size = "6"><b>루쥬 뷔르 꾸뛰르 베르니 아 레브르 팝워터(202)</b><BR></font>
						</div>
					</div>
					 <div class="row headinfo">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6 headconf">
                        	<div class="col-sm-4 headinfoimg">
                        		<img src="images/wonbin.PNG" alt="" class="img-circle rewriteimg" style = "width:50px;height:50px;">
                        		&nbsp&nbsp&nbsp박상욱
                        	</div>
                        	<div class="col-sm-4 headinfotext unpa-card user-card followable  followed">
                        		
                        		<div class="user-skin-info uki">
                           			<!-- 피부 건성인지 지성인지 -->
                           			<div class="empty">미입력</div>
                           			<!-- 피부 몇호인지 ex 23호 -->
                           			<div class="empty">미입력</div>
                        		</div>
                        	</div>
                        	<div class="col-sm-4 headinfotext">
                        		<div class="user-count-info uki" style="float:left;">
                        		   <div>
                              		<!--  팔로우 수 -->
                            		  	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp3
                           				&nbsp
                              			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp1
		                           		&nbsp
                              			<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp100
                           			</div>
                       			 </div>
                        	</div>
                        </div>
                        <div class="col-sm-3"></div>
					</div>
					<hr>
					<div class = "product" style = "width:100%;height:30px;">
						<font size = "3" style = "margin-right:15px"><font color = "gray">가격</font></font>
						<font size = "4" style = "margin-right:150px">17,500원</font>
						<font size = "3" style = "margin-right:15px"><font color = "gray">용량</font></font>
						<font size = "4" style = "margin-right:150px">0.5g</font>
						<font size = "3" style = "margin-right:15px"><font color = "gray">구매장소</font></font>
						<font size = "4" >쇼셜커머스</font>
					</div>
					<hr>
					
				</div>
			<!-- 인기상품 -->
				<div class="row hotitem" style = "margin-left:3%;margin-top:10px;width:94%;" align = "center">
					<div class = "userinfo">
						안녕하세요~ 히끼희끼에요! 파워리뷰로 5주만에 뵙네여... 긴 시간동안 기다려주신 분들(있기는하려나) 죄송하고 고맙슴다
						제가 벼르고 벼르던 화제의 여배우 틴트인 입생로랑 틴트를 드디어 구매해봤는디요, 이번에 새롭게 출시된 팝워터라인으로 샀답니다!
						제가 구매한 컬러는 202호에요. 다홍같으면서도 레드오렌지 느낌이나요 본통 색과 입술에 얹을 때와의 차이가 좀 있으니 꼭 매장가서 테스트 꼭 해보세요!
						발색이 잘되면서 광택감도 오래가고 색감이 오묘해서 좋았지만 입술이 편안하지 않은 발림성? 무겁고 끈적이는 느낌? 그리고 발색이 뭉치는 것 때문에 손이 많이 가진 않더라구요.
						제 개인적인 결론은 비싸고 예쁜 쓰레기였답니다! (입생에 악감정 절대 없어요. 입생덕후거든요.) 
						<div class = "image" align = "center">
							<br><img src = "images/review1.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						입생틴트의 케이스는 여자들 심쿵하게 하는 고급진 디자인이죠
						<br>
						<div class = "image" align = "center">
							<br><img src = "images/review3.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						전 개인적으로 어플리케이터가 좋더라구요. 45도로 기울어져 있어서 입술에 밀착하기 좋은 각도이며 끝이 뾰족해서 입술산과 입꼬리쪽을 정교하게 바를 수 있게 해주더라구요!
						<br>
						<div class = "image" align = "center">
							<br><img src = "images/review4.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						풀 발색이에요. 사진을 자세히 보시면 얼룩덜룩 하게 발색된게 보이실 거에요. 뭉침이 있단 뜻이죠... 쨍하게 발색하려면 2~3번 발색해야하는데 그만큼 입술이 불편해지는...쨍한 발색을 원하시는 분들은 기존의 입생틴트를 구매하시는걸 권장드려요.
						<br>
					</div>
				</div>
				<br><br>
				<hr>
				<div class ="review" id="ajaxReviewList" style = "margin-left:3%;margin-top:10px;width:94%;">
<%
	if(replyList != null){
		for(int i=0;i<replyList.size();i++){
			ReplyVo reply = replyList.get(i);
			String replyContent = reply.getReplyContent();
			String replyName = reply.getUserName();
			String userPicPath = reply.getUserPicPath();
			String userPicSaveName = reply.getUserPicSaveName();
			String updDate = reply.getUpdDate();
%>
 		<div class = "review" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="<%= userPicPath %>/<%= userPicSaveName %>" alt="예빈짜응" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b><%=replyName %></b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray"><%= updDate %></font></font>
			</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:5%;">
				<font size = "2">
					<%= replyContent %>
				</font> 
			</div>
		</div>
		<hr>
<%
		}
	}
%>
				</div>
        	</div>
        	 <div class="thumbnail" style = "width:75%;display:table;margin-left:auto;margin-right:auto;">
        		<div class="replywrite" style = "margin-left:2%" >
<form role="form" id="replyForm" name="replyForm">
    <INPUT type="hidden" name="postingCode" value="posodes" />
					<div class="replyimg col-sm-1" style = "width:20%;">
						<img src="images/wonbin.PNG" alt="" class="img-circle rewriteimg" style = "width:80px;height:80px;">
					</div>
					<div class="replyinsert col-sm-10" style = "width:77%;margin-left:-10%;margin-top:1.5%">
						<input type="text" name="replyContent" class="form-control insert" rows="1" style="resize:none;width:100%;height:50px"/>
					</div>
					<div class="replybtn col-sm-1" style = "width:10%;margin-left:-2.3%;margin-top:1.5%">
						<button style = "width:100px;height:50px" id="replyBtnName" >
							<span class="glyphicon glyphicon-pencil rebtn" aria-hidden="true"></span>
						</button>
					</div>
				</div>		
        	</div>
        </div>
</form>
</body>
</html>
