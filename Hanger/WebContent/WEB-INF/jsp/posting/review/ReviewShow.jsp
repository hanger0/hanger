<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "com.hanger.posting.review.vo.ReviewShowVo" %>
<%@ page import = "java.util.*" %>

<%
	String myUserCode = (String)session.getAttribute("myUserCode");
   List<ReviewShowVo> reviewList = (List<ReviewShowVo>)request.getAttribute("reviewList");
   
   //review
   String reviewCode = reviewList.get(0).getReviewCode();
   String reviewContent = reviewList.get(0).getReviewContent();
   String reviewTitle = reviewList.get(0).getReviewTitle();
   String reviewMainPicPath = reviewList.get(0).getReviewMainPicPath();
   String reviewMainPicSaveName = reviewList.get(0).getReviewMainPicSaveName();
   String reviewScore = reviewList.get(0).getReviewScore();
   String reviewLikeCnt = reviewList.get(0).getReviewLikeCnt();
   String reviewReplyCnt = reviewList.get(0).getReviewReplyCnt();
   String reviewScrapCnt = reviewList.get(0).getReviewScrapCnt();
   String reviewRegDate = reviewList.get(0).getReviewRegDate();
   String myLikeYn = reviewList.get(0).getMyLikeYn();
   String myScrapYn = reviewList.get(0).getMyScrapYn();
   
   //item
   String itemGroupCode = reviewList.get(0).getItemGroupCode();
   String itemBrandCode = reviewList.get(0).getItemBrandCode();
   String itemBrandName = reviewList.get(0).getItemBrandName();
   String itemCode = reviewList.get(0).getItemCode();
   String itemName = reviewList.get(0).getItemName();
   HashMap<String, String> itemSizeList = new HashMap<String, String>(); //itemSize�� itemSellPrice�� ��ġ
   for(int i = 0; i < reviewList.size(); i++){
      itemSizeList.put(reviewList.get(i).getItemSize(), ""+reviewList.get(i).getItemSellPrice());
   }
   int maxPrice = (Integer)request.getAttribute("maxPrice");
   int minPrice = (Integer)request.getAttribute("minPrice");
   String itemPicPath = reviewList.get(0).getItemPicPath();
   String itemPicSaveName = reviewList.get(0).getItemPicSaveName();
   String itemSummaryInfo = reviewList.get(0).getItemSummaryInfo();
   
   //writer
   String writerCode = reviewList.get(0).getWriterCode();
   String writerName = reviewList.get(0).getWriterName();
   String writerSkinType = reviewList.get(0).getWriterSkinType();
   String writerSkinTone = reviewList.get(0).getWriterSkinTone();
   String writerPicPath = reviewList.get(0).getWriterPicPath();
   String writerPicSaveName = reviewList.get(0).getWriterPicSaveName();
   String writerFollowerCnt = "" + (Integer.parseInt(reviewList.get(0).getWriterFollowerCnt()) - 1);
   String writerPostingCnt = reviewList.get(0).getWriterPostingCnt();
   String writerPostingLikeCnt = reviewList.get(0).getWriterPostingLikeCnt();
   
   boolean myReviewYn = false;
   if(myUserCode.equals(writerCode))
   {
	   myReviewYn=true;
   }
