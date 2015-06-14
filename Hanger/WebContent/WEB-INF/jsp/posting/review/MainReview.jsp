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
   <!-- ������ ���� -->
        <div class="container" style = "width:100%;">
    <!-- left menu -->
	<div class ="thumbnail" style = "width:16%;float:left;margin-left:3%;" align = "center" >
		<div class="unpa-card user-card followable  followed">
                     <!-- Ŭ���� ����� ������ �̵� -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("/images/juven.PNG");'></div><br>
                        <div class="user-nickname">���۱������</div>
                        <div class="user-skin-info">
   
                           <!-- �Ǻ� �Ǽ����� �������� -->
                           <div class="empty">���Է�</div>
                           <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                           <div class="empty">���Է�</div>
                        </div><p><p><p>
                        <div class="user-count-info">
                           <div>
                              <!--  �ȷο� �� -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp3
                           </div>
                           <!--  �۾� �� -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp1
                           </div>
                           <!-- ���ƿ� ���� ��  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp100
                           </div>
                        </div>
                     </a>
                     <button class="user-follow-button followed">
                        <span class="glyphicon glyphicon-user"></span> �ȷο� ��
                     </button>
                     <button class="user-follow-button">
                        <i class="unpacon-user"></i> �ȷο�
                     </button>
                  </div>
	</div>
	<!-- left menu �� -->
	
	<!-- ��ũ�� ��ũ��Ʈ -->
	<script>
		$(function(){
			$(".like").click(function(){
				var like = $(this);
				var postingCode = "<%=postingCode%>"
				if(like.attr('class') === ('glyphicon glyphicon-heart myicon like')){
					//���ƿ�		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>���ƿ� ���("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('cancel');
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
							like.html("<FONT color = 'black' size = '6'>���ƿ�(" + cnt + ')</FONT>');
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
					//���ƿ�		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>���ƿ� ���("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('cancel');
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
							like.html("<FONT color = 'black' size = '6'>���ƿ�(" + cnt + ')</FONT>');
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
					var t = confirm("�̹� ��ũ���� �Ǿ��ֽ��ϴ�.\n �ش� ��ũ���� ����ðڽ��ϱ�?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'black' size = '6'>��ũ��(" + resultText +")</FONT>"
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
					var t = confirm("��ũ���� �Ͻðڽ��ϱ�?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'red' size = '6'>��ũ��(" + resultText +")</FONT>"
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
					var t = confirm("��ũ���� �Ͻðڽ��ϱ�?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'red' size = '6'>��ũ��(" + resultText +")</FONT>"
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
					var t = confirm("�̹� ��ũ���� �Ǿ��ֽ��ϴ�.\n �ش� ��ũ���� ����ðڽ��ϱ�?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'black' size = '6'>��ũ��(" + resultText +")</FONT>"
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
    <!-- ���� �ۼ� ���� -->
        <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;"><br>
        	<div class = "select" style = "margin-top:10px" align = "center"><p>
				<div class = "top" style ="width:930px;height:50px">
				<input type="hidden" name="postingCode" value="<%= postingCode%>">
				<input type="hidden" name="checkScrap" value="<%=checkScrap%>">
					<%
						if(likeListSize == 0){
					%>
					<span class = "glyphicon glyphicon-heart myicon like">
						<font size = "6" color="black">���ƿ�(<%=cntLike %>)</font>
					</span>
					<%
						} else if(likeListSize == 1){
					%> 	
					<span class = "glyphicon glyphicon-heart myicon cancel"style = "margin-left:-1%">
						<font size = "6" color="black">���ƿ� ���(<%=cntLike %>)</font>
					</span>
					<%
						}
					%>
					<span class = "glyphicon glyphicon-pencil myicon" style="margin-left:100px">
						<font size = "6"color="black">���(15)</font>
					</span>
					<%
						if(checkScrap) {
					%>
					<span class = "glyphicon glyphicon-tag myicon scrapDelete"  style = "margin-left:150px">
						<font size = "6"color="red">��ũ��(<%= scrapList.size()%>)</font>
					</span>
					<%
						}else{
					%>
					<span class = "glyphicon glyphicon-tag myicon scrapInsert"  style = "margin-left:150px">
						<font size = "6"color="black">��ũ��(<%= scrapList.size()%>)</font>
					</span>
					<%
						}
					%>
					<br>		
				</div>
        	</div>
			<!-- ���� -->
			<hr>
				<div class = "info" style = "width:94%;margin-left:3%;margin-top:10px;" align = "center">
					<div class = "title" style = "width:100%;height:100px;">
						<div class = "brand">
							<font size = "4">�Ի��ζ�</font>
							<br><br>
						</div>
						<div class = "brandinfo" >
							<font size = "6"><b>���� �߸� �ٶٸ� ������ �� ���긣 �˿���(202)</b></font>
						</div>
					</div>
					<br><br>
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
					<div class = "like" style = "width:100%;height:auto;" align = "left">
						<font size = "4" style = "margin-left:12px">�̷��в� ��õ�� �����!</font><br><Br>
						<div class = "title" style = "height:auto;width:100%;">
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">����</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px;">
									�������� ���� ����� �̻��� �߻� ����� �̻��� ���ӷ� �ۻ��� �ϳ� ������ �۾��ø��������� ���
								</div>
							</div>
							<br>
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">����</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px">
									�ټ� ������ �۹߻��� ��ħ �ۿ��� ��Ѱ� ������ �� �� ����
								</div>
							</div>
							<br>
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">��õ</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px">
									�Լ��� �����ϰ� �ָ��� �����źе鲲 ��õ! �� ���� �Ӹ����� �߳����� ���Ѱ� �ְ��� �����ο� �θ� �嶯�̴ٶ�� �е鲴 ����õ.
								</div>
							</div>
						</div>
						<hr>
					</div>
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
				<div class ="review" style = "margin-left:3%;margin-top:10px;width:94%;">
<%
    	for(int i = 0 ; i < 6 ; i++) {
 %>		
 		<div class = "review" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="images/yebin.jpg" alt="����¥��" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b>���۱� �����</b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray">2015�� 6�� 8��</font></font>
			</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:5%;">
				<font size = "2">
					@��äs �����մϴ٢�@�����ϴ� �����ϴ�� �������̿��䢾 @�ӻ��� ��ī���ϴ礻���� �����⤻�� 
					��ǰ���� ���� ĳ��50d+���� ��Ʈ��Ҵ� 24-105mm�������־�䤻�� �̰͵� �鸸���� �����̳׿䤾���� 
					@Annelover ����ŭ�����ϼ����� ���ڳ׿뤻�� ���� �߾ƴ� ��ξ��ϰ� ����־�䤻����
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
