<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.hanger.reply.vo.ReplyVo" %>
<%@ page import="java.util.*" %>

<%
	String replyContent = (String)request.getAttribute("replyContent");
	String replyCode = (String)request.getAttribute("udtReplyCode");
	String myUserCode = (String)session.getAttribute("myUserCode");
	String myUserName = (String)session.getAttribute("MyUserName");
	String udtReviewCode = (String)request.getAttribute("udtReviewCode");
	//String replyName = (String)request.getAttribute("replyName");
	ArrayList<ReplyVo> replyList = (ArrayList<ReplyVo>)request.getAttribute("replyList");
	System.out.println("myUserName33 : " + myUserName);
	System.out.println("replyContent33 : " + replyContent);
%>

<%
	if(replyList != null){
			ReplyVo reply = replyList.get(replyList.size()-1);
			String userCode = reply.getUserCode();	
			String replyUseYn = reply.getReplyUseYn();
			String userPicPath = reply.getUserPicPath();
			String userPicSaveName = reply.getUserPicSaveName();
			String updDate = reply.getUpdDate();
			String userName = reply.getUserName();

			System.out.println("/*/*/*/*/*/");
			System.out.println("myUserCode : "+ myUserCode);
			System.out.println("userCode : "+ userCode);
			System.out.println("replyUseYn : " + replyUseYn);
%>
<SCRIPT>
$(function(){
	$(".replyDeleteBtn").click(function(e){
		var replyDelBtn = $(this);		
		var deleteReplyCode = replyDelBtn.attr("replyCode");
		var deleteCheckReply = replyDelBtn.attr("checkReply")
		var reviewCodeVal = "<%= udtReviewCode%>";
		var replyUseYnVal = "<%= replyUseYn %>";
		var t = confirm("댓글을 삭제하시겠습니까?");
		
		if(t){
			$.ajax({
				type: "GET", 
				url: "/reviewShow.hang",
				dataType: "text",
				data: "replyCode=" + deleteReplyCode + "&reviewCode=" + reviewCodeVal +"&checkReply="+ deleteCheckReply,
				
				success: function(text){
					alert("댓글 삭제 진입");
					var result = trim(text);
						alert(checkReplyVal="Delete");
						checkReplyVal = "Delete";
						replyDelBtn.parent("div").parent("div").hide();
						alert("hide 되나요");
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});	
			e.preventDefault();
		}else{
			return false;
		}
	});
	$(".replyUpdateBtn").click(function(e){
		var replyUdtBtn = $(this);
		var updateReplyCode = replyUdtBtn.attr("replyCode");
		var updateCheckReply = replyUdtBtn.attr("checkReply");
		var reviewCodeVal = "<%= udtReviewCode%>";
		var replyContent = $('[class=replyCont]').text();
		var replyUdtParent = replyUdtBtn.parent().parent();
		
		if (replyUdtParent.attr('class') === ('review replyUdtClass')){
			alert("AJAX시작 전에 class 잘 받았니? : "+ replyUdtParent);
			$.ajax({
				type: "GET", 
				url: "/reviewShow.hang",
				dataType: "text",
				data: "replyCode=" + updateReplyCode + "&reviewCode=" + reviewCodeVal +"&checkReply="+ updateCheckReply +
					 "&replyContent=" + replyContent,
				
				success: function(text){
					alert("댓글 수정 진입");
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
		}
		/*else if (replyUdtParent.attr('class') === ('review replyUdtClassIns')){
		}*/
		e.preventDefault();
	});
});
</SCRIPT>
	
	
 		<div class = "review replyUdtClass" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="<%= userPicPath %>/<%= userPicSaveName %>" alt="" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b><%=userName %></b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray"><%= updDate %></font></font>
			</div>
			<div class="updateDelete" style="float:right;">
					<a class="replyUpdateBtn" replyCode="<%= replyCode%>" checkReply ="Update"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
					<a class="replyDeleteBtn" replyCode="<%= replyCode%>" checkReply ="Delete"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>	
			</div>	
			<br>
			<BR>
			<div class = "name replyCont" style = "width:700px;height:60px;float:left;margin-left:5%;">
				<font size = "2">
					<%= replyContent %>
				</font> 
			</div>
		</div>
	<HR>
<%
    	
	}
%>	