%>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="/js/common/common.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/Follow/follow.css" />
<style>
.myicon
{
   font-size:20px;
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
<script>
	function sameProduct() {
		location.href = "/";
	}
</script>
<!-- ��ũ�� ��ũ��Ʈ -->
	<script>
		$(function(){
			$(".like").click(function(){
				var like = $(this);
				var postingCode = $("input:hidden[name=postingCode]").val();
				if(like.attr('class') === ('glyphicon glyphicon-heart myicon like')){
					//���ƿ�		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 1266FF size = '5'>���ƿ�("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('likeCancel');
						}
					});
				} else {
					//���ƿ� ���
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'grey' size = '5'>���ƿ�(" + cnt + ')</FONT>');
							like.removeClass('likeCancel');
							like.addClass('like');
						}
					});
				}
			});
			
			$(".likeCancel").click(function(){
				var like = $(this);
				var postingCode = $("input:hidden[name=postingCode]").val();
				if(like.attr('class') === ('glyphicon glyphicon-heart myicon likeCancel')){
					//���ƿ� ���		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'grey' size = '5'>���ƿ�("+ cnt +")</FONT>");
							like.removeClass('likeCancel');
							like.addClass('like');
						}
					});
				} else {
					//���ƿ�
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 1266FF size = '5'>���ƿ�(" + cnt + ')</FONT>');
							like.removeClass('like');
							like.addClass('likeCancel');
						}
					});
				}
			});
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�/////////////////////////////////////////////////////////////////////////			
			$(".scrap").click(function(){
				var insertClass = $(this);
				var postingCode = $("input:hidden[name=postingCode]").val();
				
				if(insertClass.attr('class') === ('glyphicon glyphicon-tag myicon scrap')){
					var t = confirm("��ũ���� �Ͻðڽ��ϱ�?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 1266FF size = '5'>��ũ��(" + resultText +")</FONT>"
								insertClass.html(resultScrap);
								insertClass.removeClass("scrap");
								insertClass.addClass("scrapDelete");
							}
						});
					} else {
						return false ;
					}
				} else {
					var t = confirm("�̹� ��ũ���� �Ǿ��ֽ��ϴ�.\n �ش� ��ũ���� ����ðڽ��ϱ�?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'grey' size = '5'>��ũ��(" + resultText +")</FONT>"
									insertClass.html(resultScrap);
									insertClass.removeClass("scrapDelete");
									insertClass.addClass("scrap");
								}
							});
					} else {
						return false ;
					}
				}
			});
			$(".scrapCancel").click(function(){
				var deleteClass = $(this);
				var postingCode = $("input:hidden[name=postingCode]").val();
				
				if(deleteClass.attr('class') === ('glyphicon glyphicon-tag myicon scrapCancel')){
					var t = confirm("�̹� ��ũ���� �Ǿ��ֽ��ϴ�.\n �ش� ��ũ���� ����ðڽ��ϱ�?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'grey' size = '5'>��ũ��(" + resultText +")</FONT>"
								deleteClass.html(resultScrap);
								deleteClass.removeClass("scrapCancel");
								deleteClass.addClass("scrap");
							}
						});
					} else {
						return false ;
					}
				} else {
					var t = confirm("��ũ���� �Ͻðڽ��ϱ�?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 1266FF size = '5'>��ũ��(" + resultText +")</FONT>"
									deleteClass.html(resultScrap);
									deleteClass.removeClass("scrap");
									deleteClass.addClass("scrapCancel");
								}
							});
					} else {
						return false ;
					}
				}
			});			
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�/////////////////////////////////////////////////////////////////////			
		});
	</script>
<body style = "background-color:#EBEBEB">
<br><BR><br>   
   <!-- ������ ���� -->
<div class="container" style = "width:1000px;padding:0px" >
    <!-- left menu -->
   <div class ="container" style = "width:180px; float:left;padding:0px">
   <div class ="thumbnail"  style = "width:100%;margin-bottom:20px;" align = "center" >
      			<div class="unpa-card user-card followable followed">
                     <!-- Ŭ���� ����� ������ �̵� -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("<%=writerPicPath %>/<%=writerPicSaveName %>");'></div><br>
                        <div class="user-nickname"><%=writerName %></div>
                        <div class="user-skin-info">
   
                           <!-- �Ǻ� �Ǽ����� �������� -->
                           <div class="empty"><%=writerSkinType %></div>
                           <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                           <div class="empty"><%=writerSkinTone %></div>
                        </div><p><p><p>
                        <div class="user-count-info">
                           <div>
                              <!--  �ȷο� �� -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp<%=writerFollowerCnt %>
                           </div>
                           <!--  �۾� �� -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp<%=writerPostingCnt %>
                           </div>
                           <!-- ���ƿ� ���� ��  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp<%=writerPostingLikeCnt %>
                           </div>
                        </div>
                     </a>
<%
				if(!myReviewYn){
%>
                     <button class="user-follow-button followed">
                        <span class="glyphicon glyphicon-user"></span>!�ȷο� ��
                     </button>
<%
				}
%>
                  </div>
                  </div>
               <div class ="thumbnail"  style = "width:100%;" align = "center" >  
                  <div class = "" align = "center">
                  <p><p>
                  <img src = "<%=itemPicPath %>/<%=itemPicSaveName %>" style = "width:150px;height:100px;display:table;margin-left:auto;margin-right:auto">
                  <p>
                  <font><b><%=itemBrandName %></b></font><p>
                  <font><%=itemName %></font><p>
                  <font>
<%
					if(minPrice == maxPrice){
%>
						<%=maxPrice %>��
<%
					} else {
%>
						<%=minPrice %>�� ~ <%=maxPrice %>��
<%
					}
%>				  
				  </font><p>
<%
				if(!myReviewYn){
%>				  
                  <hr style = "margin-top:0px;margin-bottom:10px">
                  	<select style = "width:100px;height:26px;">
                  		<option value = "">�뷮</option>
                  		<option value = "ml">ml</option>
                  		<option value = "g">g</option>
                  	</select>
                  	<p>
                  <div class = "sameproduct" style = "background-color:#1266FF;height:30px;">
                  		<button style = "background-color:#1266FF;margin-top:3px" onClick = "sameProduct()" >
                  			<b><font color = "white">���� ��ǰ ����</font></b>
                  		</button>
                  </div>
<%
					}
%>	
                  </div>
                  </div>
   				</div>
   <!-- left menu �� -->
