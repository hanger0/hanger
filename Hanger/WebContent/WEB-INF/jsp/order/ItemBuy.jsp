<%@ page contentType="text/html;charset=euc-kr" %>

    <body class="ourBody" style = "background-color:#EBEBEB">
        <div class="container">
       	<BR><BR><BR>
       	<div class="thumbnail">
    		<div class="header" style = "width:980px;height:500px;margin-left:80px">
        		<div class="product-info" style = "background-color:white;width:980px;height:500px;border:1px gray">
					<div class = "product" 
					style = "width:460px;height:460px;background-image:url(/assets/images/hanger.png);float:left;margin-left:20px;margin-top:20px">
					</div>
					<div class = "product-subject" style = "width:447px;height:460px;float:right">
						<div class = "subTitle"><p><h5>2015 S/S 아방가르드 디자인의 수분 크림 팩트</h5></p>
						</div>
					<div class = "titleFW"><p><h3>[루나] 아방가르드 파운팩트</h3></p>
					</div>
					
					<ul class="nav nav-pills">
				  <a> <li role="presentation" class="btn btn-default" >무료배송</li></a>
				  <a> <li role="presentation" class="btn btn-default" >업체배송</li></a>
				</ul>
					
					<HR style="border: 1px solid gray">
					<TABLE>
						<TR>
							<TD style = "width:108px;height:30px">정상가</TD>
							<TD><STRIKE>28,000원</STRIKE><font color = "red">&nbsp;&nbsp;&nbsp;29%</font></TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">할인 판매가</TD>
							<TD>19,800원</TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">배송비</TD>
							<TD><B>무료배송</B></TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">고객만족도</TD>
	                		<TD><a href = "#">4개의 리뷰</a></TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">옵션 선택</TD>
							<TD>
								옵션 선택 기입 해야 함						
							</TD>
						</TR>
					</TABLE>
				<HR style="border: 1px solid gray">
				<div class = "productPrice" style = "width:200px;height:50px;align:right">총 상품 금액 :<font size = "5" ><font color = "red">19,800</font></font> 원</div>
				<div class = "buy" align = "center">
				
				<ul class="nav nav-pills">
				  <li role="presentation" class="butn btn-default" style = "width:228px;height:40px;align:center;margin-left:120px"><a href="/cart.hang"><B>구매하기 / 담기</B></a></li>
				</ul>
				</div>
			</div>
         </div>
    </div>
    </div>
	<BR>
	<BR>

	<script>
	$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})
	</script>

	<!-- 상품 정보 문서화 시작 -->
	<div class="thumbnail" style = "width:100%;height:300px;">
	<div class = "product-munsu" style = "width:100%;height:300px;"><BR>
		<div class = "title" style = "margin-left:22px;"><font size = "4"><B>상품 정보</B></font></div>
		
		<div role="tabpanel">

		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist" style = "margin-left:-5px">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
		    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
		    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">이곳은 화장품의 설명이 들어가는 곳 입니다.</div>
		    <div role="tabpanel" class="tab-pane" id="profile">제품명 : 에뛰드 하우스 진주 광채 오로라 에센스 로션</div>
		    <div role="tabpanel" class="tab-pane" id="messages">테이블을 써서 표 형식으로 작성해도 됩니다..</div>
		    <div role="tabpanel" class="tab-pane" id="settings">줄여도 됩니다.</div>
		  </div>
		
	</div>
	</div>
	</div>
	<!-- 상품 정보 문서화 끝 -->
	
	<BR>
	<BR>
	
	<!-- 팔로우 리뷰 작성 시작 -->
	<div class="thumbnail" style = "background-color:white;width:100%;"><BR>
    	<div class = "title" style = "margin-left:22px;"><font size = "4"><B>상품 이미지(상세)</B></font></div>
    		<div class="field description-wrap">
    			<div class = "etc" align = "center">
	        	<img src = "/assets/images/1.jpg" />
	        	</div>
            </div>
       	</div>
       
    <!-- 팔로우 리뷰 작성 끝 -->
    
    <BR>
    <BR>
    
    <!-- 리뷰 작성 시작 -->
        <div class="thumbnail" style = "background-color:white;width:100%;"><BR>
        	<div class = "title" style = "margin-left:22px;"><font size = "4"><B>팔로우 리뷰</B></font>
        	</div><BR>
 <%
    	for(int i = 0 ; i < 2 ; i++) {
 %>		
 		<div class = "review" style = "background-color:white;width:100%;height:100px;">
			<div class = "profile" style = "width:100px;height:100px;float:left;margin-left:2%">
				<img src = "/assets/images/song.jpg" style = "width:100px;height:100px;"/></div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:20px;">제목 : 이 상품 너무 좋아요
			(<b>dofwk2@***** / 2015-05-29</b>)</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:20px;">내용 : </div>
		</div>
		<hr style = "width:100%;">
<%
    	}
%>
    </div>
    <!--  리뷰 작성 끝 -->
    
    <BR>
    
    <!--  리뷰 작성 시작 -->
    <div class="thumbnail" style = "background-color:white;width:100%;height:100%;"><BR>
        <div class = "title" style = "margin-left:22px;"><font size = "4"><B>리뷰</B></font></div><BR>
<%
    	for(int i = 0 ; i < 5 ; i++) {
 %>		
 		<div class = "review" style = "width:100%;">
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:20px;">제목 : 이 상품 너무 좋아요
			(<b>dofwk2@***** / 2015-05-29</b>)</div>
			<br>
			<BR>
			<div class = "name" style = "width:650px;height:60px;float:left;margin-left:20px;">내용 : </div>
		</div>
		<hr style = "width:100%;">
<%
    	}
%>
    </div>
</div>
    </body>
