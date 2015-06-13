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
/**************************************TRIM ����****************************************/
		
/***************************************AJAX ����****************************************/
		var f = document.replyForm;
		var postingCodeVal = trim(f.postingCode.value);
		var replyContentVal = trim(f.replyContent.value);
		
		
		alert("AJAX ����");
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
   <!-- ������ ���� -->
        <div class="container" style = "width:100%;">
    
	
    <!-- ���� �ۼ� ���� -->
        <div class="thumbnail" style = "width:75%;display:table;margin-left:auto;margin-right:auto;"><br>
        	<div class = "select" style = "margin-top:10px" align = "center"><p>
				<div class = "top" style ="width:930px;height:50px">
					
					<span class = "glyphicon glyphicon-heart myicon" style = "margin-right:150px">
						<font size = "6" color="black">���ƿ�(25)</font>
					</span>
					<span class = "glyphicon glyphicon-pencil myicon" >
						<font size = "6"color="black">���(15)</font>
					</span>
					<span class = "glyphicon glyphicon-tag myicon" style = "margin-left:150px">
						<font size = "6"color="black">��ũ��(5)</font>
					</span>
					<br>		
				</div>
        	</div>
			<!-- ���� -->
			<hr>
				<div class = "info" style = "width:94%;margin-left:3%;margin-top:10px;" align = "center">
					<div class = "title" style = "width:100%;height:auto;">
						<div class = "brandinfo" >
							<font size = "6"><b>���� �߸� �ٶٸ� ������ �� ���긣 �˿���(202)</b><BR></font>
						</div>
					</div>
					 <div class="row headinfo">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6 headconf">
                        	<div class="col-sm-4 headinfoimg">
                        		<img src="images/wonbin.PNG" alt="" class="img-circle rewriteimg" style = "width:50px;height:50px;">
                        		&nbsp&nbsp&nbsp�ڻ��
                        	</div>
                        	<div class="col-sm-4 headinfotext unpa-card user-card followable  followed">
                        		
                        		<div class="user-skin-info uki">
                           			<!-- �Ǻ� �Ǽ����� �������� -->
                           			<div class="empty">���Է�</div>
                           			<!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                           			<div class="empty">���Է�</div>
                        		</div>
                        	</div>
                        	<div class="col-sm-4 headinfotext">
                        		<div class="user-count-info uki" style="float:left;">
                        		   <div>
                              		<!--  �ȷο� �� -->
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
						<font size = "3" style = "margin-right:15px"><font color = "gray">����</font></font>
						<font size = "4" style = "margin-right:150px">17,500��</font>
						<font size = "3" style = "margin-right:15px"><font color = "gray">�뷮</font></font>
						<font size = "4" style = "margin-right:150px">0.5g</font>
						<font size = "3" style = "margin-right:15px"><font color = "gray">�������</font></font>
						<font size = "4" >���Ŀ�ӽ�</font>
					</div>
					<hr>
					
				</div>
			<!-- �α��ǰ -->
				<div class="row hotitem" style = "margin-left:3%;margin-top:10px;width:94%;" align = "center">
					<div class = "userinfo">
						�ȳ��ϼ���~ �����񳢿���! �Ŀ������ 5�ָ��� �˳׿�... �� �ð����� ��ٷ��ֽ� �е�(�ֱ���Ϸ���) �˼��ϰ� ������
						���� ������ ������ ȭ���� ����� ƾƮ�� �Ի��ζ� ƾƮ�� ���� �����غôµ��, �̹��� ���Ӱ� ��õ� �˿��Ͷ������� ���ϴ�!
						���� ������ �÷��� 202ȣ����. ��ȫ�����鼭�� ��������� �����̳��� ���� ���� �Լ��� ���� ������ ���̰� �� ������ �� ���尡�� �׽�Ʈ �� �غ�����!
						�߻��� �ߵǸ鼭 ���ð��� �������� ������ �����ؼ� �������� �Լ��� ������� ���� �߸���? ���̰� �����̴� ����? �׸��� �߻��� ��ġ�� �� ������ ���� ���� ���� �ʴ��󱸿�.
						�� �������� ����� ��ΰ� ���� �����⿴��ϴ�! (�Ի��� �ǰ��� ���� �����. �Ի����İŵ��.) 
						<div class = "image" align = "center">
							<br><img src = "images/review1.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						�Ի�ƾƮ�� ���̽��� ���ڵ� �����ϰ� �ϴ� ����� ����������
						<br>
						<div class = "image" align = "center">
							<br><img src = "images/review3.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						�� ���������� ���ø������Ͱ� �����󱸿�. 45���� ������ �־ �Լ��� �����ϱ� ���� �����̸� ���� �����ؼ� �Լ���� �Բ������� �����ϰ� �ٸ� �� �ְ� ���ִ��󱸿�!
						<br>
						<div class = "image" align = "center">
							<br><img src = "images/review4.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						Ǯ �߻��̿���. ������ �ڼ��� ���ø� ������ �ϰ� �߻��Ȱ� ���̽� �ſ���. ��ħ�� �ִ� ������... ¸�ϰ� �߻��Ϸ��� 2~3�� �߻��ؾ��ϴµ� �׸�ŭ �Լ��� ����������...¸�� �߻��� ���Ͻô� �е��� ������ �Ի�ƾƮ�� �����Ͻô°� ��������.
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
				<img src="<%= userPicPath %>/<%= userPicSaveName %>" alt="����¥��" class="img-circle reimgs" style = "width:100px;height:100px">
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
