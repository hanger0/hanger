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
   <!-- 凪戚走 獣拙 -->
        <div class="container" style = "width:100%;">
    <!-- left menu -->
	<div class ="thumbnail" style = "width:16%;float:left;margin-left:3%;" align = "center" >
		<div class="unpa-card user-card followable  followed">
                     <!-- 適遣獣 紫遂切 舛左稽 戚疑 -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("/images/juven.PNG");'></div><br>
                        <div class="user-nickname">疑拙姥紫櫛号</div>
                        <div class="user-skin-info">
   
                           <!-- 杷採 闇失昔走 走失昔走 -->
                           <div class="empty">耕脊径</div>
                           <!-- 杷採 護硲昔走 ex 23硲 -->
                           <div class="empty">耕脊径</div>
                        </div><p><p><p>
                        <div class="user-count-info">
                           <div>
                              <!--  独稽酔 呪 -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp3
                           </div>
                           <!--  越彰 呪 -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp1
                           </div>
                           <!-- 疏焼推 閤精 呪  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp100
                           </div>
                        </div>
                     </a>
                     <button class="user-follow-button followed">
                        <span class="glyphicon glyphicon-user"></span> 独稽酔 掻
                     </button>
                     <button class="user-follow-button">
                        <i class="unpacon-user"></i> 独稽酔
                     </button>
                  </div>
	</div>
	<!-- left menu 魁 -->
	
	<!-- 什滴窪 什滴験闘 -->
	<script>
		$(function(){
			$(".like").click(function(){
				var like = $(this);
				var postingCode = "<%=postingCode%>"
				if(like.attr('class') === ('glyphicon glyphicon-heart myicon like')){
					//疏焼推		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>疏焼推 昼社("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('cancel');
						}
					});
				} else {
					//疏焼推 昼社
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>疏焼推(" + cnt + ')</FONT>');
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
					//疏焼推		
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>疏焼推 昼社("+ cnt +")</FONT>");
							like.removeClass('like');
							like.addClass('cancel');
						}
					});
				} else {
					//疏焼推 昼社
					$.ajax({
						type: "POST", 
						url: "/reviewLikeCheck.hang",
						dataType: "text",
						data: "postingCode="+postingCode,
						success: function(text){
							var cnt = trim(text);
							like.html("<FONT color = 'black' size = '6'>疏焼推(" + cnt + ')</FONT>');
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
					var t = confirm("戚耕 什滴窪戚 鞠嬢赤柔艦陥.\n 背雁 什滴窪聖 走酔獣畏柔艦猿?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'black' size = '6'>什滴窪(" + resultText +")</FONT>"
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
					var t = confirm("什滴窪聖 馬獣畏柔艦猿?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'red' size = '6'>什滴窪(" + resultText +")</FONT>"
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
					var t = confirm("什滴窪聖 馬獣畏柔艦猿?");
					if(t){	
						$.ajax({
							type:"POST",
							url:"/scrap.hang",
							dataType:"text",
							data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
							success:function(text){
								var resultText = trim(text);
								var resultScrap = "<FONT color = 'red' size = '6'>什滴窪(" + resultText +")</FONT>"
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
					var t = confirm("戚耕 什滴窪戚 鞠嬢赤柔艦陥.\n 背雁 什滴窪聖 走酔獣畏柔艦猿?");
					if(t){	
						$.ajax({
								type:"POST",
								url:"/scrap.hang",
								dataType:"text",
								data:"postingCode=" + postingCode + "&checkScrap="+checkScrap,
								success:function(text){
									var resultText = trim(text);
									var resultScrap = "<FONT color = 'black' size = '6'>什滴窪(" + resultText +")</FONT>"
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
    <!-- 軒坂 拙失 獣拙 -->
        <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;"><br>
        	<div class = "select" style = "margin-top:10px" align = "center"><p>
				<div class = "top" style ="width:930px;height:50px">
				<input type="hidden" name="postingCode" value="<%= postingCode%>">
				<input type="hidden" name="checkScrap" value="<%=checkScrap%>">
					<%
						if(likeListSize == 0){
					%>
					<span class = "glyphicon glyphicon-heart myicon like">
						<font size = "6" color="black">疏焼推(<%=cntLike %>)</font>
					</span>
					<%
						} else if(likeListSize == 1){
					%> 	
					<span class = "glyphicon glyphicon-heart myicon cancel"style = "margin-left:-1%">
						<font size = "6" color="black">疏焼推 昼社(<%=cntLike %>)</font>
					</span>
					<%
						}
					%>
					<span class = "glyphicon glyphicon-pencil myicon" style="margin-left:100px">
						<font size = "6"color="black">奇越(15)</font>
					</span>
					<%
						if(checkScrap) {
					%>
					<span class = "glyphicon glyphicon-tag myicon scrapDelete"  style = "margin-left:150px">
						<font size = "6"color="red">什滴窪(<%= scrapList.size()%>)</font>
					</span>
					<%
						}else{
					%>
					<span class = "glyphicon glyphicon-tag myicon scrapInsert"  style = "margin-left:150px">
						<font size = "6"color="black">什滴窪(<%= scrapList.size()%>)</font>
					</span>
					<%
						}
					%>
					<br>		
				</div>
        	</div>
			<!-- 娃維 -->
			<hr>
				<div class = "info" style = "width:94%;margin-left:3%;margin-top:10px;" align = "center">
					<div class = "title" style = "width:100%;height:100px;">
						<div class = "brand">
							<font size = "4">脊持稽櫛</font>
							<br><br>
						</div>
						<div class = "brandinfo" >
							<font size = "6"><b>欠相 在牽 荷禽牽 今牽艦 焼 傾崎牽 橡趨斗(202)</b></font>
						</div>
					</div>
					<br><br>
					<hr>
					<div class = "product" style = "width:100%;height:30px;">
						<font size = "3" style = "margin-right:15px"><font color = "gray">亜維</font></font>
						<font size = "4" style = "margin-right:150px">17,500据</font>
						<font size = "3" style = "margin-right:15px"><font color = "gray">遂勲</font></font>
						<font size = "4" style = "margin-right:150px">0.5g</font>
						<font size = "3" style = "margin-right:15px"><font color = "gray">姥古舌社</font></font>
						<font size = "4" >珠屡朕袴什</font>
					</div>
					<hr>
					<div class = "like" style = "width:100%;height:auto;" align = "left">
						<font size = "4" style = "margin-left:12px">戚訓歳臆 蓄探背 球形推!</font><br><Br>
						<div class = "title" style = "height:auto;width:100%;">
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">舌繊</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px;">
									神掘亜澗 韻澱 】汝液 戚雌税 降事 】汝液 戚雌税 走紗径 】事姶 馬貝 魁鎧捜 】嬢巴軒追戚斗税 乞丞
								</div>
							</div>
							<br>
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">舘繊</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px">
									陥社 廻旋績 】降事戚 攻徴 】蝕獣 搾術闇 舌繊戚 吃 呪 蒸走
								</div>
							</div>
							<br>
							<div class= "row" style="height:auto;">
								<div class="col-sm-1 col1">
									<center>
										<font size = "4"><font color = "orange">蓄探</font></font>
										</center>
								</div>
								<div class="col-sm-11"style="width:90%;margin-top:8px">
									脊綬戚 闇繕馬壱 爽硯戚 弦生重歳級臆 蓄探! 焼 蟹澗 袴軒採斗 降魁猿走 畷廃惟 置壱昔 切政昔拭 塾檎 舌強戚陥虞澗 歳級牡 搾蓄探.
								</div>
							</div>
						</div>
						<hr>
					</div>
				</div>
			<!-- 昔奄雌念 -->
				<div class="row hotitem" style = "margin-left:3%;margin-top:10px;width:94%;" align = "center">
					<div class = "userinfo">
						照括馬室推~ 備晦費晦拭推! 督趨軒坂稽 5爽幻拭 宰革食... 延 獣娃疑照 奄陥形爽重 歳級(赤奄澗馬形蟹) 阻勺馬壱 壱舷戎陥
						薦亜 梱牽壱 梱牽揮 鉢薦税 食壕酔 鴇闘昔 脊持稽櫛 鴇闘研 球巨嬢 姥古背挫澗巨推, 戚腰拭 歯罫惟 窒獣吉 橡趨斗虞昔生稽 賜岩艦陥!
						薦亜 姥古廃 鎮君澗 202硲拭推. 陥畠旭生檎辞亀 傾球神兄走 汗界戚蟹推 沙搭 事引 脊綬拭 擾聖 凶人税 託戚亜 岨 赤生艦 伽 古舌亜辞 砺什闘 伽 背左室推!
						降事戚 設鞠檎辞 韻澱姶亀 神掘亜壱 事姶戚 神孔背辞 疏紹走幻 脊綬戚 畷照馬走 省精 降顕失? 巷位壱 廻旋戚澗 汗界? 益軒壱 降事戚 攻帖澗 依 凶庚拭 謝戚 弦戚 亜遭 省希虞姥推.
						薦 鯵昔旋昔 衣経精 搾塾壱 森斯 床傾奄心岩艦陥! (脊持拭 焦姶舛 箭企 蒸嬢推. 脊持幾板暗窮推.) 
						<div class = "image" align = "center">
							<br><img src = "images/review1.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						脊持鴇闘税 追戚什澗 食切級 宿梯馬惟 馬澗 壱厭遭 巨切昔戚倉
						<br>
						<div class = "image" align = "center">
							<br><img src = "images/review3.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						穿 鯵昔旋生稽 嬢巴軒追戚斗亜 疏希虞姥推. 45亀稽 奄随嬢閃 赤嬢辞 脊綬拭 腔鐸馬奄 疏精 唖亀戚悟 魁戚 始膳背辞 脊綬至引 脊何軒楕聖 舛嘘馬惟 郊研 呪 赤惟 背爽希虞姥推!
						<br>
						<div class = "image" align = "center">
							<br><img src = "images/review4.jpg" style = "width:450px;height:300px"/>
						</div>
						<br>
						熱 降事戚拭推. 紫遭聖 切室備 左獣檎 杖決旗決 馬惟 降事吉惟 左戚叔 暗拭推. 攻徴戚 赤舘 倶戚倉... 存馬惟 降事馬形檎 2~3腰 降事背醤馬澗汽 益幻鏑 脊綬戚 災畷背走澗...存廃 降事聖 据馬獣澗 歳級精 奄糎税 脊持鴇闘研 姥古馬獣澗杏 映舌球形推.
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
				<img src="images/yebin.jpg" alt="森朔促誓" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b>疑拙姥 紫櫛号</b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray">2015鰍 6杉 8析</font></font>
			</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:5%;">
				<font size = "2">
					@神辰s 姶紫杯艦陥⊂@君鷺軒馬雁 君鷺軒馬雁還 神沓幻戚森推⊂ @屍思戚 肉朝捷艦雁せせせ 今傾奄せせ 
					薦念痔精 亜懐 蝶轄50d+兄綜 随闘虞社莞 24-105mm承凶亀赤嬢推せせ 戚依亀 拷幻鰍穿 政弘戚革推ぞぞぞ 
					@Annelover 煽幻鏑幻膳馬写生檎 疏畏革遂せせ 煽澗 止焼澗 壱肯照馬壱 紫壱赤嬢推せせせ
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