<!-- ���� ����-->   
    <!-- ���ƿ� ��� ��ũ�� -->
	<div class="container" style = "width:800px;padding:0px;float:right;" >
        <div class="thumbnail" style = "width:100%;margin-right:0px;padding:0px"><br>
			<div style="width: 100%;height:50px;padding:0px">
			<input type="hidden" name="postingCode" value="<%= reviewCode%>">
<%
						if(myLikeYn.equals("0")){ //���ƿ䰡 �ȴ����ִ� ����
%>
						<span class="glyphicon glyphicon-heart myicon like" style="width: 240px;height:100%;margin-left:20px; " align="center"> 
							<font size="5" color="grey">���ƿ�(<%=reviewLikeCnt%>)</font>
						</span>
<%
						} else if(myLikeYn.equals("1")){ //�̹� ���ƿ� �Ǿ��ִ� ����
%>
						<span class="glyphicon glyphicon-heart myicon likeCancel" style="width: 240px;height:100%;margin-left:20px; " align="center"> 
							<font size="5" color=1266FF>���ƿ�(<%=reviewLikeCnt%>)</font>
						</span>
<%
						}
%>
						<span class="glyphicon glyphicon-pencil myicon" style="width: 240px;height:100%; margin-left:20px;" align="center"> 
							<font size="5" color="black">���(<%=reviewReplyCnt%>)</font>
						</span>
<%
					if(!myReviewYn){
						if(myScrapYn.equals("0")){ //��ũ���� �ȴ����ִ� ����
%>
						<span class="glyphicon glyphicon-tag myicon scrap"	 style="width: 240px;height:100%; margin-left:20px;" align="center"> 
							<font size="5" color="grey">��ũ��(<%=reviewLikeCnt%>)</font>
						</span>
<%
						} else if(myLikeYn.equals("1")){ //�̹� ��ũ���� �Ǿ��ִ� ����
%>
						<span class="glyphicon glyphicon-tag myicon scrapCancel"	 style="width: 240px;height:100%; margin-left:20px;" align="center"> 
							<font size="5" color=1266FF>��ũ��(<%=reviewLikeCnt%>)</font>
						</span>
<%
						}
					}
%>
			</div>
	<!--  ����� ���� ������� --><hr style = "margin-top:0px;margin-bottom:20px">
			<div class="info" align="center">
				<div class="reviewTitle"  style = "margin-bottom:20px">
					<font size="5"><b>����</b></font>
				</div>
				<div class="brandInfo">			
					<img src="<%=reviewMainPicPath %>/<%=reviewMainPicSaveName %>" style="background-color: white; width: 400px; height: 300px">
				</div>
			</div>
	<!-- ���� �� --><hr style = "margin-top:20px;margin-bottom:20px">
            <div class="row hotitem" style = "margin-left:3%;margin-top:10px;width:94%;" align = "center">
            	<div class = "reviewInfo">
                  <%=reviewContent %>
				</div>
            </div>
	<!-- ���  ���� --><hr style = "margin-top:20px;margin-bottom:20px">
		<div class ="container" style = "width:760px;margin-left:20px;margin-right:20px;margin-bottom:10px;padding:0px;">
<%
       for(int i = 0; i < 6; i++) {
 %>
				<div class="review" style="width: 100%; height: 60px; padding: 0px;">
				
					<div class="replyimg col-sm-1" style="height: 100%; padding: 0px">
						<img src="images/yebin.jpg" class="img-circle reimgs" style="width: 60px; height: 60px">
					</div>
					
					<div class="name"	style="width: 685px; height:20px; float: left; margin-left:10px;margin-bottom:2px;">
						<font size="2"><b>�̸�</b></font> 
						<font size="1"	style="margin-left: 5px"><font color="gray">2015�� 6�� 8��</font></font>
					</div>
	
					<div class="name"	style="width: 685px; height: 38px; float: left; margin-left:10px;">
						<font size="2"> ��� ���� </font>
					</div>
					
				</div>
				
				<hr style = "margin-top:10px;margin-bottom:10px">
<%
	}
%>   
			</div>
        </div>
<!-- ���� ��-->
<!-- ���� ���� ����-->
		<div class="thumbnail" style = "width:800px;height:100px;padding:20px;">
			<div class="replywrite" style = "width:100%;padding:0px;background-color:yellow" >
				
				<div class="replyimg col-sm-1" style="height: 100%; padding: 0px">
					<img src="<%="" %>/<%="" %>" alt="" class="img-circle rewriteimg" style = "width:60px;height:60px;">
				</div>
				
				<div class="replyinsert col-sm-10" style = "float: left;">
					<input type="text" class="form-control insert" rows="1" style="resize:none;width:615px;height:60px"/>
				</div>
				
				<div class="replybtn col-sm-1"style = "float: left;" >
					<button style = "width:55px;height:55px;background-color:white">
				          <span class="glyphicon glyphicon-pencil rebtn" aria-hidden="true"></span>
					</button>
				</div>
				
			 </div>      
		</div>
	</div>
<!-- ���� ���� ��-->
</div>
</body>