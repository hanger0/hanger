<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "com.hanger.posting.review.vo.ReviewShowVo" %>
<%@ page import = "com.hanger.reply.vo.ReplyVo" %>
<%@ page import = "java.util.*" %>

<%
	String myUserCode = (String)session.getAttribute("myUserCode");
	String myUserPicPath = (String)session.getAttribute("myUserPicPath");
	String myUserPicSaveName = (String)session.getAttribute("myUserPicSaveName");
	List<ReviewShowVo> reviewList = (List<ReviewShowVo>)request.getAttribute("reviewList");
	List<ReplyVo> replyList = (List<ReplyVo>)request.getAttribute("replyList");
   
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

			/***************************************AJAX ����****************************************/
			$('#replyBtnName').click(function(){
				if(trim($('#replyContent').val()) === "")
				{
					$('#replyContent').select();
					return false;
				}
				replyAction();
			});
	
			$('#replyContent').keypress(function(event){
				if(event.keyCode == 13)
				{
					if(trim($('#replyContent').val()) === "")
					{
						$('#replyContent').select();
						return false;
					}
					replyAction();				
					return false;
				}
			});
			function replyAction(){
				var replyinsBtn = $(this);
				var replyContentVal = $('#replyContent').val();
				var checkReplyVal = "Insert";
				var reviewCodeVal = "<%=reviewCode%>";
				$.ajax({
					type: "POST", 
					url: "/reviewShow.hang",
					dataType: "text",
					data: "reviewCode=" + reviewCodeVal + "&replyContent=" + replyContentVal +"&checkReply="+ checkReplyVal,
					
					success: function(text){
						var result = trim(text);
							$('#ajaxReviewList').append(result);
							$('#replyContent').val("");
					},
					error:function(request,status,error){
				        alert("�Ф�code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});	
				e.preventDefault();
			}
			
			$(".replyDeleteBtn").click(function(e){
				var replyDelBtn = $(this);		
				var deleteReplyCode = replyDelBtn.attr("replyCode");
				var deleteCheckReply = "Delete";
				var reviewCodeVal = "<%=reviewCode%>";
				var t = confirm("����� ���� �Ͻðڽ��ϱ�?");
				
				if(t){
					$.ajax({
						type: "POST", 
						url: "/reviewShow.hang",
						dataType: "text",
						data: "replyCode=" + deleteReplyCode + "&reviewCode=" + reviewCodeVal +"&checkReply="+ deleteCheckReply,
						success: function(text){
							var result = trim(text);
								replyDelBtn.parent("div").parent("div").hide();
						},
						error:function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    }
					});
				}else{
					return false;
				}
				e.preventDefault();
			});
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�///////////////////////////////
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�///////////////////////////////
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�///////////////////////////////
			$(".replyUpdateBtn").click(function(e){
				var replyUdtBtn = $(this);
				var updateReplyCode = replyUdtBtn.attr("replyCode");
				var updateCheckReply = "Update";
				var reviewCodeVal = "<%=reviewCode%>";
				var replyContent = $('[class=replyCont]').text();
				var replyUdtParent = replyUdtBtn.parent().parent();
				var t = confirm("����� �����Ͻðڽ��ϱ�?");
				
				if (replyUdtParent.attr('class') === ('review replyUdtClass')){
					if (t) {
					$.ajax({
						type: "POST", 
						url: "/reviewShow.hang",
						dataType: "text",
						data: "replyCode=" + updateReplyCode + "&reviewCode=" + reviewCodeVal +"&checkReply="+ updateCheckReply +
							 "&replyContent=" + replyContent,
						
						success: function(text){
							alert("��� ���� ����");
							var result = trim(text);
								checkReplyVal = "Update";
								alert("checkReplyVal ="+ checkReplyVal);
								replyUdtParent.html(result);
								replyUdtParent.addClass('replyUdtClassIns');
								replyUdtParent.removeClass('replyUdtClass');
						},
						error:function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					    }
					});
					} else{
						return false;
					}
				}
				/*else if (replyUdtParent.attr('class') === ('review replyUdtClassIns')){
				}*/
				e.preventDefault();
			});
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

					<a href="/myPage.hang?yourUserCode=<%=writerCode%>">
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
                  <A href="/itemView.hang?itemGroupCode=<%=itemGroupCode%>">
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
				  </font>
				  </A>
				  <p>
<%
				if(!myReviewYn){
%>				  
                  <hr style = "margin-top:0px;margin-bottom:10px">
                  	<select style = "width:100px;height:26px;">
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
							<font size="5" color="grey">��ũ��(<%=reviewScrapCnt%>)</font>
						</span>
<%
						} else if(myScrapYn.equals("1")){ //�̹� ��ũ���� �Ǿ��ִ� ����
%>
						<span class="glyphicon glyphicon-tag myicon scrapCancel"	 style="width: 240px;height:100%; margin-left:20px;" align="center"> 
							<font size="5" color=1266FF>��ũ��(<%=reviewScrapCnt%>)</font>
						</span>
<%
						}
					}
%>
			</div>
	<!--  ����� ���� ������� --><hr style = "margin-top:0px;margin-bottom:20px">
			<div class="info" align="center">
				<div class="reviewTitle"  style = "margin-bottom:20px">
					<font size="5"><b><%=reviewTitle%></b></font>
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
		<div class ="container" id="ajaxReviewList" style = "width:760px;margin-left:20px;margin-right:20px;margin-bottom:10px;padding:0px;">
<%
			if(replyList!=null&&replyList.size()>0)
			{						
				for(int i = 0; i < replyList.size(); i++) {
					ReplyVo rv= replyList.get(i);					
 %>
				<div class = "review replyUdtClass" style="width: 100%; height: 60px; padding: 0px;">
					<a href="/myPage.hang?yourUserCode=<%=rv.getUserCode()%>">
					<div class="replyimg col-sm-1" style="height: 100%; padding: 0px;">
						<img src="<%=rv.getUserPicPath()%>/<%=rv.getUserPicSaveName() %>" class="img-circle reimgs" style="width: 60px; height: 60px">
					</div>
					
					<div class="name"	style="width: 600px; height:20px; float: left; margin-left:10px;margin-bottom:2px;">
						<font size="2"><b><%=rv.getUserName() %></b></font> 
						<font size="1"	style="margin-left: 5px"><font color="gray"><%=rv.getUpdDate() %> </font></font>
					</div>
					</a>

<%
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�/////////////////////////////////////////////////////////////////////
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�/////////////////////////////////////////////////////////////////////
//////////////////////////////////�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١�/////////////////////////////////////////////////////////////////////					
				if(((String)rv.getUserCode()).equals(myUserCode))
				{
%>
					<div class="updateDelete" style="float:right;">
						<a class="replyUpdateBtn" replyCode="<%=rv.getReplyCode()%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
						<a class="replyDeleteBtn" replyCode="<%=rv.getReplyCode()%>"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>	
					</div>
<%
				}
%>
					<div class="name"	style="width: 685px; height: 38px; float: left; margin-left:10px;">
						<font size="2"> <%=rv.getReplyContent() %> </font>
					</div>
					
				</div>
				
				<hr style = "margin-top:10px;margin-bottom:10px">
<%
				}
			}
%>   
			</div>
        </div>
<!-- ���� ��-->
<!-- ���� ���� ����-->
		<div class="thumbnail" style = "width:800px;height:100px;padding:20px;">
			<div class="replywrite" style = "width:100%;padding:0px;background-color:yellow" >				
				<div class="replyimg col-sm-1" style="height: 100%; padding: 0px">
					<img src="<%=myUserPicPath %>/<%=myUserPicSaveName %>" alt="" class="img-circle rewriteimg" style = "width:60px;height:60px;">
				</div>
				
				<div class="replyinsert col-sm-10" style = "float: left;">
					<input type="text" name="replyContent" id="replyContent" class="form-control insert" rows="1" style="resize:none;width:615px;height:60px"/>
				</div>
				
				<div class="replybtn col-sm-1"style = "float: left;" >
					<button style = "width:55px;height:55px;background-color:white" id="replyBtnName">
				          <span class="glyphicon glyphicon-pencil rebtn" aria-hidden="true"></span>
					</button>
				</div>				
			 </div>      
		</div>
	</div>
<!-- ���� ���� ��-->
</div>
</body>