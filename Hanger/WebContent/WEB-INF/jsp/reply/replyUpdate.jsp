<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.hanger.reply.vo.ReplyVo" %>
<%@ page import="java.util.*" %>
<%
	String udtReplyCode = (String)request.getAttribute("udtReplyCode");
	String udtReviewCode = (String)request.getAttribute("udtReviewCode");
	String udtCheckReply = (String)request.getAttribute("udtCheckReply");
	String udtReplyName = (String)request.getAttribute("replyName");
	//System.out.println("udtReplyCode111111111111 : " + udtReplyCode);
	//System.out.println("udtReviewCode11111111111 : " + udtReviewCode);
	//System.out.println("udtCheckReply11111111111 : " + udtCheckReply);
	//System.out.println("udtReplyName11111111111 : " + udtReplyName);
	ArrayList<ReplyVo> replyList = (ArrayList<ReplyVo>)request.getAttribute("replyList");

	if(replyList != null){
		
			ReplyVo reply = replyList.get(replyList.size()-1);
			String replyContent = reply.getReplyContent();
			String replyCode = reply.getReplyCode();
			String replyName = reply.getUserName();
			String userPicPath = reply.getUserPicPath();
			String userPicSaveName = reply.getUserPicSaveName();
			String updDate = reply.getUpdDate();
			String updId = reply.getUpdId();
			String updIp = reply.getUpdIp();
			//System.out.println("replyContent : "+ replyContent);
%>
<SCRIPT>

$(function(){
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
	$("#replyUdtInsBtn").click(function(e){
		
		var replyUdtInsBtn = $(this);
		var updateReplyCode = "<%= udtReplyCode%>";		
		var replyContent = $('input[name=replyUdtContent]').val();	
		var replyUdtParent = replyUdtInsBtn.parent().parent();
		var replyChange = replyUdtInsBtn.parent();
		var udtReviewCode = "<%= udtReviewCode %>";
		var replyName = "<%=replyName%>";
		var udtCheckReply = "UpdateInsert";
		var t = confirm("댓글을 삭제하시겠습니까?");
		
		if(t){
			$.ajax({
				type: "GET", 
				url: "/reviewShow.hang",
				dataType: "text",
				data: "replyCode=" + updateReplyCode + "&reviewCode=" + udtReviewCode +  "&replyContent=" + replyContent
						+ "&checkReply=" + udtCheckReply + "&replyName=" + replyName,	
				success: function(text){
					alert("댓글 수정 진입");
					alert("replyContent : "+ replyContent);
					var result = trim(text);
					$('#hide').hide();
					replyUdtParent.html(result);
					replyUdtParent.addClass('replyUdtClass');
					replyUdtParent.removeClass('replyUdtClassIns');
					alert("변경끄읕");
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}else {
			return false;
		}
	e.preventDefault();
	});
});
</SCRIPT>

<div class = "review replyUdtClassIns" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="<%= userPicPath %>/<%= userPicSaveName %>" alt="" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b><%=replyName %></b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray"><%= updDate %></font></font>
			</div>
			<div class="updateDelete" style="float:right;">
					<a class="replyUpdateBtn" replyCode="<%= replyCode%>" checkReply ="Update"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
					<a class="replyDeleteBtn" replyCode="<%= replyCode%>" checkReply ="Delete"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
			</div>	
			<br>
			<BR>
			<div id="hide" class = "name replyCont" style = "width:75%;height:60px;float:left;margin-left:5%;">
				<font size = "2">
<form role="form" id="replyForm" name="replyForm" method="GET">				
					<input type="text" name="replyUdtContent" class="form-control update" rows="1" style="resize:none;width:100%;height:50px"/>
				</font> 
			</div>
			<div>
				<button style = "width:50px;height:50px"id="replyUdtInsBtn">
					<span class="glyphicon glyphicon-pencil rebtn" aria-hidden="true"></span>
				</button>
			</div>
</form>			
</div>
<%
	}
%>