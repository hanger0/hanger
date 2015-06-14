<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "com.hanger.scrap.vo.ScrapVo" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hanger.posting.review.vo.ReviewLikeCheckVo" %>
<%
	String postingCode =(String)request.getAttribute("postingCode");
	String myUserCode = (String)session.getAttribute("myUserCode");
	
	ArrayList<ScrapVo> scrapList = (ArrayList<ScrapVo>)request.getAttribute("scrapList");
	ArrayList<ReviewLikeCheckVo> likeList = (ArrayList<ReviewLikeCheckVo> )request.getAttribute("likeList");
	String cntLike = (String)request.getAttribute("likeCount");
	int likeListSize = likeList.size();
	
	boolean checkScrap = false;
	
	for(int i = 0 ; i < scrapList.size(); i++) {
		ScrapVo list = scrapList.get(i);
		String dbPostingCode = list.getPostingCode();
		String dbUserCode = list.getUserCode();
		
		if(myUserCode.equals(dbUserCode)){
			checkScrap = true;
		}
	}
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
</style>

<body style = "background-color:#EBEBEB">
<br><BR><br>	
   <!-- 페이지 시작 -->
        <div class="container" style = "width:100%;">
    <!-- left menu -->
	<div class ="thumbnail" style = "width:16%;float:left;margin-left:3%;" align = "center" >
		<div class="unpa-card user-card followable  followed">
                     <!-- 클릭시 사용자 정보로 이동 -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("/images/juven.PNG");'></div><br>
                        <div class="user-nickname">동작구사랑방</div>
                        <div class="user-skin-info">
   
                           <!-- 피부 건성인지 지성인지 -->
                           <div class="empty">미입력</div>
                           <!-- 피부 몇호인지 ex 23호 -->
                           <div class="empty">미입력</div>
                        </div><p><p><p>
                        <div class="user-count-info">
                           <div>
                              <!--  팔로우 수 -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp3
                           </div>
                           <!--  글쓴 수 -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp1
                           </div>
                           <!-- 좋아요 받은 수  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp100
                           </div>
                        </div>
                     </a>
                     <button class="user-follow-button followed">
                        <span class="glyphicon glyphicon-user"></span> 팔로우 중
                     </button>
                     <button class="user-follow-button">
                        <i class="unpacon-user"></i> 팔로우
                     </button>
                  </div>
	</div>
	<!-- left menu 끝 -->
	
	<!-- 스크랩 스크립트 -->
	<script>
		$(function(){
			$(".like").click(function(){
				var like = $(this);
				var postingCode = "<%=postingCode%>"
				if(like.attr('class') === ('glyphicon glyphicon-heart myicon like')){
					//좋아요		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>좋아요 취소("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('cancel');
						}
					});
				} else {
					//좋아요 취소
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>좋아요(" + cnt + ')</FONT>');
							like.removeClass('cancel');
							like.addClass('like');
						}
					});
				}
			});
			
			$(".cancel").click(function(){
				var like = $(this);
				var postingCode = "<%=postingCode%>"
				if(like.attr('class') === ('glyphicon glyphicon-heart myicon like')){
					//좋아요		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>좋아요 취소("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('cancel');
						}
					});
				} else {
					//좋아요 취소
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>좋아요(" + cnt + ')</FONT>');
							like.removeClass('cancel');
							like.addClass('like');
						}
					});
				}
			});
			
			$(".scrapDelete").click(function(){
				var deleteClass = $(this);
				var postingCode = $("input:hidden[name=postingCode]").val();
				var checkScrap = $("input:hidden[name=checkScrap]").val();
				
				if(deleteClass.attr('class') === ('glyphicon glyphicon-tag myicon scrapDelete')){
					var t = confirm("이미 스크랩이 되어있습니다.\n 해당 스크랩을 지우시겠습니까?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'black' size = '6'>스크랩(" + resultText +")</FONT>"
								$("input:hidden[name=checkScrap]").val("false");
								deleteClass.html(resultScrap);
								deleteClass.removeClass("scrapDelete");
								deleteClass.addClass("scrapInsert");
							}
						});
					} else {
						return false ;
					}
				} else {
					var t = confirm("스크랩을 하시겠습니까?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'red' size = '6'>스크랩(" + resultText +")</FONT>"
									$("input:hidden[name=checkScrap]").val("true");
									deleteClass.html(resultScrap);
									deleteClass.removeClass("scrapInsert");
									deleteClass.addClass("scrapDelete");
								}
							});
					} else {
						return false ;
					}
				}
			});
			
			$(".scrapInsert").click(function(){
				var insertClass = $(this);
				var postingCode = $("input:hidden[name=postingCode]").val();
				var checkScrap = $("input:hidden[name=checkScrap]").val();
				
				if(insertClass.attr('class') === ('glyphicon glyphicon-tag myicon scrapInsert')){
					var t = confirm("스크랩을 하시겠습니까?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'red' size = '6'>스크랩(" + resultText +")</FONT>"
								$("input:hidden[name=checkScrap]").val("true");
								insertClass.html(resultScrap);
								insertClass.removeClass("scrapInsert");
								insertClass.addClass("scrapDelete");
							}
						});
					} else {
						return false ;
					}
				} else {
					var t = confirm("이미 스크랩이 되어있습니다.\n 해당 스크랩을 지우시겠습니까?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'black' size = '6'>스크랩(" + resultText +")</FONT>"
									$("input:hidden[name=checkScrap]").val("false");
									insertClass.html(resultScrap);
									insertClass.removeClass("scrapDelete");
									insertClass.addClass("scrapInsert");
								}
							});
					} else {
						return false ;
					}
				}
			});
		});
		
	</script>
    <!-- 리뷰 작성 시작 -->
        <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;"><br>
        	<div class = "select" style = "margin-top:10px" align = "center"><p>
				<div class = "top" style ="width:930px;height:50px">
				<input type="hidden" name="postingCode" value="<%= postingCode%>">
				<input type="hidden" name="checkScrap" value="<%=checkScrap%>">
					<%
						if(likeListSize == 0){
					%>
					<span class = "glyphicon glyphicon-heart myicon like">
						<font size = "6" color="black">좋아요(<%=cntLike %>)</font>
					</span>
					<%
						} else if(likeListSize == 1){
					%> 	
					<span class = "glyphicon glyphicon-heart myicon cancel"style = "margin-left:-1%">
						<font size = "6" color="black">좋아요 취소(<%=cntLike %>)</font>
					</span>
					<%
						}
					%>
					<span class = "glyphicon glyphicon-pencil myicon" style="margin-left:100px">
						<font size = "6"color="black">댓글(15)</font>
					</span>
					<%
						if(checkScrap) {
					%>
					<span class = "glyphicon glyphicon-tag myicon scrapDelete"  style = "margin-left:150px">
						<font size = "6"color="red">스크랩(<%= scrapList.size()%>)</font>
					</span>
					<%
						}else{
					%>
					<span class = "glyphicon glyphicon-tag myicon scrapInsert"  style = "margin-left:150px">
						<font size = "6"color="black">스크랩(<%= scrapList.size()%>)</font>
					</span>
					<%
						}
					%>
					<br>		
				</div>
        	</div>
			<!-- 간격 -->
			<hr>
				<div class = "info" style = "width:94%;margin-left:3%;margin-top:10px;" align = "center">
					<div class = "title" style = "width:100%;height:100px;">
						<div class = "brand">
							<font size = "4">입생로랑</font>
							<br><br>
						</div>
						<div class = "brandinfo" >
							<font size = "6"><b>루쥬 뷔르 꾸뛰르 베르니 아 레브르 팝워터(202)</b></font>
						</div>
					</div>
					<br><br>
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
					<div class = "like" style = "width:100%;height:auto;" align = "left">
						<font size = "4" style = "margin-left:12px">이런분께 추천해 드려요!</font><br><Br>
						<div class = "title" style = "height:auto;width:100%;">
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">장점</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px;">
									오래가는 광택 ○평균 이상의 발색 ○평균 이상의 지속력 ○색감 하난 끝내줌 ○어플리케이터의 모양
								</div>
							</div>
							<br>
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">단점</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px">
									다소 끈적임 ○발색이 뭉침 ○역시 비싼건 장점이 될 수 없지
								</div>
							</div>
							<br>
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">추천</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px">
									입술이 건조하고 주름이 많으신분들께 추천! 아 나는 머리부터 발끝까지 편한게 최고인 자유인에 싸면 장땡이다라는 분들껜 비추천.
								</div>
							</div>
						</div>
						<hr>
					</div>
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
				<div class ="review" style = "margin-left:3%;margin-top:10px;width:94%;">
<%
    	for(int i = 0 ; i < 6 ; i++) {
 %>		
 		<div class = "review" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="images/yebin.jpg" alt="예빈짜응" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b>동작구 사랑방</b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray">2015년 6월 8일</font></font>
			</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:5%;">
				<font size = "2">
					@오채s 감사합니다♥@러블리하당 러블리하당님 오랜만이예요♥ @뿐뿡이 폰카씁니당ㅋㅋㅋ 베레기ㅋㅋ 
					제품샷은 가끔 캐논50d+렌즈 울트라소닉 24-105mm쓸때도있어요ㅋㅋ 이것도 백만년전 유물이네요ㅎㅎㅎ 
					@Annelover 저만큼만족하셨으면 좋겠네용ㅋㅋ 저는 삐아는 고민안하고 사고있어요ㅋㅋㅋ
				</font> 
			</div>
		</div>
		<hr>
<%
    	}
%>	
				</div>
        	</div>
        	 <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;">
        		<div class="replywrite" style = "margin-left:2%" >
					<div class="replyimg col-sm-1" style = "width:20%;">
						<img src="images/wonbin.PNG" alt="" class="img-circle rewriteimg" style = "width:80px;height:80px;">
					</div>
					<div class="replyinsert col-sm-10" style = "width:77%;margin-left:-10%;margin-top:1.5%">
						<input type="text" class="form-control insert" rows="1" style="resize:none;width:100%;height:50px"/>
					</div>
					<div class="replybtn col-sm-1" style = "width:10%;margin-left:-2.3%;margin-top:1.5%">
						<button style = "width:100px;height:50px">
							<span class="glyphicon glyphicon-pencil rebtn" aria-hidden="true"></span>
						</button>
					</div>
				</div>		
        	</div>
        </div>
    </body>
